import 'package:audio_service/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioHandlerProvider = Provider<WebrofmAudioHandler>((ref) {
  throw UnimplementedError('audioHandlerProvider must be overridden with the handler from AudioService.init');
});

class WebrofmAudioHandler extends BaseAudioHandler with SeekHandler {
  Future<void> Function()? onPlay;
  Future<void> Function()? onPause;
  Future<void> Function(Duration position)? onSeek;
  Future<void> Function()? onSkipNext;
  Future<void> Function()? onSkipPrevious;
  Future<void> Function()? onStop;

  void updateNowPlaying({
    required String id,
    required String title,
    String? album,
    String? artist,
    String? artUrl,
    Duration? duration,
  }) {
    mediaItem.add(
      MediaItem(
        id: id,
        title: title,
        album: album,
        artist: artist ?? 'WebroFM',
        duration: duration,
        artUri: artUrl != null && artUrl.isNotEmpty ? Uri.tryParse(artUrl) : null,
      ),
    );
    _emitPlaybackState(true);
  }

  void updatePlaying(bool playing) {
    _emitPlaybackState(playing);
  }

  void updatePosition(Duration position) {
    playbackState.add(
      playbackState.value.copyWith(updatePosition: position),
    );
  }

  void _emitPlaybackState(bool playing) {
    playbackState.add(
      playbackState.value.copyWith(
        playing: playing,
        processingState: playing ? AudioProcessingState.ready : AudioProcessingState.idle,
        controls: [
          MediaControl.skipToPrevious,
          playing ? MediaControl.pause : MediaControl.play,
          MediaControl.skipToNext,
        ],
        systemActions: const {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
          MediaAction.play,
          MediaAction.pause,
        },
        androidCompactActionIndices: const [0, 1, 2],
      ),
    );
  }

  Future<void> _markStopped() async {
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        processingState: AudioProcessingState.idle,
      ),
    );
    await super.stop();
  }

  @override
  Future<void> play() async => onPlay?.call();

  @override
  Future<void> pause() async => onPause?.call();

  @override
  Future<void> seek(Duration position) async => onSeek?.call(position);

  @override
  Future<void> skipToNext() async => onSkipNext?.call();

  @override
  Future<void> skipToPrevious() async => onSkipPrevious?.call();

  @override
  Future<void> stop() async {
    await onStop?.call();
    await _markStopped();
  }
}
