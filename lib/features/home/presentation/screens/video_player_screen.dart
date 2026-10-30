import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:webrofm/core/services/audio_player_service.dart';
import 'package:webrofm/core/services/player_provider.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/share_utils.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/shared/widgets/local_cached_image.dart';
import 'package:webrofm/shared/widgets/content_disclaimer.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  final String showId;
  final dynamic episodeData;

  const VideoPlayerScreen({
    super.key,
    required this.showId,
    this.episodeData,
  });

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen> {
  Player? _videoPlayer;
  VideoController? _videoController;

  bool _isAudioMode = true;
  bool _isPlaying = false;
  bool _showControls = true;
  bool _isFavorited = false;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  double _playbackSpeed = 1.0;

  Timer? _controlsTimer;
  StreamSubscription? _positionSub;
  StreamSubscription? _playerStateSub;
  StreamSubscription? _errorSub;
  StreamSubscription? _videoPositionSub;
  StreamSubscription? _videoDurationSub;
  StreamSubscription? _videoStateSub;

  String? _imageUrl;

  DateTime _lastVideoResumeSave = DateTime.fromMillisecondsSinceEpoch(0);
  int _lastVideoSavedPosSec = -1;

  @override
  void initState() {
    super.initState();
    _resolveImageUrl();
    _initFromService();
    WakelockPlus.enable();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // NOTE: do not call `_maybeSaveVideoResume` here — `ref` is already
    // disposed at this point and it throws. Resume position is saved during
    // playback (throttled) and on pause instead.
    _controlsTimer?.cancel();
    _positionSub?.cancel();
    _playerStateSub?.cancel();
    _errorSub?.cancel();
    _videoPositionSub?.cancel();
    _videoDurationSub?.cancel();
    _videoStateSub?.cancel();
    _videoPlayer?.dispose();
    WakelockPlus.disable();
    super.dispose();
  }

  Future<void> _maybeSaveVideoResume({required bool throttled}) async {
    final ep = _resolveEpisode();
    if (ep == null) return;
    final pos = _isAudioMode
        ? ref.read(audioPlayerServiceProvider).player.state.position
        : (_videoPlayer?.state.position ?? _position);
    final dur = _isAudioMode
        ? ref.read(audioPlayerServiceProvider).player.state.duration
        : (_duration != Duration.zero ? _duration : (_videoPlayer?.state.duration ?? Duration.zero));
    if (pos.inSeconds < 5) return;
    if (dur.inSeconds > 0 && pos.inSeconds >= dur.inSeconds - 3) return;
    final now = DateTime.now();
    if (throttled) {
      if (now.difference(_lastVideoResumeSave).inSeconds < 20) return;
      if ((_lastVideoSavedPosSec - pos.inSeconds).abs() < 10) return;
    }
    _lastVideoResumeSave = now;
    _lastVideoSavedPosSec = pos.inSeconds;
    try {
      final repo = ref.read(showRepositoryProvider);
      await repo.updateContinuePlay(ep, pos.inSeconds);
      // ignore: unawaited_futures
      ref.read(homeNotifierProvider.notifier).fetchContinuePlay();
    } catch (_) {}
  }

  void _resolveImageUrl() {
    final ep = ref.read(audioPlayerServiceProvider).currentEpisode;
    _imageUrl = ep?.thumbnailUrl;

    if (_imageUrl == null || _imageUrl!.isEmpty) {
      final homeState = ref.read(homeNotifierProvider);
      final match = homeState.trending.firstWhereOrNull((s) => s.id == widget.showId);
      _imageUrl = match?.backdropUrl ?? match?.posterUrl;
    }

    if (_imageUrl == null || _imageUrl!.isEmpty) {
      if (widget.episodeData is Episode) {
        _imageUrl = (widget.episodeData as Episode).thumbnailUrl;
      } else if (widget.episodeData is Map) {
        _imageUrl = (widget.episodeData as Map)['thumbnail_url'] as String?;
      }
    }
  }

  void _initFromService() {
    final existing = ref.read(nowPlayingProvider);
    if (existing.episode != null) {
      _position = existing.position;
      _duration = existing.duration;
      _isPlaying = existing.isPlaying;
    }

    final playerService = ref.read(audioPlayerServiceProvider);
    final player = playerService.player;

    _positionSub = player.stream.position.listen((pos) {
      if (mounted) setState(() => _position = pos);
    });

    player.stream.duration.listen((d) {
      if (mounted) setState(() => _duration = d);
    });

    _playerStateSub = player.stream.playing.listen((playing) {
      if (!mounted) return;
      setState(() => _isPlaying = playing);
    });

    _errorSub = player.stream.error.listen((message) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.videoPlayerPlaybackError(message))),
      );
    });

    final ep = playerService.currentEpisode;
    String? dataEpId;
    if (widget.episodeData is Episode) {
      dataEpId = (widget.episodeData as Episode).id;
    } else if (widget.episodeData is Map) {
      dataEpId = ((widget.episodeData as Map)['id'] ?? '').toString();
    }

    final shouldPlay = ep == null ||
        (dataEpId != null && dataEpId.isNotEmpty && dataEpId != ep.id);
    if (shouldPlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _playFromWidgetData();
      });
    }
  }

  Future<void> _playFromWidgetData() async {
    String? audioUrl;
    Episode? episode;

    if (widget.episodeData is Episode) {
      episode = widget.episodeData as Episode;
      audioUrl = episode.audioUrl;
    } else if (widget.episodeData is Map) {
      final data = widget.episodeData as Map;
      audioUrl = data['audio_url'] as String?;
      final epId = (data['id'] ?? '').toString();
      if (epId.isNotEmpty) {
        episode = Episode(
          id: epId,
          showId: widget.showId,
          title: data['title'] as String? ?? '',
          description: data['description'] as String?,
          thumbnailUrl: data['thumbnail_url'] as String?,
          audioUrl: audioUrl,
          videoUrl: data['video_url'] as String?,
          duration: (data['duration_seconds'] as num?)?.toInt() ?? 0,
        );
      }
    }

    // Resolve from show episodes if no episode data passed
    if (episode == null) {
      final homeState = ref.read(homeNotifierProvider);
      if (homeState.currentEpisodes.isNotEmpty) {
        episode = homeState.currentEpisodes.first;
        audioUrl = episode.audioUrl;
      } else {
        // Fetch episodes for this show
        await ref.read(homeNotifierProvider.notifier).fetchShowEpisodes(widget.showId);
        final updated = ref.read(homeNotifierProvider);
        if (updated.currentEpisodes.isNotEmpty) {
          episode = updated.currentEpisodes.first;
          audioUrl = episode.audioUrl;
        }
      }
    }

    if (episode == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.videoPlayerNoAudio)),
        );
      }
      return;
    }

    _imageUrl ??= episode.thumbnailUrl;

    final service = ref.read(audioPlayerServiceProvider);
    final showEpisodes = ref.read(homeNotifierProvider).currentEpisodes;
    final targetId = episode.id;
    final startIndex = showEpisodes.indexWhere((e) => e.id == targetId);
    if (showEpisodes.isNotEmpty && startIndex >= 0) {
      service.setQueue(showEpisodes, startIndex: startIndex);
    }
    await service.play(
      episode,
      showTitle: episode.title,
      showThumbnail: _imageUrl,
    );
  }

  Episode? _resolveEpisode() {
    final ep = ref.read(audioPlayerServiceProvider).currentEpisode;
    if (ep != null) return ep;
    if (widget.episodeData is Episode) return widget.episodeData as Episode;
    if (widget.episodeData is Map) {
      final data = widget.episodeData as Map;
      return Episode(
        id: (data['id'] ?? '').toString(),
        showId: widget.showId,
        title: data['title'] as String? ?? '',
        description: data['description'] as String?,
        thumbnailUrl: data['thumbnail_url'] as String?,
        audioUrl: data['audio_url'] as String?,
        videoUrl: data['video_url'] as String?,
        duration: (data['duration_seconds'] as num?)?.toInt() ?? 0,
      );
    }
    return null;
  }

  Future<void> _disposeVideoPlayer() async {
    _videoPositionSub?.cancel();
    _videoDurationSub?.cancel();
    _videoStateSub?.cancel();
    _videoPositionSub = null;
    _videoDurationSub = null;
    _videoStateSub = null;

    final oldPlayer = _videoPlayer;
    // Drop the Video widget's reference *before* disposing the player, otherwise
    // the still-mounted Video rebuilds against a disposed controller notifier.
    if (mounted) {
      setState(() {
        _videoPlayer = null;
        _videoController = null;
      });
    } else {
      _videoPlayer = null;
      _videoController = null;
    }
    await oldPlayer?.dispose();
  }

  Future<void> _initVideoPlayer({Duration? startPosition}) async {
    await _disposeVideoPlayer();

    final ep = _resolveEpisode();
    var videoUrl = (ep != null && ep.videoUrl != null && ep.videoUrl!.isNotEmpty)
        ? ep.videoUrl!
        : null;

    if ((videoUrl == null || videoUrl.isEmpty) && ep != null) {
      final episodeId = int.tryParse(ep.id);
      if (episodeId != null) {
        try {
          final data = await ref.read(showRemoteSourceProvider).getFreshVideoUrl(episodeId);
          videoUrl = (data['video_url'] ?? data['hls_video_url']) as String?;
        } catch (_) {}
      }
    }

    final player = Player();
    _videoPlayer = player;
    _videoController = VideoController(player);

    _videoPositionSub = player.stream.position.listen((pos) {
      if (mounted) setState(() => _position = pos);
      _maybeSaveVideoResume(throttled: true);
    });
    _videoDurationSub = player.stream.duration.listen((d) {
      if (mounted) setState(() => _duration = d);
    });
    _videoStateSub = player.stream.playing.listen((playing) {
      if (mounted) setState(() => _isPlaying = playing);
      if (!playing) _maybeSaveVideoResume(throttled: false);
    });

    if (videoUrl == null || videoUrl.isEmpty) return;
    try {
      await player.open(Media(videoUrl), play: true);
      if (startPosition != null && startPosition > Duration.zero) {
        await player.seek(startPosition);
      }
    } catch (_) {}
  }

  void _toggleAudioVideo() {
    if (_isAudioMode) {
      final saved = _position;
      ref.read(audioPlayerServiceProvider).pause();
      _initVideoPlayer(startPosition: saved);
    } else {
      final saved = _videoPlayer?.state.position ?? Duration.zero;
      _disposeVideoPlayer();
      final service = ref.read(audioPlayerServiceProvider);
      if (saved > Duration.zero) service.seek(saved);
      service.resume();
    }
    setState(() {
      _isAudioMode = !_isAudioMode;
      if (!_isAudioMode) _showControls = true;
    });
    _autoHideControls();
  }

  void _togglePlayPause() {
    if (_isAudioMode) {
      ref.read(audioPlayerServiceProvider).togglePlayPause();
    } else {
      _videoPlayer?.playOrPause();
    }
    setState(() => _isPlaying = !_isPlaying);
    _autoHideControls();
  }

  void _seekRelative(int seconds) {
    final current = _isAudioMode
        ? _position
        : (_videoPlayer?.state.position ?? _position);
    final dur = _isAudioMode
        ? _duration
        : (_duration > Duration.zero
            ? _duration
            : (_videoPlayer?.state.duration ?? Duration.zero));
    var target = Duration(seconds: current.inSeconds + seconds);
    if (target < Duration.zero) target = Duration.zero;
    if (dur > Duration.zero && target > dur) target = dur;
    if (_isAudioMode) {
      ref.read(audioPlayerServiceProvider).seek(target);
    } else {
      _videoPlayer?.seek(target);
    }
    // Keep the slider/clock in sync immediately instead of waiting for the
    // position stream, then keep the controls visible after a seek.
    setState(() => _position = target);
    _showControlsTemporarily();
  }

  void _onSliderChange(double value) {
    final target = Duration(seconds: (value * _duration.inSeconds).round());
    if (_isAudioMode) {
      ref.read(audioPlayerServiceProvider).seek(target);
    } else {
      _videoPlayer?.seek(target);
    }
  }

  void _showControlsTemporarily() {
    setState(() => _showControls = true);
    _autoHideControls();
  }

  void _autoHideControls() {
    _controlsTimer?.cancel();
    _controlsTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) setState(() => _showControls = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _showControlsTemporarily,
        child: Stack(
          children: [
            _isAudioMode ? _buildAudioBackground(cs) : _buildVideoPlayer(),
            if (_showControls) _buildControlsOverlay(context, cs),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioBackground(ColorScheme cs) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageUrl = _imageUrl;
        return Stack(
          fit: StackFit.expand,
          children: [
            if (imageUrl != null && imageUrl.isNotEmpty) ...[
              ImageFiltered(
                imageFilter: ui.ImageFilter.blur(sigmaX: 22, sigmaY: 22),
                child: LocalCachedImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  borderRadius: 0,
                  errorWidget: (_, __, ___) => _buildGradientBg(cs),
                ),
              ),
              ColoredBox(color: Colors.black.withValues(alpha: 0.48)),
              Center(
                child: LocalCachedImage(
                  imageUrl: imageUrl,
                  width: constraints.maxWidth * 0.82,
                  height: constraints.maxHeight * 0.58,
                  fit: BoxFit.contain,
                  borderRadius: 18,
                  placeholder: (_, __) => _shimmerBg(),
                  errorWidget: (_, __, ___) => _buildGradientBg(cs),
                ),
              ),
            ] else
              _buildGradientBg(cs),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.12),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.55),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGradientBg(ColorScheme cs) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [cs.primary.withValues(alpha: 0.6), cs.secondary.withValues(alpha: 0.6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (_videoController == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Colors.white),
            const SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.videoPlayerLoading,
                style: const TextStyle(color: Colors.white70)),
          ],
        ),
      );
    }
    return Video(controller: _videoController!);
  }

  Widget _buildControlsOverlay(BuildContext context, ColorScheme cs) {
    return Positioned.fill(
      child: _isAudioMode
          ? Column(
              children: [
                _buildTopBar(context, cs),
                const Spacer(flex: 2),
                _buildCenterControls(context, cs),
                const Spacer(flex: 1),
                _buildBottomBar(context, cs),
              ],
            )
          : Stack(
              children: [
                Column(
                  children: [
                    _buildTopBar(context, cs),
                    const Spacer(),
                    _buildBottomBar(context, cs),
                  ],
                ),
                // Video mode: replay 10s | play-pause | forward 10s, dead center.
                Center(
                  child: _buildCenterControls(
                    context,
                    cs,
                    showSpeedSelector: false,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildTopBar(BuildContext context, ColorScheme cs) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: EdgeInsets.only(
            left: 4,
            right: 16,
            top: MediaQuery.of(context).padding.top + 4,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.4),
            border: Border(
              bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1), width: 0.5),
            ),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _isAudioMode
                      ? AppLocalizations.of(context)!.videoPlayerNowPlaying
                      : AppLocalizations.of(context)!.videoPlayerVideoPlayer,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {
                  final ep = _resolveEpisode();
                  final nowPlaying = ref.read(nowPlayingProvider);
                  if (ep != null) {
                    ShareUtils.shareEpisode(
                      title: ep.title,
                      showTitle: nowPlaying.showTitle,
                      episodeId: ep.id,
                    );
                  } else {
                    ShareUtils.shareApp();
                  }
                },
                icon: const Icon(Icons.share_rounded, color: Colors.white, size: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenterControls(
    BuildContext context,
    ColorScheme cs, {
    bool showSpeedSelector = true,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _controlButton(Icons.replay_10_rounded, () => _seekRelative(-10)),
            const SizedBox(width: 32),
            GestureDetector(
              onTap: _togglePlayPause,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.72),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.45), width: 1),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 20, offset: const Offset(0, 4)),
                  ],
                ),
                child: Icon(
                  _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  color: Colors.black87,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(width: 32),
            _controlButton(Icons.forward_10_rounded, () => _seekRelative(10)),
          ],
        ),
        if (showSpeedSelector) ...[
          const SizedBox(height: 24),
          _buildPlaybackSpeedSelector(context),
        ],
      ],
    );
  }

  Widget _buildPlaybackSpeedSelector(BuildContext context) {
    final speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: speeds.map((speed) {
        final isSelected = _playbackSpeed == speed;
        return GestureDetector(
          onTap: () {
            setState(() => _playbackSpeed = speed);
            if (_isAudioMode) {
              ref.read(audioPlayerServiceProvider).setSpeed(speed);
            } else {
              _videoPlayer?.setRate(speed);
            }
            _autoHideControls();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? Border.all(color: Colors.white.withValues(alpha: 0.3))
                  : null,
            ),
            child: Text(
              '${speed}x',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white60,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontFamily: 'Outfit',
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomBar(BuildContext context, ColorScheme cs) {
    final progress = _duration.inSeconds > 0
        ? (_position.inSeconds / _duration.inSeconds).clamp(0.0, 1.0)
        : 0.0;

    return ClipRRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 8,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.4),
            border: Border(
              top: BorderSide(color: Colors.white.withValues(alpha: 0.1), width: 0.5),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: ContentDisclaimer(onDark: true),
              ),
              const SizedBox(height: 8),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 4,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                  activeTrackColor: const Color(0xFFae3115),
                  inactiveTrackColor: Colors.white.withValues(alpha: 0.2),
                  thumbColor: const Color(0xFFae3115),
                  overlayColor: const Color(0xFFae3115).withValues(alpha: 0.12),
                ),
                child: Slider(
                  value: progress,
                  onChanged: _onSliderChange,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  children: [
                    Text(
                      _formatDuration(_position),
                      style: const TextStyle(color: Colors.white70, fontSize: 12, fontFamily: 'Outfit'),
                    ),
                    const Spacer(),
                    Text(
                      _formatDuration(_duration),
                      style: const TextStyle(color: Colors.white70, fontSize: 12, fontFamily: 'Outfit'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _actionButton(context, Icons.favorite_rounded, _isFavorited ? const Color(0xFFae3115) : Colors.white70, () {
                    setState(() => _isFavorited = !_isFavorited);
                  }),
                  _buildAudioVideoToggle(context, cs),
                  GestureDetector(
                    onTap: () {
                      ref.read(audioPlayerServiceProvider).playNext();
                      _autoHideControls();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFae3115), Color(0xFFff6b4a)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.skip_next_rounded, color: Colors.white, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalizations.of(context)!.videoPlayerNext,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _controlButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _actionButton(BuildContext context, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }

  Widget _buildAudioVideoToggle(BuildContext context, ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _isAudioMode ? null : _toggleAudioVideo,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: _isAudioMode ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.music_note_rounded, size: 14,
                      color: _isAudioMode ? Colors.white : Colors.white60),
                  const SizedBox(width: 4),
                  Text(
                    AppLocalizations.of(context)!.videoPlayerAudio,
                    style: TextStyle(
                      color: _isAudioMode ? Colors.white : Colors.white60,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Outfit',
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _isAudioMode ? _toggleAudioVideo : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: !_isAudioMode ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.videocam_rounded, size: 14,
                      color: !_isAudioMode ? Colors.white : Colors.white60),
                  const SizedBox(width: 4),
                  Text(
                    AppLocalizations.of(context)!.videoPlayerVideo,
                    style: TextStyle(
                      color: !_isAudioMode ? Colors.white : Colors.white60,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Outfit',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerBg() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Container(color: Colors.grey.shade800),
    );
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
