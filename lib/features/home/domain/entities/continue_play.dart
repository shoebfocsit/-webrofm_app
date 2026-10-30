class ContinuePlay {
  final String episodeId;
  final String showId;
  final int position;
  final DateTime lastPlayed;

  const ContinuePlay({
    required this.episodeId,
    required this.showId,
    required this.position,
    required this.lastPlayed,
  });

  ContinuePlay copyWith({
    String? episodeId,
    String? showId,
    int? position,
    DateTime? lastPlayed,
  }) {
    return ContinuePlay(
      episodeId: episodeId ?? this.episodeId,
      showId: showId ?? this.showId,
      position: position ?? this.position,
      lastPlayed: lastPlayed ?? this.lastPlayed,
    );
  }

  Map<String, dynamic> toJson() => {
        'episode_id': episodeId,
        'show_id': showId,
        'position': position,
        'last_played': lastPlayed.toIso8601String(),
      };

  factory ContinuePlay.fromJson(Map<String, dynamic> json) => ContinuePlay(
        episodeId: json['episode_id'] as String,
        showId: json['show_id'] as String,
        position: (json['position'] as num).toInt(),
        lastPlayed: DateTime.parse(json['last_played'] as String),
      );
}
