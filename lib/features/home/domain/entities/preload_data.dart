import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/domain/entities/language.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/domain/entities/teaser.dart';

class PreloadData {
  final List<Show> shows;
  final List<ShowCategory> categories;
  final List<Teaser> teasers;
  final List<Language> languages;

  const PreloadData({
    required this.shows,
    required this.categories,
    required this.teasers,
    required this.languages,
  });
}
