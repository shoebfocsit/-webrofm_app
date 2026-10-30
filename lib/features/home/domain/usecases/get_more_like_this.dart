import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

class GetMoreLikeThis {
  final ShowRepository _repository;

  GetMoreLikeThis(this._repository);

  Future<ApiResult<List<Show>>> call(String showId) =>
      _repository.getMoreLikeThis(showId);
}
