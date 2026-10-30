import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:webrofm/core/services/audio_handler.dart';
import 'package:webrofm/core/services/player_provider.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';

class AudioPlayerService {
  final Player _player = Player();
  final Ref _ref;
  final WebrofmAudioHandler _audioHandler;

  Episode? _currentEpisode;
  String? _currentShowTitle;
  String? _currentShowThumbnail;
  final List<Episode> _queue = [];
  int _queueIndex = -1;

  StreamSubscription? _playerStateSub;
  StreamSubscription? _positionSub;
  StreamSubscription? _durationSub;
  StreamSubscription? _completedSub;
  StreamSubscription? _errorSub;

  DateTime _lastResumeSave = DateTime.fromMillisecondsSinceEpoch(0);
  int _lastSavedPosSec = -1;
  Duration _lastPositionUpdate = Duration.zero;

  AudioPlayerService(this._ref) : _audioHandler = _ref.read(audioHandlerProvider) {
    _wireNotificationActions();
    _setupListeners();
  }

  Player get player => _player;

  Episode? get currentEpisode => _currentEpisode;

  String? get currentShowTitle => _currentShowTitle;

  String? get currentShowThumbnail => _currentShowThumbnail;

  List<Episode> get queue => List.unmodifiable(_queue);

  bool get hasNext => _queueIndex < _queue.length - 1;

  bool get hasPrevious => _queueIndex > 0;

  void _wireNotificationActions() {
    _audioHandler.onPlay = () async {
      await _player.play();
      _ref.read(nowPlayingProvider.notifier).setPlaying(true);
      _audioHandler.updatePlaying(true);
    };
    _audioHandler.onPause = () async {
      await _player.pause();
      _ref.read(nowPlayingProvider.notifier).setPlaying(false);
      _audioHandler.updatePlaying(false);
    };
    _audioHandler.onSeek = (position) => _player.seek(position);
    _audioHandler.onSkipNext = playNext;
    _audioHandler.onSkipPrevious = playPrevious;
    _audioHandler.onStop = _onHandlerStop;
  }

  Future<void> _onHandlerStop() async {
    await _player.stop();
    _currentEpisode = null;
    _currentShowTitle = null;
    _currentShowThumbnail = null;
    _queue.clear();
    _queueIndex = -1;
    _ref.read(nowPlayingProvider.notifier).dismiss();
  }

  void _setupListeners() {
    _errorSub = _player.stream.error.listen((message) {
      debugPrint('MediaKit player error: $message');
    });

    _positionSub = _player.stream.position.listen((pos) {
      if ((pos - _lastPositionUpdate).abs().inMilliseconds >= 250 || pos == Duration.zero) {
        _lastPositionUpdate = pos;
        _ref.read(nowPlayingProvider.notifier).updateProgress(pos, _player.state.duration);
        _audioHandler.updatePosition(pos);
      }
      _maybeSaveResume(throttled: true);
    });

    _durationSub = _player.stream.duration.listen((d) {
      _ref.read(nowPlayingProvider.notifier).updateProgress(
        _player.state.position,
        d,
      );
    });

    _playerStateSub = _player.stream.playing.listen((playing) {
      _ref.read(nowPlayingProvider.notifier).setPlaying(playing);
      _audioHandler.updatePlaying(playing);
      if (!playing) {
        _maybeSaveResume(throttled: false);
      }
    });

    _completedSub = _player.stream.completed.listen((completed) {
      if (completed) {
        if (_queueIndex < _queue.length - 1) {
          _playAtIndex(_queueIndex + 1);
        } else {
          _player.seek(Duration.zero);
          _player.pause();
          _ref.read(nowPlayingProvider.notifier).setPlaying(false);
        }
      }
    });
  }

  static bool _isSameLanguage(Episode e1, Episode e2) {
    final code1 = (e1.languageCode ?? '').trim().toLowerCase();
    final name1 = (e1.languageName ?? '').trim().toLowerCase();
    final code2 = (e2.languageCode ?? '').trim().toLowerCase();
    final name2 = (e2.languageName ?? '').trim().toLowerCase();

    if (code1.isEmpty && name1.isEmpty && code2.isEmpty && name2.isEmpty) {
      return true;
    }
    if (code1.isNotEmpty && code2.isNotEmpty && code1 == code2) {
      return true;
    }
    if (name1.isNotEmpty && name2.isNotEmpty && name1 == name2) {
      return true;
    }
    if (code1.isNotEmpty && name2.contains(code1)) return true;
    if (code2.isNotEmpty && name1.contains(code2)) return true;
    if ((code1 == 'hi' || name1.contains('hindi') || name1.contains('हिंदी')) &&
        (code2 == 'hi' || name2.contains('hindi') || name2.contains('हिंदी'))) {
      return true;
    }
    return false;
  }

