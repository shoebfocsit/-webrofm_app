import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/data/models/episode_dto.dart';
import 'package:webrofm/core/utils/profile_utils.dart';

class ShowDTO {
  final String id;
  final String title;
  final String? description;
  final String? posterUrl;
  final String? backdropUrl;
  final String? category;
  final double rating;
  final int episodeCount;
  final String? language;
  final bool isNew;
  final List<EpisodeDTO> episodes;
  final String? thumbnail;
  final String? categoryName;
  final String? ageRating;
  final String? languageName;
  final String? languageCode;
  final String? authorName;
  final Map<String, String> descriptions;
  final DateTime? createdAt;

  const ShowDTO({
    required this.id,
    required this.title,
    this.description,
    this.posterUrl,
    this.backdropUrl,
    this.category,
    this.rating = 0.0,
    this.episodeCount = 0,
    this.language,
    this.isNew = false,
    this.episodes = const [],
    this.thumbnail,
    this.categoryName,
    this.ageRating,
    this.languageName,
    this.languageCode,
    this.authorName,
    this.descriptions = const {},
    this.createdAt,
  });

  factory ShowDTO.fromJson(
    Map<String, dynamic> json, {
    bool includeEpisodes = true,
  }) {
    final thumbnailUrl = resolvePublicImageUrl(
      json['thumbnail_url'] as String? ?? json['thumbnail'] as String?,
    );
    final posterUrl = resolvePublicImageUrl(json['poster_url'] as String?) ?? thumbnailUrl;
    final backdropUrl = resolvePublicImageUrl(json['backdrop_url'] as String?) ?? posterUrl;
    final rawEpisodes = json['episodes'] as List<dynamic>?;
    final episodeList = includeEpisodes
        ? rawEpisodes
                ?.map((e) => EpisodeDTO.fromJson(e as Map<String, dynamic>))
                .toList() ??
            []
        : <EpisodeDTO>[];
    return ShowDTO(
      id: (json['id'] ?? '').toString(),
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      posterUrl: posterUrl,
      backdropUrl: backdropUrl,
      category: json['category_name'] as String? ?? json['category'] as String?,
        rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
        episodeCount: _parseEpisodeCount(json, rawEpisodes),
      language: json['language_name'] as String? ?? json['language'] as String?,
      isNew: json['is_new'] as bool? ?? false,
      episodes: episodeList,
      thumbnail: thumbnailUrl,
      categoryName: json['category_name'] as String? ?? json['category'] as String?,
      ageRating: json['age_rating'] as String?,
      languageName: json['language_name'] as String? ?? json['language'] as String?,
      languageCode: json['language_code'] as String?,
      authorName: (json['author_name'] as String? ?? json['authorName'] as String? ?? json['author'] as String? ?? json['crew'] as String?) ?? 'WeBroFm Original',
      descriptions: _parseDescriptions(json['descriptions']),
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'poster_url': posterUrl,
        'backdrop_url': backdropUrl,
        'category': category,
        'rating': rating,
        'episode_count': episodeCount,
        'language': language,
        'is_new': isNew,
        'thumbnail': thumbnail,
        'category_name': categoryName,
        'age_rating': ageRating,
        'language_name': languageName,
        'language_code': languageCode,
        'author_name': authorName,
        'descriptions': descriptions,
        'episodes': episodes.map((e) => e.toJson()).toList(),
        'created_at': createdAt?.toIso8601String(),
      };

  Show toDomain() => Show(
        id: id,
        title: title,
        description: description,
        posterUrl: posterUrl,
        backdropUrl: backdropUrl,
        category: category,
        rating: rating,
        episodeCount: episodeCount,
        language: language,
        isNew: isNew,
        ageRating: ageRating,
        authorName: authorName,
        descriptions: descriptions,
        createdAt: createdAt,
      );

  static Map<String, String> _parseDescriptions(dynamic raw) {
    final map = <String, String>{};
    if (raw is Map) {
      raw.forEach((k, v) {
        map[k.toString()] = v?.toString() ?? '';
      });
    }
    return map;
  }

  static int _parseEpisodeCount(
    Map<String, dynamic> json,
    List<dynamic>? rawEpisodes,
  ) {
    for (final key in const [
      'episode_count',
      'episodes_count',
      'total_episodes',
      'number_of_episodes',
      'episodeCount',
    ]) {
      final value = json[key];
      if (value is num) return value.toInt();
    }
    return rawEpisodes?.length ?? 0;
  }

  factory ShowDTO.fromDomain(Show show) => ShowDTO(
        id: show.id,
        title: show.title,
        description: show.description,
        posterUrl: show.posterUrl,
        backdropUrl: show.backdropUrl,
        category: show.category,
        rating: show.rating,
        episodeCount: show.episodeCount,
        language: show.language,
        isNew: show.isNew,
        ageRating: show.ageRating,
        authorName: show.authorName,
        descriptions: show.descriptions,
      );
}
