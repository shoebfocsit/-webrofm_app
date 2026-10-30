import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

class GetShowEpisodes {
  final ShowRepository _repository;

  GetShowEpisodes(this._repository);

  Future<ApiResult<List<Episode>>> call(String showId) =>
      _repository.getShowEpisodes(showId);
}
