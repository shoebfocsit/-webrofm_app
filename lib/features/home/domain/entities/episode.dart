class Episode {
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
  final String? languageCode;
  final String? languageName;
  final DateTime? createdAt;

  const Episode({
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
    this.languageCode,
    this.languageName,
    this.createdAt,
  });

  Episode copyWith({
    String? id,
    String? showId,
    String? title,
    String? description,
    String? thumbnailUrl,
    String? audioUrl,
    String? videoUrl,
    int? duration,
    int? seasonNumber,
    int? episodeNumber,
    String? languageCode,
    String? languageName,
    DateTime? createdAt,
  }) {
    return Episode(
      id: id ?? this.id,
      showId: showId ?? this.showId,
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      duration: duration ?? this.duration,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      languageCode: languageCode ?? this.languageCode,
      languageName: languageName ?? this.languageName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'show_id': showId,
        'title': title,
        'description': description,
        'thumbnail_url': thumbnailUrl,
        'audio_url': audioUrl,
        'video_url': videoUrl,
        'duration': duration,
        'season_number': seasonNumber,
        'episode_number': episodeNumber,
        'language_code': languageCode,
        'language_name': languageName,
        'created_at': createdAt?.toIso8601String(),
      };

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json['id'] as String,
        showId: json['show_id'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
        thumbnailUrl: json['thumbnail_url'] as String?,
        audioUrl: json['audio_url'] as String?,
        videoUrl: json['video_url'] as String?,
        duration: (json['duration'] as num?)?.toInt() ?? 0,
        seasonNumber: (json['season_number'] as num?)?.toInt() ?? 1,
        episodeNumber: (json['episode_number'] as num?)?.toInt() ?? 1,
        languageCode: json['language_code'] as String?,
        languageName: json['language_name'] as String?,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
      );
}
