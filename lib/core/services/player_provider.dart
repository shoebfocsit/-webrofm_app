import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';

class NowPlayingState {
  final Episode? episode;
  final String? showTitle;
  final String? showThumbnail;
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final bool isMiniPlayerDismissed;

  const NowPlayingState({
    this.episode,
    this.showTitle,
    this.showThumbnail,
    this.isPlaying = false,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.isMiniPlayerDismissed = false,
  });

  NowPlayingState copyWith({
    Episode? episode,
    String? showTitle,
    String? showThumbnail,
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    bool? isMiniPlayerDismissed,
  }) {
    return NowPlayingState(
      episode: episode ?? this.episode,
      showTitle: showTitle ?? this.showTitle,
      showThumbnail: showThumbnail ?? this.showThumbnail,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isMiniPlayerDismissed: isMiniPlayerDismissed ?? this.isMiniPlayerDismissed,
    );
  }
}

class NowPlayingNotifier extends StateNotifier<NowPlayingState> {
  final GetStorage _storage = GetStorage();
  static const _storageKey = 'last_played_session';
  DateTime _lastProgressSave = DateTime.fromMillisecondsSinceEpoch(0);

  NowPlayingNotifier() : super(const NowPlayingState()) {
    _loadPersistedState();
  }

  void _loadPersistedState() {
    try {
      final raw = _storage.read(_storageKey);
      if (raw != null) {
        final data = raw is Map<String, dynamic>
            ? raw
            : Map<String, dynamic>.from(raw as Map);
        if (data['episode'] != null) {
          final epMap = data['episode'] is Map<String, dynamic>
              ? data['episode'] as Map<String, dynamic>
              : Map<String, dynamic>.from(data['episode'] as Map);
          final ep = Episode.fromJson(epMap);
          final showTitle = data['show_title'] as String?;
          final showThumbnail = data['show_thumbnail'] as String?;
          final posMs = (data['position_ms'] as num?)?.toInt() ?? 0;
          final durMs = (data['duration_ms'] as num?)?.toInt() ?? (ep.duration * 1000);
          state = NowPlayingState(
            episode: ep,
            showTitle: showTitle,
            showThumbnail: showThumbnail,
            isPlaying: false,
            isMiniPlayerDismissed: false,
            position: Duration(milliseconds: posMs),
            duration: Duration(milliseconds: durMs),
          );
        }
      }
    } catch (e) {
      debugPrint('Error loading persisted now playing state: $e');
    }
  }

  void _savePersistedState() {
    try {
      if (state.episode != null) {
        _storage.write(_storageKey, {
          'episode': state.episode!.toJson(),
          'show_title': state.showTitle,
          'show_thumbnail': state.showThumbnail,
          'position_ms': state.position.inMilliseconds,
          'duration_ms': state.duration.inMilliseconds,
        });
      }
    } catch (e) {
      debugPrint('Error saving persisted now playing state: $e');
    }
  }

  void play(Episode episode, {String? showTitle, String? showThumbnail}) {
    state = NowPlayingState(
      episode: episode,
      showTitle: showTitle,
      showThumbnail: showThumbnail,
      isPlaying: true,
      isMiniPlayerDismissed: false,
      position: Duration.zero,
      duration: Duration(seconds: episode.duration),
    );
    _savePersistedState();
  }

  void updateProgress(Duration position, Duration duration) {
    if (state.episode == null) return;
    state = state.copyWith(position: position, duration: duration);
    final now = DateTime.now();
    if (now.difference(_lastProgressSave).inSeconds >= 5) {
      _lastProgressSave = now;
      _savePersistedState();
    }
  }

  void setPlaying(bool playing) {
    if (state.episode == null) return;
    state = state.copyWith(
      isPlaying: playing,
      isMiniPlayerDismissed: playing ? false : state.isMiniPlayerDismissed,
    );
    _savePersistedState();
  }

  void stop() {
    state = state.copyWith(isPlaying: false);
    _savePersistedState();
  }

  void dismissMiniPlayer() {
    state = state.copyWith(isPlaying: false, isMiniPlayerDismissed: true);
    _savePersistedState();
  }

  void dismiss() {
    state = state.copyWith(isPlaying: false, isMiniPlayerDismissed: true);
    _savePersistedState();
  }
}

final nowPlayingProvider = StateNotifierProvider<NowPlayingNotifier, NowPlayingState>((ref) {
  return NowPlayingNotifier();
});
