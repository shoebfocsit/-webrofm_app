class AppConstants {
  AppConstants._();

  static const String appName = 'WebroFM';
  static const String baseUrl = 'https://api.webrofm.in/';
  static const String apiSubUrl = 'api';
  static const String r2PublicUrl = 'https://pub-006bdf16b06740608fdd4a6a8d6f55dc.r2.dev';
  static const String appLogo = 'assets/images/applogoframe.png';

  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration apiConnectTimeout = Duration(seconds: 15);
  static const Duration apiReceiveTimeout = Duration(seconds: 15);

  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 350);
  static const Duration animationSlow = Duration(milliseconds: 600);

  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration otpResendDuration = Duration(seconds: 30);

  static const int retryMaxAttempts = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  static const double glassOpacity = 0.72;
  static const double glassBlur = 20.0;
  static const double glassBorderOpacity = 0.45;

  static const double bottomNavHeight = 68.0;
  static const double cardBorderRadius = 16.0;
  static const double inputBorderRadius = 14.0;
  static const double buttonBorderRadius = 28.0;

  static const double paddingXs = 4.0;
  static const double paddingSm = 8.0;
  static const double paddingMd = 16.0;
  static const double paddingLg = 24.0;
  static const double paddingXl = 32.0;

  static const String prefToken = 'access_token';
  static const String prefRefreshToken = 'refresh_token';
  static const String prefUserData = 'user_data';
  static const String prefThemeMode = 'theme_mode';
  static const String prefContinuePlay = 'continue_play';
  static const String prefOnboardingComplete = 'onboarding_complete';
  static const String prefLanguage = 'app_language';
  static const String prefDownloads = 'downloads';
  static const String prefFavorites = 'favorites';
  static const String prefRecentSearches = 'recent_searches';
  static const String prefIsLoggedIn = 'is_logged_in';
  static const String prefDeviceId = 'device_id';
  static const String prefNotificationEnabled = 'notification_enabled';

  static const String dateFormatDisplay = 'MMM dd, yyyy';
  static const String dateFormatApi = 'yyyy-MM-dd';
  static const String dateFormatFull = 'EEEE, MMM dd, yyyy';
  static const String timeFormat = 'hh:mm a';
}
