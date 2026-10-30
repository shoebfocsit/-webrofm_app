class Show {
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
  final String? ageRating;
  final String? authorName;
  final Map<String, String> descriptions;
  final DateTime? createdAt;

  const Show({
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
    this.ageRating,
    this.authorName = 'WeBroFm Original',
    this.descriptions = const {},
    this.createdAt,
  });

  /// Returns description for [languageCode], fallback to default [description].
  String descriptionFor(String languageCode) {
    final v = descriptions[languageCode];
    if (v != null && v.isNotEmpty) return v;
    return description ?? '';
  }

  Show copyWith({
    String? id,
    String? title,
    String? description,
    String? posterUrl,
    String? backdropUrl,
    String? category,
    double? rating,
    int? episodeCount,
    String? language,
    bool? isNew,
    String? ageRating,
    String? authorName,
    Map<String, String>? descriptions,
    DateTime? createdAt,
  }) {
    return Show(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      posterUrl: posterUrl ?? this.posterUrl,
      backdropUrl: backdropUrl ?? this.backdropUrl,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      episodeCount: episodeCount ?? this.episodeCount,
      language: language ?? this.language,
      isNew: isNew ?? this.isNew,
      ageRating: ageRating ?? this.ageRating,
      authorName: authorName ?? this.authorName,
      descriptions: descriptions ?? this.descriptions,
      createdAt: createdAt ?? this.createdAt,
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
        'age_rating': ageRating,
        'author_name': authorName,
        'descriptions': descriptions,
        'created_at': createdAt?.toIso8601String(),
      };

  factory Show.fromJson(Map<String, dynamic> json) {
    final rawDescriptions = json['descriptions'];
    final map = <String, String>{};
    if (rawDescriptions is Map) {
      rawDescriptions.forEach((k, v) {
        map[k.toString()] = v?.toString() ?? '';
      });
    }
    return Show(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      posterUrl: json['poster_url'] as String?,
      backdropUrl: json['backdrop_url'] as String?,
      category: json['category'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      episodeCount: (json['episode_count'] as num?)?.toInt() ?? 0,
      language: json['language'] as String?,
      isNew: json['is_new'] as bool? ?? false,
      ageRating: json['age_rating'] as String?,
      authorName: (json['author_name'] as String? ?? json['authorName'] as String? ?? json['author'] as String? ?? json['crew'] as String?) ?? 'WeBroFm Original',
      descriptions: map,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
    );
  }
}
