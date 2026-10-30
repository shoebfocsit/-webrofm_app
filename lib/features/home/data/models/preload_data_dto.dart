import 'package:webrofm/features/home/data/models/category_dto.dart';
import 'package:webrofm/features/home/data/models/language_dto.dart';
import 'package:webrofm/features/home/data/models/show_dto.dart';
import 'package:webrofm/features/home/data/models/teaser_dto.dart';
import 'package:webrofm/features/home/domain/entities/preload_data.dart';

class PreloadDataDTO {
  final List<ShowDTO> shows;
  final List<ShowCategoryDTO> categories;
  final List<TeaserDTO> teasers;
  final List<LanguageDTO> languages;

  const PreloadDataDTO({
    required this.shows,
    required this.categories,
    required this.teasers,
    required this.languages,
  });

  factory PreloadDataDTO.fromJson(Map<String, dynamic> json) => PreloadDataDTO(
        shows: (json['shows'] as List<dynamic>?)
                ?.map((e) => ShowDTO.fromJson(
                    e as Map<String, dynamic>,
                    includeEpisodes: false,
                  ))
                .toList() ??
            [],
        categories: (json['categories'] as List<dynamic>?)
                ?.map(
                    (e) => ShowCategoryDTO.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        teasers: (json['teasers'] as List<dynamic>?)
                ?.map((e) => TeaserDTO.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        languages: (json['languages'] as List<dynamic>?)
                ?.map((e) => LanguageDTO.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );

  PreloadData toDomain() => PreloadData(
        shows: shows.map((e) => e.toDomain()).toList(),
        categories: categories.map((e) => e.toDomain()).toList(),
        teasers: teasers.map((e) => e.toDomain()).toList(),
        languages: languages.map((e) => e.toDomain()).toList(),
      );
}