  void setQueue(List<Episode> episodes, {int startIndex = 0}) {
    _queue.clear();
    if (episodes.isEmpty) {
      _queueIndex = -1;
      return;
    }

    final validIndex = (startIndex >= 0 && startIndex < episodes.length) ? startIndex : 0;
    final targetEpisode = episodes[validIndex];

    final filteredEpisodes = episodes.where((e) => _isSameLanguage(e, targetEpisode)).toList();

    _queue.addAll(filteredEpisodes.isNotEmpty ? filteredEpisodes : episodes);

    final newIndex = _queue.indexWhere((e) => e.id == targetEpisode.id);
    _queueIndex = newIndex >= 0 ? newIndex : 0;
  }

  Future<void> play(
    Episode episode, {
    String? showTitle,
    String? showThumbnail,
  }) async {
    _currentEpisode = episode;
    _currentShowTitle = showTitle;
    _currentShowThumbnail = showThumbnail;

    _audioHandler.updateNowPlaying(
      id: episode.id,
      title: episode.title.isNotEmpty ? episode.title : (showTitle ?? 'WebroFM'),
      album: showTitle,
      artist: 'WebroFM',
      artUrl: showThumbnail ?? episode.thumbnailUrl,
      duration: Duration(seconds: episode.duration),
    );

    // Update UI immediately so mini player appears right away
    _ref.read(nowPlayingProvider.notifier).play(
      episode,
      showTitle: showTitle,
      showThumbnail: showThumbnail,
    );

    if (episode.audioUrl == null || episode.audioUrl!.isEmpty) {
      await _refreshAndPlay(
        episode,
        showTitle: showTitle,
        showThumbnail: showThumbnail,
      );
      return;
    }

    try {
      await _player.open(Media(episode.audioUrl!));
      _ref.read(nowPlayingProvider.notifier).setPlaying(true);
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        await _refreshAndPlay(episode, showTitle: showTitle, showThumbnail: showThumbnail);
      }
    } catch (_) {
      await _refreshAndPlay(episode, showTitle: showTitle, showThumbnail: showThumbnail);
    }
  }

  Future<void> openVideo(
    Episode episode, {
    String? showTitle,
    String? showThumbnail,
  }) async {
    _currentEpisode = episode;
    _currentShowTitle = showTitle;
    _currentShowThumbnail = showThumbnail;

    _audioHandler.updateNowPlaying(
      id: episode.id,
      title: episode.title.isNotEmpty ? episode.title : (showTitle ?? 'WebroFM'),
      album: showTitle,
      artist: 'WebroFM',
      artUrl: showThumbnail ?? episode.thumbnailUrl,
      duration: Duration(seconds: episode.duration),
    );

    _ref.read(nowPlayingProvider.notifier).play(
      episode,
      showTitle: showTitle,
      showThumbnail: showThumbnail,
    );

    final url = (episode.videoUrl != null && episode.videoUrl!.isNotEmpty)
        ? episode.videoUrl!
        : episode.audioUrl;
    if (url == null || url.isEmpty) return;

    try {
      await _player.open(Media(url));
      _ref.read(nowPlayingProvider.notifier).setPlaying(true);
    } catch (_) {
      await _refreshAndPlay(episode, showTitle: showTitle, showThumbnail: showThumbnail);
    }
  }

  Future<void> _refreshAndPlay(
    Episode episode, {
    String? showTitle,
    String? showThumbnail,
  }) async {
    try {
      final epId = int.tryParse(episode.id);
      if (epId == null) return;
      final remoteSource = _ref.read(showRemoteSourceProvider);
      final freshData = await remoteSource.getFreshAudioUrl(epId);
      final freshUrl = (freshData['audio_url'] ?? freshData['hls_url'] ?? '') as String;
      if (freshUrl.isEmpty) return;
      await _player.open(Media(freshUrl));

      _ref.read(nowPlayingProvider.notifier).play(
        episode,
        showTitle: showTitle,
        showThumbnail: showThumbnail,
      );
    } catch (_) {}
  }

  Future<void> _playAtIndex(int index) async {
    if (index < 0 || index >= _queue.length) return;
    _queueIndex = index;
    await play(_queue[index], showTitle: _currentShowTitle, showThumbnail: _currentShowThumbnail);
  }

  Future<void> playNext() async {
    if (hasNext) {
      await _playAtIndex(_queueIndex + 1);
    }
  }

  Future<void> playPrevious() async {
    if (hasPrevious) {
      await _playAtIndex(_queueIndex - 1);
    }
  }

  Future<void> pause() async {
    await _maybeSaveResume(throttled: false);
    await _player.pause();
  }

  Future<void> resume() async {
    if (_currentEpisode == null) {
      final nowPlaying = _ref.read(nowPlayingProvider);
      if (nowPlaying.episode != null) {
        await play(
          nowPlaying.episode!,
          showTitle: nowPlaying.showTitle,
          showThumbnail: nowPlaying.showThumbnail,
        );
        if (nowPlaying.position > Duration.zero) {
          await Future.delayed(const Duration(milliseconds: 300));
          await seek(nowPlaying.position);
        }
        return;
      }
    }
    await _player.play();
  }

  Future<void> togglePlayPause() async {
    if (_player.state.playing) {
      await pause();
    } else {
      await resume();
    }
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  Future<void> seekForward({int seconds = 10}) async {
    final current = _player.state.position;
    final target = current + Duration(seconds: seconds);
    final duration = _player.state.duration;
    await _player.seek(target > duration ? duration : target);
  }

  Future<void> seekBackward({int seconds = 10}) async {
    final current = _player.state.position;
    final target = current - Duration(seconds: seconds);
    await _player.seek(target < Duration.zero ? Duration.zero : target);
  }

  Future<void> setSpeed(double speed) async {
    await _player.setRate(speed);
  }

  Future<void> stop() async {
    await _maybeSaveResume(throttled: false);
    await _player.stop();
    _currentEpisode = null;
    _queue.clear();
    _queueIndex = -1;
    _ref.read(nowPlayingProvider.notifier).stop();
    await _audioHandler.stop();
  }

  Future<void> dismissMiniPlayer() async {
    await _maybeSaveResume(throttled: false);
    await _player.pause();
    _ref.read(nowPlayingProvider.notifier).dismissMiniPlayer();
    _audioHandler.updatePlaying(false);
  }

  Future<void> dismiss() async {
    await _maybeSaveResume(throttled: false);
    await _player.stop();
    _currentEpisode = null;
    _currentShowTitle = null;
    _currentShowThumbnail = null;
    _queue.clear();
    _queueIndex = -1;
    _ref.read(nowPlayingProvider.notifier).dismiss();
    await _audioHandler.stop();
  }

  Future<void> _maybeSaveResume({required bool throttled}) async {
    final ep = _currentEpisode;
    if (ep == null) return;
    final pos = _player.state.position;
    if (pos.inSeconds < 5) return;
    final dur = _player.state.duration;
    if (dur.inSeconds > 0 && pos.inSeconds >= dur.inSeconds - 3) return;
    final now = DateTime.now();
    if (throttled) {
      if (now.difference(_lastResumeSave).inSeconds < 20) return;
      if ((_lastSavedPosSec - pos.inSeconds).abs() < 10) return;
    }
    _lastResumeSave = now;
    _lastSavedPosSec = pos.inSeconds;
    try {
      final repo = _ref.read(showRepositoryProvider);
      await repo.updateContinuePlay(ep, pos.inSeconds);
      // refresh continue list in background
      // ignore: unawaited_futures
      _ref.read(homeNotifierProvider.notifier).fetchContinuePlay();
    } catch (_) {}
  }

  void dispose() {
    _positionSub?.cancel();
    _durationSub?.cancel();
    _playerStateSub?.cancel();
    _completedSub?.cancel();
    _errorSub?.cancel();
    _player.dispose();
  }
}

final audioPlayerServiceProvider = Provider<AudioPlayerService>((ref) {
  final service = AudioPlayerService(ref);
  ref.onDispose(() => service.dispose());
  return service;
});
