import 'package:webrofm/core/constants/app_constants.dart';

class ApiEndpoints {
  ApiEndpoints._();

  static String get _baseUrl => '${AppConstants.baseUrl}${AppConstants.apiSubUrl}';

  // Auth
  static String get sendOtp => '${_baseUrl}/auth/send-otp/';
  static String get verifyOtp => '${_baseUrl}/auth/verify-otp/';
  static String get logout => '${_baseUrl}/auth/logout/';
  static String get tokenRefresh => '${_baseUrl}/token/refresh/';

  // Profile
  static String get profile => '${_baseUrl}/auth/profile/';

  // Home / Preload
  static String get homePreload => '${_baseUrl}/home/preload/';
  static String get home => '${_baseUrl}/home/';
  static String get homeTrending => '${_baseUrl}/home/trending/';

  // Shows & Episodes
  static String get showsList => '${_baseUrl}/shows/';
  static String showsEpisodes(int showId) => '${_baseUrl}/shows/$showId/episodes/';
  static String playEpisode(int episodeId) => '${_baseUrl}/play/ep/$episodeId/';
  static String playVideo(int episodeId) => '${_baseUrl}/play/video/$episodeId/';

  // Interactions
  static String get likeToggle => '${_baseUrl}/user/like/toggle/';
  static String get favoriteToggle => '${_baseUrl}/user/favorite/toggle/';
  static String get favorites => '${_baseUrl}/user/favorites/';
  static String get comments => '${_baseUrl}/user/comments/';
  static String get feedback => '${_baseUrl}/user/feedback/';

  // Continue Playing
  static String get resumeUpdate => '${_baseUrl}/user/resume/update/';
  static String get resume => '${_baseUrl}/user/resume/';

  // Analytics
  static String get analyticsHit => '${_baseUrl}/analytics/hit/';

  // Collab
  static String get storySubmit => '${_baseUrl}/collab/story/submit/';
  static String get stories => '${_baseUrl}/collab/stories/';
  static String get adsSubmit => '${_baseUrl}/collab/ads/submit/';
  static String get ads => '${_baseUrl}/collab/ads/';

  // Ads & Reports
  static String get reportAd => '${_baseUrl}/ads/report/';
}
