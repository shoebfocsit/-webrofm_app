import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

class GetNewArrivals {
  final ShowRepository _repository;

  GetNewArrivals(this._repository);

  Future<ApiResult<List<Show>>> call() => _repository.getNewArrivals();
}
