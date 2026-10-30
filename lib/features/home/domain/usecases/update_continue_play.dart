import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

class UpdateContinuePlay {
  final ShowRepository _repository;

  UpdateContinuePlay(this._repository);

  Future<ApiResult<void>> call(Episode episode, int position) =>
      _repository.updateContinuePlay(episode, position);
}
