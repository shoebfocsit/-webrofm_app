import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

class SearchShows {
  final ShowRepository _repository;

  SearchShows(this._repository);

  Future<ApiResult<List<Show>>> call(String query) => _repository.searchShows(query);
}
