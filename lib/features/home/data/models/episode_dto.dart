import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/core/utils/profile_utils.dart';

class EpisodeDTO {
  final String id;
  final String showId;
  final String title;
  final String? description;
  final String? thumbnailUrl;
  final String? audioUrl;
  final String? videoUrl;
  final int duration;
  final int seasonNumber;
  final int episodeNumber;
  final String? createdAt;
  final int? durationSeconds;
  final int? sequenceNumber;
  final String? languageName;
  final String? languageCode;
  final String? audioFileKey;
  final String? hlsPlaylistKey;
  final int? show;

  const EpisodeDTO({
    required this.id,
    required this.showId,
    required this.title,
    this.description,
    this.thumbnailUrl,
    this.audioUrl,
    this.videoUrl,
    this.duration = 0,
    this.seasonNumber = 1,
    this.episodeNumber = 1,
    this.createdAt,
    this.durationSeconds,
    this.sequenceNumber,
    this.languageName,
    this.languageCode,
    this.audioFileKey,
    this.hlsPlaylistKey,
    this.show,
  });

  factory EpisodeDTO.fromJson(Map<String, dynamic> json) {
    final seqNum = (json['sequence_number'] as num?)?.toInt() ?? 1;
    return EpisodeDTO(
      id: (json['id'] ?? '').toString(),
      showId: (json['show'] ?? json['show_id'] ?? '').toString(),
      show: (json['show'] as num?)?.toInt(),
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      thumbnailUrl: resolvePublicImageUrl(json['thumbnail_url'] as String?),
      audioUrl: json['audio_url'] as String?,
      videoUrl: json['video_url'] as String?,
      duration: (json['duration_seconds'] as num?)?.toInt() ??
          (json['duration'] as num?)?.toInt() ??
          0,
      seasonNumber: (json['season_number'] as num?)?.toInt() ?? seqNum,
      episodeNumber: (json['episode_number'] as num?)?.toInt() ?? seqNum,
      createdAt: json['created_at'] as String?,
      durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
      sequenceNumber: seqNum,
      languageName: json['language_name'] as String?,
      languageCode: json['language_code'] as String?,
      audioFileKey: json['audio_file_key'] as String?,
      hlsPlaylistKey: json['hls_playlist_key'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'show_id': showId,
        'show': show,
        'title': title,
        'description': description,
        'thumbnail_url': thumbnailUrl,
        'audio_url': audioUrl,
        'video_url': videoUrl,
        'duration': duration,
        'duration_seconds': durationSeconds ?? duration,
        'season_number': seasonNumber,
        'sequence_number': sequenceNumber ?? episodeNumber,
        'episode_number': episodeNumber,
        'created_at': createdAt,
        'language_name': languageName,
        'language_code': languageCode,
        'audio_file_key': audioFileKey,
        'hls_playlist_key': hlsPlaylistKey,
      };

  Episode toDomain() => Episode(
        id: id,
        showId: showId,
        title: title,
        description: description,
        thumbnailUrl: thumbnailUrl,
        audioUrl: audioUrl,
        videoUrl: videoUrl,
        duration: duration,
        seasonNumber: seasonNumber,
        episodeNumber: episodeNumber,
        languageCode: languageCode,
        languageName: languageName,
        createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
      );

  factory EpisodeDTO.fromDomain(Episode episode) => EpisodeDTO(
        id: episode.id,
        showId: episode.showId,
        title: episode.title,
        description: episode.description,
        thumbnailUrl: episode.thumbnailUrl,
        audioUrl: episode.audioUrl,
        videoUrl: episode.videoUrl,
        duration: episode.duration,
        seasonNumber: episode.seasonNumber,
        episodeNumber: episode.episodeNumber,
        languageCode: episode.languageCode,
        languageName: episode.languageName,
        createdAt: episode.createdAt?.toIso8601String(),
      );
}
