import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/domain/entities/continue_play.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

class GetContinuePlay {
  final ShowRepository _repository;

  GetContinuePlay(this._repository);

  Future<ApiResult<List<ContinuePlay>>> call() => _repository.getContinuePlay();
}
