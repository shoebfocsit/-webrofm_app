import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

class GetAllCategories {
  final ShowRepository _repository;

  GetAllCategories(this._repository);

  Future<ApiResult<List<ShowCategory>>> call() => _repository.getAllCategories();
}
