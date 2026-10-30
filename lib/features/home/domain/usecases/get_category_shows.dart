import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

class GetCategoryShows {
  final ShowRepository _repository;

  GetCategoryShows(this._repository);

  Future<ApiResult<List<Show>>> call(String category) =>
      _repository.getCategoryShows(category);
}
