import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/domain/entities/continue_play.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/features/home/domain/entities/preload_data.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';

abstract class ShowRepository {
  Future<ApiResult<PreloadData>> getPreload({String? languageCode});
  Future<PreloadData?> getLocalPreload();
  Future<ApiResult<List<Show>>> getTrending();
  Future<ApiResult<List<Show>>> getNewArrivals();
  /// Fetches `recent` list from GET /api/home/ — backend order, no client sort.
  Future<ApiResult<List<Show>>> getNewArrivalsFromApi({String? languageCode});
  /// Fetches paginated shows from GET /api/shows/ for See All screen.
  Future<ApiResult<List<Show>>> getShowsList({String? languageCode, int page = 1});
  Future<ApiResult<List<Show>>> getCategoryShows(String category);
  Future<ApiResult<List<ShowCategory>>> getAllCategories();
  Future<ApiResult<List<Episode>>> getShowEpisodes(String showId);
  Future<ApiResult<List<Show>>> getMoreLikeThis(String showId);
  Future<ApiResult<List<ContinuePlay>>> getContinuePlay();
  Future<ApiResult<List<Show>>> searchShows(String query);
  Future<ApiResult<void>> updateContinuePlay(Episode episode, int position);
  Future<ApiResult<bool>> toggleLike(int episodeId);
  Future<ApiResult<bool>> toggleFavorite(int showId);
}
