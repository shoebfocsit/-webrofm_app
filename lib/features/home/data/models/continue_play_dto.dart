import 'package:webrofm/features/home/domain/entities/continue_play.dart';

class ContinuePlayDTO {
  final String episodeId;
  final String showId;
  final int position;
  final String lastPlayed;
  final int? id;

  const ContinuePlayDTO({
    required this.episodeId,
    required this.showId,
    required this.position,
    required this.lastPlayed,
    this.id,
  });

  factory ContinuePlayDTO.fromJson(Map<String, dynamic> json) {
    String episodeId = '';
    String showId = '';
    if (json['episode'] is Map<String, dynamic>) {
      final ep = json['episode'] as Map<String, dynamic>;
      episodeId = (ep['id'] ?? '').toString();
      showId = (ep['show'] ?? '').toString();
    }
    return ContinuePlayDTO(
      id: (json['id'] as num?)?.toInt(),
      episodeId: episodeId,
      showId: showId,
      position: (json['last_position_seconds'] as num?)?.toInt() ??
          (json['position'] as num?)?.toInt() ??
          0,
      lastPlayed: json['updated_at'] as String? ??
          json['last_played'] as String? ??
          DateTime.now().toIso8601String(),
    );
  }

  Map<String, dynamic> toJson() => {
        'episode_id': episodeId,
        'show_id': showId,
        'last_position_seconds': position,
        'updated_at': lastPlayed,
      };

  ContinuePlay toDomain() => ContinuePlay(
        episodeId: episodeId,
        showId: showId,
        position: position,
        lastPlayed: DateTime.parse(lastPlayed),
      );

  factory ContinuePlayDTO.fromDomain(ContinuePlay continuePlay) =>
      ContinuePlayDTO(
        episodeId: continuePlay.episodeId,
        showId: continuePlay.showId,
        position: continuePlay.position,
        lastPlayed: continuePlay.lastPlayed.toIso8601String(),
      );
}
