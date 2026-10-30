// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਵੇਬਰੋਐੱਫਐੱਮ';

  @override
  String get splashLoading => 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get welcomeTitle => 'ਵੇਬਰੋਐੱਫਐੱਮ ਵਿੱਚ ਤੁਹਾਡਾ ਸਵਾਗਤ ਹੈ';

  @override
  String get welcomeSubtitle => 'ਅਜਿਹੀਆਂ ਕਹਾਣੀਆਂ ਲੱਭੋ ਜੋ ਤੁਹਾਨੂੰ ਹਿਲਾ ਦੇਣ';

  @override
  String get welcomeGetStarted => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get welcomeContinueAsGuest => 'ਮਹਿਮਾਨ ਵਜੋਂ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get loginSearchCountries => 'ਦੇਸ਼ ਖੋਜੋ';

  @override
  String get loginInvalidPhone => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਵੈਧ ਫ਼ੋਨ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get loginRateLimitTitle => 'ਦਰ ਸੀਮਾ ਪੂਰੀ';

  @override
  String get loginRateLimitContent =>
      'ਬਹੁਤ ਸਾਰੇ ਓਟੀਪੀ ਯਤਨ। ਕਿਰਪਾ ਕਰਕੇ 1 ਘੰਟੇ ਬਾਅਦ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get loginOk => 'ਠੀਕ ਹੈ';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'ਇਸ ਘੰਟੇ ਸਿਰਫ਼ $remaining ਯਤਨ ਬਾਕੀ';
  }

  @override
  String get loginTitle => 'ਜਾਰੀ ਰੱਖਣ ਲਈ ਲੌਗਇਨ ਕਰੋ';

  @override
  String get loginSubtitle => 'ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਆਪਣਾ ਫ਼ੋਨ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get loginPhoneHint => '(555) 000-0000';

  @override
  String get loginIAgreeTo => 'ਮੈਂ ਸਹਿਮਤ ਹਾਂ ';

  @override
  String get loginTermsOfUse => 'ਵਰਤੋਂ ਦੀਆਂ ਸ਼ਰਤਾਂ';

  @override
  String get loginAnd => ' ਅਤੇ ';

  @override
  String get loginPrivacyPolicy => 'ਗੋਪਨੀਯਤਾ ਨੀਤੀ';

  @override
  String get loginSendOtp => 'ਓਟੀਪੀ ਭੇਜੋ';

  @override
  String get loginContinueAsGuest => 'ਮਹਿਮਾਨ ਵਜੋਂ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get otpEnterCompleteCode => 'ਕਿਰਪਾ ਕਰਕੇ ਪੂਰਾ 6-ਅੰਕੀ ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get otpTitle => 'ਆਪਣਾ ਨੰਬਰ ਪ੍ਰਮਾਣਿਤ ਕਰੋ';

  @override
  String get otpSubtitle => 'ਇਸ \'ਤੇ ਭੇਜਿਆ ਗਿਆ ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get otpVerifyAndContinue => 'ਪ੍ਰਮਾਣਿਤ ਕਰੋ ਅਤੇ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get otpDidntReceive => 'ਕੋਡ ਪ੍ਰਾਪਤ ਨਹੀਂ ਹੋਇਆ? ';

  @override
  String get otpResend => 'ਓਟੀਪੀ ਦੁਬਾਰਾ ਭੇਜੋ';

  @override
  String get completeProfileTitle => 'ਆਪਣੀ ਪ੍ਰੋਫ਼ਾਈਲ ਪੂਰੀ ਕਰੋ';

  @override
  String get completeProfileSubtitle =>
      'ਆਪਣੇ ਤਜਰਬੇ ਨੂੰ ਨਿਜੀ ਬਣਾਉਣ ਵਿੱਚ ਸਾਡੀ ਮਦਦ ਕਰੋ';

  @override
  String get completeProfileBasicInfo => 'ਮੂਲ ਜਾਣਕਾਰੀ';

  @override
  String get completeProfileFullName => 'ਪੂਰਾ ਨਾਮ *';

  @override
  String get completeProfileNameHint => 'ਜੌਨ ਡੋ';

  @override
  String get completeProfileEmail => 'ਈਮੇਲ ਪਤਾ';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'ਲਿੰਗ *';

  @override
  String get completeProfileDateOfBirth => 'ਜਨਮ ਮਿਤੀ';

  @override
  String get completeProfileDobHint => 'ਆਪਣੀ ਜਨਮ ਮਿਤੀ ਚੁਣੋ';

  @override
  String get completeProfileMale => 'ਮਰਦ';

  @override
  String get completeProfileFemale => 'ਔਰਤ';

  @override
  String get completeProfileOther => 'ਹੋਰ';

  @override
  String get completeProfileError =>
      'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਨਾਮ ਦਰਜ ਕਰੋ ਅਤੇ ਲਿੰਗ ਚੁਣੋ';

  @override
  String get completeProfileSkip => 'ਛੱਡੋ';

  @override
  String get completeProfileContinue => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get interestTitle => 'ਆਪਣੀਆਂ ਰੁਚੀਆਂ ਚੁਣੋ';

  @override
  String get interestSubtitle => 'ਨਿਜੀ ਸਿਫ਼ਾਰਸ਼ਾਂ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਸ਼੍ਰੇਣੀਆਂ ਚੁਣੋ';

  @override
  String get interestSectionHeader => 'ਆਪਣੀਆਂ ਰੁਚੀਆਂ ਚੁਣੋ';

  @override
  String get interestTapToSelect => 'ਚੁਣਨ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get interestContinue => 'ਵੇਬਰੋਐੱਫਐੱਮ \'ਤੇ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get interestSkip => 'ਛੱਡੋ';

  @override
  String get registrationTitle => 'ਆਪਣੇ ਬਾਰੇ ਦੱਸੋ';

  @override
  String get registrationSubtitle =>
      'ਆਪਣੇ ਤਜਰਬੇ ਨੂੰ ਨਿਜੀ ਬਣਾਉਣ ਵਿੱਚ ਸਾਡੀ ਮਦਦ ਕਰੋ';

  @override
  String get registrationPersonalInfo => 'ਨਿੱਜੀ ਜਾਣਕਾਰੀ';

  @override
  String get registrationFullName => 'ਪੂਰਾ ਨਾਮ';

  @override
  String get registrationNameHint => 'ਜੌਨ ਡੋ';

  @override
  String get registrationEmail => 'ਈਮੇਲ ਪਤਾ';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'ਜਨਮ ਮਿਤੀ';

  @override
  String get registrationDobHint => 'ਆਪਣੀ ਜਨਮ ਮਿਤੀ ਚੁਣੋ';

  @override
  String get registrationInterestsHeader => 'ਆਪਣੀਆਂ ਰੁਚੀਆਂ ਚੁਣੋ';

  @override
  String get registrationInterestsSubtitle => 'ਆਪਣੀਆਂ ਪਸੰਦੀਦਾ ਸ਼੍ਰੇਣੀਆਂ ਚੁਣੋ';

  @override
  String get registrationContinue => 'ਵੇਬਰੋਐੱਫਐੱਮ \'ਤੇ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get registrationNameError => 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਨਾਮ ਦਰਜ ਕਰੋ';

  @override
  String get homeContinueWatching => 'ਦੇਖਣਾ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get homeContinueListening => 'ਸੁਣਨਾ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get homeResume => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get homeNewArrivals => 'ਨਵੀਆਂ ਆਮਦਾਂ';

  @override
  String get homeSeeAll => 'ਸਭ ਦੇਖੋ';

  @override
  String get homePopularNow => 'ਹੁਣ ਪ੍ਰਸਿੱਧ';

  @override
  String get homeNoShows => 'ਕੋਈ ਸ਼ੋਅ ਉਪਲਬਧ ਨਹੀਂ';

  @override
  String get showDetailFailed => 'ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫ਼ਲ';

  @override
  String get showDetailNotFound => 'ਸ਼ੋਅ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String showDetailShareText(Object title) {
    return 'ਵੇਬਰੋਐੱਫਐੱਮ \'ਤੇ $title ਦੇਖੋ!';
  }

  @override
  String get showDetailDownloadStarted => 'ਡਾਊਨਲੋਡ ਸ਼ੁਰੂ ਹੋਇਆ';

  @override
  String get showDetailNoDescription => 'ਕੋਈ ਵਰਣਨ ਉਪਲਬਧ ਨਹੀਂ।';

  @override
  String get showDetailReadLess => 'ਘੱਟ ਪੜ੍ਹੋ';

  @override
  String get showDetailReadMore => 'ਹੋਰ ਪੜ੍ਹੋ';

  @override
  String get showDetailPlayLatest => 'ਨਵੀਨਤਮ ਐਪੀਸੋਡ ਚਲਾਓ';

  @override
  String get showDetailEpisodes => 'ਐਪੀਸੋਡ';

  @override
  String get showDetailNoEpisodes => 'ਕੋਈ ਐਪੀਸੋਡ ਉਪਲਬਧ ਨਹੀਂ';

  @override
  String get showDetailMoreLikeThis => 'ਇਸ ਵਰਗੇ ਹੋਰ';

  @override
  String get videoPlayerNoAudio => 'ਇਸ ਐਪੀਸੋਡ ਲਈ ਕੋਈ ਆਡੀਓ ਉਪਲਬਧ ਨਹੀਂ';

  @override
  String get videoPlayerLoading => 'ਵੀਡੀਓ ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get videoPlayerNowPlaying => 'ਹੁਣ ਚੱਲ ਰਿਹਾ ਹੈ';

  @override
  String get videoPlayerPaused => 'ਰੋਕਿਆ ਗਿਆ';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'ਪਲੇਬੈਕ ਗਲਤੀ: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'ਵੀਡੀਓ ਪਲੇਅਰ';

  @override
  String get videoPlayerNext => 'ਅਗਲਾ';

  @override
  String get videoPlayerAudio => 'ਆਡੀਓ';

  @override
  String get videoPlayerVideo => 'ਵੀਡੀਓ';

  @override
  String get showCardNew => 'ਨਵਾਂ';

  @override
  String get searchHint => 'ਸ਼ੋਅ, ਐਪੀਸੋਡ ਖੋਜੋ...';

  @override
  String get searchTrending => 'ਟ੍ਰੈਂਡਿੰਗ ਖੋਜਾਂ';

  @override
  String get searchSuggested => 'ਤੁਹਾਡੇ ਲਈ ਸੁਝਾਅ';

  @override
  String get searchError => 'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ';

  @override
  String get searchNoResults => 'ਕੋਈ ਨਤੀਜਾ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get searchNoResultsSubtitle => 'ਆਪਣੇ ਖੋਜ ਸ਼ਬਦ ਬਦਲ ਕੇ ਦੇਖੋ';

  @override
  String get categoriesTitle => 'ਸ਼੍ਰੇਣੀਆਂ ਦੇਖੋ';

  @override
  String categoriesShowCount(Object count) {
    return '$count ਸ਼ੋਅ';
  }

  @override
  String get categoryDetailFailed => 'ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫ਼ਲ';

  @override
  String get categoryDetailLoadMore => 'ਹੋਰ ਲੋਡ ਕਰੋ';

  @override
  String get categoryDetailSortBy => 'ਕ੍ਰਮਬੱਧ ਕਰੋ';

  @override
  String get categoryDetailPopular => 'ਪ੍ਰਸਿੱਧ';

  @override
  String get categoryDetailNewest => 'ਨਵੀਨਤਮ';

  @override
  String get categoryDetailTopRated => 'ਚੋਟੀ ਦੇ ਰੇਟਡ';

  @override
  String get myListTitle => 'ਮੇਰੀ ਸੂਚੀ';

  @override
  String get myListSaved => 'ਸੁਰੱਖਿਅਤ';

  @override
  String get myListWatchHistory => 'ਦੇਖਣ ਦਾ ਇਤਿਹਾਸ';

  @override
  String get myListError => 'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ';

  @override
  String get myListNoSaved => 'ਅਜੇ ਤੱਕ ਕੋਈ ਸੁਰੱਖਿਅਤ ਆਈਟਮ ਨਹੀਂ';

  @override
  String get myListNoHistory => 'ਅਜੇ ਤੱਕ ਕੋਈ ਦੇਖਣ ਦਾ ਇਤਿਹਾਸ ਨਹੀਂ';

  @override
  String get myListNoSavedSubtitle =>
      'ਖੋਜਣਾ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਆਪਣੇ ਪਸੰਦੀਦਾ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get myListNoHistorySubtitle =>
      'ਤੁਹਾਡੇ ਹਾਲ ਹੀ ਵਿੱਚ ਦੇਖੇ ਗਏ ਸ਼ੋਅ ਇੱਥੇ ਦਿਖਾਈ ਦੇਣਗੇ';

  @override
  String get myListExploreShows => 'ਸ਼ੋਅ ਖੋਜੋ';

  @override
  String get myListRemoved => 'ਮੇਰੀ ਸੂਚੀ ਵਿੱਚੋਂ ਹਟਾਇਆ ਗਿਆ';

  @override
  String get myListLoginTitle => 'ਆਪਣੇ ਸੁਰੱਖਿਅਤ ਸ਼ੋਅ ਦੇਖਣ ਲਈ ਲੌਗਇਨ ਕਰੋ';

  @override
  String get myListLoginSubtitle =>
      'ਆਪਣੇ ਮਨਪਸੰਦ ਸ਼ੋਅ ਸੁਰੱਖਿਅਤ ਕਰੋ ਅਤੇ ਕਿਸੇ ਵੀ ਸਮੇਂ ਐਕਸੈਸ ਕਰੋ';

  @override
  String get profileTitle => 'ਪ੍ਰੋਫ਼ਾਈਲ';

  @override
  String get profileUser => 'ਉਪਭੋਗਤਾ';

  @override
  String get profileNoPhone => 'ਕੋਈ ਫ਼ੋਨ ਨਹੀਂ';

  @override
  String get profileEditProfile => 'ਪ੍ਰੋਫ਼ਾਈਲ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get profileYourInterests => 'ਤੁਹਾਡੀਆਂ ਰੁਚੀਆਂ';

  @override
  String get profileNoCategories => 'ਕੋਈ ਸ਼੍ਰੇਣੀ ਚੁਣੀ ਨਹੀਂ ਗਈ';

  @override
  String get profileDobLabel => 'ਜਨਮ ਮਿਤੀ';

  @override
  String get profileNotLoggedIn => 'ਤੁਸੀਂ ਲੌਗਇਨ ਨਹੀਂ ਹੋ';

  @override
  String get profileNotLoggedInSubtitle =>
      'ਆਪਣੀ ਪ੍ਰੋਫ਼ਾਈਲ, ਡਾਊਨਲੋਡ ਅਤੇ ਨਿਜੀ ਸਿਫ਼ਾਰਸ਼ਾਂ ਤੱਕ ਪਹੁੰਚ ਕਰਨ ਲਈ ਸਾਈਨ ਇਨ ਕਰੋ।';

  @override
  String get profileLogin => 'ਲੌਗਇਨ';

  @override
  String get profileCollaboration => 'ਸਹਿਯੋਗ';

  @override
  String get profileSettings => 'ਸੈਟਿੰਗਾਂ ਅਤੇ ਤਰਜੀਹਾਂ';

  @override
  String get profileMyDownloads => 'ਮੇਰੇ ਡਾਊਨਲੋਡ';

  @override
  String get profileTermsOfUse => 'ਵਰਤੋਂ ਦੀਆਂ ਸ਼ਰਤਾਂ';

  @override
  String get profilePrivacyPolicy => 'ਗੋਪਨੀਯਤਾ ਨੀਤੀ';

  @override
  String get profileHelpFaq => 'ਮਦਦ ਅਤੇ ਅਕਸਰ ਪੁੱਛੇ ਜਾਂਦੇ ਸਵਾਲ';

  @override
  String get profileContactUs => 'ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String get profileLogout => 'ਲੌਗਆਊਟ';

  @override
  String get profileLogoutTitle => 'ਲੌਗਆਊਟ';

  @override
  String get profileLogoutConfirm => 'ਕੀ ਤੁਸੀਂ ਸੱਚਮੁੱਚ ਲੌਗਆਊਟ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get profileCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get editProfileTitle => 'ਪ੍ਰੋਫ਼ਾਈਲ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get editProfileTapToChangePhoto => 'ਫ਼ੋਟੋ ਬਦਲਣ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get editProfileFullName => 'ਪੂਰਾ ਨਾਮ';

  @override
  String get editProfileNameRequired => 'ਨਾਮ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get editProfileEmail => 'ਈਮੇਲ';

  @override
  String get editProfileEmailRequired => 'ਈਮੇਲ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get editProfileInvalidEmail => 'ਅਵੈਧ ਈਮੇਲ';

  @override
  String get editProfileDob => 'ਜਨਮ ਮਿਤੀ';

  @override
  String get editProfilePhone => 'ਫ਼ੋਨ';

  @override
  String get editProfileCategoryPreferences => 'ਸ਼੍ਰੇਣੀ ਤਰਜੀਹਾਂ';

  @override
  String get editProfileAddMore => 'ਹੋਰ ਜੋੜੋ';

  @override
  String get editProfileAddCategory => 'ਸ਼੍ਰੇਣੀ ਜੋੜੋ';

  @override
  String get editProfileSaveChanges => 'ਬਦਲਾਅ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get editProfileUserDataNotAvailable => 'ਉਪਭੋਗਤਾ ਡੇਟਾ ਉਪਲਬਧ ਨਹੀਂ';

  @override
  String get editProfileUpdatedSuccess => 'ਪ੍ਰੋਫ਼ਾਈਲ ਸਫ਼ਲਤਾਪੂਰਵਕ ਅੱਪਡੇਟ ਹੋਈ';

  @override
  String get editProfileCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get editProfileSubmit => 'ਜਮ੍ਹਾਂ ਕਰੋ';

  @override
  String get settingsTitle => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get settingsGeneral => 'ਆਮ';

  @override
  String get settingsAppLanguage => 'ਐਪ ਭਾਸ਼ਾ';

  @override
  String get settingsSubtitleLanguage => 'ਸਬਟਾਈਟਲ ਭਾਸ਼ਾ';

  @override
  String get settingsAppearancePlayback => 'ਦਿੱਖ ਅਤੇ ਪਲੇਬੈਕ';

  @override
  String get settingsColorTheme => 'ਰੰਗ ਥੀਮ';

  @override
  String get settingsLight => 'ਲਾਈਟ';

  @override
  String get settingsDark => 'ਡਾਰਕ';

  @override
  String get settingsSystem => 'ਸਿਸਟਮ';

  @override
  String get settingsAutoplayNext => 'ਅਗਲਾ ਐਪੀਸੋਡ ਆਟੋਮੈਟਿਕ ਚਲਾਓ';

  @override
  String get settingsDownloadQuality => 'ਡਾਊਨਲੋਡ ਗੁਣਵੱਤਾ';

  @override
  String get settingsLow => 'ਨੀਵਾਂ';

  @override
  String get settingsMedium => 'ਦਰਮਿਆਨਾ';

  @override
  String get settingsHigh => 'ਉੱਚਾ';

  @override
  String get settingsVeryHigh => 'ਬਹੁਤ ਉੱਚਾ';

  @override
  String get settingsAccountPrivacy => 'ਖਾਤਾ ਅਤੇ ਗੋਪਨੀਯਤਾ';

  @override
  String get settingsAgeRestriction => 'ਉਮਰ/ਸਮੱਗਰੀ ਪਾਬੰਦੀ';

  @override
  String get settingsNotifications => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get settingsDangerZone => 'ਖ਼ਤਰਾ ਜ਼ੋਨ';

  @override
  String get settingsDeleteAccount => 'ਮੇਰਾ ਖਾਤਾ ਮਿਟਾਓ';

  @override
  String get deleteAccountTitle => 'ਖਾਤਾ ਮਿਟਾਓ';

  @override
  String get deleteAccountHeader => 'ਮੇਰਾ ਖਾਤਾ ਮਿਟਾਓ';

  @override
  String get deleteAccountWarning =>
      'ਇਹ ਕਾਰਵਾਈ ਵਾਪਸ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ। ਤੁਹਾਡਾ ਸਾਰਾ ਡੇਟਾ ਸਥਾਈ ਤੌਰ \'ਤੇ ਹਟਾ ਦਿੱਤਾ ਜਾਵੇਗਾ।';

  @override
  String get deleteAccountDataLoss => 'ਹੇਠ ਲਿਖਿਆ ਡੇਟਾ ਗੁਆਚ ਜਾਵੇਗਾ:';

  @override
  String get deleteAccountReason => 'ਮਿਟਾਉਣ ਦਾ ਕਾਰਨ';

  @override
  String get deleteAccountSelectReason => 'ਇੱਕ ਕਾਰਨ ਚੁਣੋ';

  @override
  String get deleteAccountNotUsing => 'ਮੈਂ ਹੁਣ ਇਸ ਐਪ ਦੀ ਵਰਤੋਂ ਨਹੀਂ ਕਰਦਾ';

  @override
  String get deleteAccountTooExpensive => 'ਬਹੁਤ ਮਹਿੰਗਾ';

  @override
  String get deleteAccountPrivacy => 'ਗੋਪਨੀਯਤਾ ਸੰਬੰਧੀ ਚਿੰਤਾਵਾਂ';

  @override
  String get deleteAccountTechnicalIssues => 'ਤਕਨੀਕੀ ਸਮੱਸਿਆਵਾਂ';

  @override
  String get deleteAccountFoundAlternative => 'ਵਧੀਆ ਵਿਕਲਪ ਮਿਲ ਗਿਆ';

  @override
  String get deleteAccountOther => 'ਹੋਰ';

  @override
  String get deleteAccountProfileSettings => 'ਪ੍ਰੋਫ਼ਾਈਲ ਅਤੇ ਸੈਟਿੰਗਾਂ';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'ਤੁਹਾਡੀ ਪ੍ਰੋਫ਼ਾਈਲ ਜਾਣਕਾਰੀ, ਤਰਜੀਹਾਂ ਅਤੇ ਐਪ ਸੈਟਿੰਗਾਂ ਸਥਾਈ ਤੌਰ \'ਤੇ ਮਿਟਾ ਦਿੱਤੀਆਂ ਜਾਣਗੀਆਂ।';

  @override
  String get deleteAccountListeningHistory => 'ਸੁਣਨ ਦਾ ਇਤਿਹਾਸ';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'ਤੁਹਾਡਾ ਸੁਣਨ ਦਾ ਇਤਿਹਾਸ, ਖੋਜ ਇਤਿਹਾਸ ਅਤੇ ਗਤੀਵਿਧੀ ਲੌਗ ਮਿਟਾ ਦਿੱਤੇ ਜਾਣਗੇ।';

  @override
  String get deleteAccountSavedItems => 'ਸੁਰੱਖਿਅਤ ਆਈਟਮਾਂ';

  @override
  String get deleteAccountSavedItemsDesc =>
      'ਤੁਹਾਡੀਆਂ ਸਾਰੀਆਂ ਪਲੇਲਿਸਟਾਂ, ਪਸੰਦੀਦਾ ਅਤੇ ਸੁਰੱਖਿਅਤ ਸਮੱਗਰੀ ਹਟਾ ਦਿੱਤੀ ਜਾਵੇਗੀ।';

  @override
  String get deleteAccountSubscriptions => 'ਸਬਸਕ੍ਰਿਪਸ਼ਨਾਂ';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'ਕੋਈ ਵੀ ਸਰਗਰਮ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਰੱਦ ਕਰ ਦਿੱਤੀ ਜਾਵੇਗੀ ਅਤੇ ਪ੍ਰੀਮੀਅਮ ਪਹੁੰਚ ਖਤਮ ਹੋ ਜਾਵੇਗੀ।';

  @override
  String get deleteAccountDelete => 'ਮੇਰਾ ਖਾਤਾ ਮਿਟਾਓ';

  @override
  String get deleteAccountCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get deleteAccountOtpTitle => 'ਮਿਟਾਉਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return '$phone \'ਤੇ ਭੇਜਿਆ ਗਿਆ ਓਟੀਪੀ ਦਰਜ ਕਰੋ';
  }

  @override
  String get deleteAccountOtpConfirm => 'ਮਿਟਾਉਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get deleteAccountOtpResend => 'ਓਟੀਪੀ ਦੁਬਾਰਾ ਭੇਜੋ';

  @override
  String get deleteAccountOtpResent => 'ਓਟੀਪੀ ਸਫ਼ਲਤਾਪੂਰਵਕ ਦੁਬਾਰਾ ਭੇਜਿਆ ਗਿਆ';

  @override
  String get accountDeletedTitle => 'ਖਾਤਾ ਮਿਟਾ ਦਿੱਤਾ ਗਿਆ';

  @override
  String get accountDeletedMessage =>
      'ਤੁਹਾਡਾ ਖਾਤਾ ਸਥਾਈ ਤੌਰ \'ਤੇ ਮਿਟਾ ਦਿੱਤਾ ਗਿਆ ਹੈ।\nਤੁਹਾਨੂੰ ਜਾਂਦੇ ਦੇਖ ਕੇ ਦੁੱਖ ਹੋਇਆ।';

  @override
  String get accountDeletedBackToHome => 'ਹੋਮ \'ਤੇ ਵਾਪਸ ਜਾਓ';

  @override
  String get contactUsTitle => 'ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String get contactUsSubtitle => 'ਸਾਨੂੰ ਤੁਹਾਡੇ ਤੋਂ ਸੁਣ ਕੇ ਖੁਸ਼ੀ ਹੋਵੇਗੀ';

  @override
  String get contactUsSubject => 'ਵਿਸ਼ਾ';

  @override
  String get contactUsMessageLabel => 'ਸੁਨੇਹਾ';

  @override
  String get contactUsMessageHint => 'ਆਪਣੀ ਸਮੱਸਿਆ ਜਾਂ ਸਵਾਲ ਦਾ ਵਰਣਨ ਕਰੋ...';

  @override
  String get contactUsAddAttachment => 'ਅਟੈਚਮੈਂਟ ਜੋੜੋ';

  @override
  String get contactUsQuickContact => 'ਤੁਰੰਤ ਸੰਪਰਕ';

  @override
  String get contactUsEmail => 'ਈਮੇਲ';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'ਕਾਲ';

  @override
  String get contactUsCallValue => '+1 (555) 123-4567';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'ਸਾਡੇ ਨਾਲ ਗੱਲ ਕਰੋ';

  @override
  String get contactUsSend => 'ਸੰਦੇਸ਼ ਭੇਜੋ';

  @override
  String get contactUsSending => 'ਭੇਜਿਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get contactUsNoMessage => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਸੰਦੇਸ਼ ਦਰਜ ਕਰੋ';

  @override
  String get contactUsSent => 'ਸੰਦੇਸ਼ ਸਫ਼ਲਤਾਪੂਰਵਕ ਭੇਜਿਆ ਗਿਆ!';

  @override
  String get contactUsGeneralInquiry => 'ਆਮ ਪੁੱਛਗਿੱਛ';

  @override
  String get contactUsTechnicalSupport => 'ਤਕਨੀਕੀ ਸਹਾਇਤਾ';

  @override
  String get contactUsAccountIssue => 'ਖਾਤਾ ਸਮੱਸਿਆ';

  @override
  String get contactUsBillingQuestion => 'ਬਿਲਿੰਗ ਸਵਾਲ';

  @override
  String get contactUsFeatureRequest => 'ਫੀਚਰ ਬੇਨਤੀ';

  @override
  String get contactUsBugReport => 'ਬੱਗ ਰਿਪੋਰਟ';

  @override
  String get helpFaqTitle => 'ਮਦਦ ਅਤੇ ਅਕਸਰ ਪੁੱਛੇ ਜਾਂਦੇ ਸਵਾਲ';

  @override
  String get helpFaqSearchHint => 'ਅਕਸਰ ਪੁੱਛੇ ਜਾਂਦੇ ਸਵਾਲ ਖੋਜੋ...';

  @override
  String get helpFaqNoResults => 'ਕੋਈ ਨਤੀਜਾ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get helpFaqStillNeedHelp => 'ਅਜੇ ਵੀ ਮਦਦ ਚਾਹੀਦੀ ਹੈ?';

  @override
  String get helpFaqContactUs => 'ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String get helpFaqAll => 'ਸਭ';

  @override
  String get helpFaqAccount => 'ਖਾਤਾ';

  @override
  String get helpFaqPlayback => 'ਪਲੇਬੈਕ';

  @override
  String get helpFaqBilling => 'ਬਿਲਿੰਗ';

  @override
  String get helpFaqOther => 'ਹੋਰ';

  @override
  String get helpFaq1Q => 'ਮੈਂ ਆਪਣਾ ਪਾਸਵਰਡ ਕਿਵੇਂ ਰੀਸੈਟ ਕਰਾਂ?';

  @override
  String get helpFaq1A =>
      'ਤੁਸੀਂ ਲੌਗਇਨ ਸਕਰੀਨ ਤੋਂ \'ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ\' \'ਤੇ ਟੈਪ ਕਰਕੇ ਆਪਣਾ ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰ ਸਕਦੇ ਹੋ। ਆਪਣੇ ਰਜਿਸਟਰਡ ਈਮੇਲ ਜਾਂ ਫ਼ੋਨ \'ਤੇ ਭੇਜੇ ਗਏ ਨਿਰਦੇਸ਼ਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ।';

  @override
  String get helpFaq2Q => 'ਕੀ ਮੈਂ ਆਪਣੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਯੋਜਨਾ ਬਦਲ ਸਕਦਾ ਹਾਂ?';

  @override
  String get helpFaq2A =>
      'ਹਾਂ, ਸੈਟਿੰਗਾਂ > ਸਬਸਕ੍ਰਿਪਸ਼ਨ \'ਤੇ ਜਾ ਕੇ ਆਪਣੀ ਮੌਜੂਦਾ ਯੋਜਨਾ ਦੇਖੋ ਅਤੇ ਬਦਲੋ। ਬਦਲਾਅ ਅਗਲੇ ਬਿਲਿੰਗ ਚੱਕਰ ਤੋਂ ਪ੍ਰਭਾਵੀ ਹੋਣਗੇ।';

  @override
  String get helpFaq3Q => 'ਮੈਂ ਆਪਣਾ ਖਾਤਾ ਕਿਵੇਂ ਮਿਟਾਵਾਂ?';

  @override
  String get helpFaq3A =>
      'ਸੈਟਿੰਗਾਂ > ਖ਼ਤਰਾ ਜ਼ੋਨ > ਮੇਰਾ ਖਾਤਾ ਮਿਟਾਓ \'ਤੇ ਜਾਓ। ਆਪਣਾ ਖਾਤਾ ਸਥਾਈ ਤੌਰ \'ਤੇ ਮਿਟਾਉਣ ਲਈ ਪ੍ਰਮਾਣੀਕਰਨ ਕਦਮਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ।';

  @override
  String get helpFaq4Q => 'ਮੇਰੀਆਂ ਡਾਊਨਲੋਡ ਕੀਤੀਆਂ ਫ਼ਾਈਲਾਂ ਕਿੱਥੇ ਹਨ?';

  @override
  String get helpFaq4A =>
      'ਡਾਊਨਲੋਡ ਕੀਤੇ ਐਪੀਸੋਡ ਐਪ ਵਿੱਚ ਮੇਰੇ ਡਾਊਨਲੋਡ ਦੇ ਅਧੀਨ ਸਟੋਰ ਕੀਤੇ ਜਾਂਦੇ ਹਨ। ਉਹ ਕਦੇ ਵੀ ਔਫਲਾਈਨ ਸੁਣਨ ਲਈ ਉਪਲਬਧ ਹੁੰਦੇ ਹਨ।';

  @override
  String get helpFaq5Q => 'ਮੈਂ ਆਪਣੀ ਪ੍ਰੋਫ਼ਾਈਲ ਜਾਣਕਾਰੀ ਕਿਵੇਂ ਅੱਪਡੇਟ ਕਰਾਂ?';

  @override
  String get helpFaq5A =>
      'ਪ੍ਰੋਫ਼ਾਈਲ > ਪ੍ਰੋਫ਼ਾਈਲ ਸੰਪਾਦਿਤ ਕਰੋ \'ਤੇ ਜਾ ਕੇ ਆਪਣਾ ਨਾਮ, ਈਮੇਲ, ਜਨਮ ਮਿਤੀ ਅਤੇ ਪ੍ਰੋਫ਼ਾਈਲ ਫ਼ੋਟੋ ਅੱਪਡੇਟ ਕਰੋ।';

  @override
  String get helpFaq6Q => 'ਮੇਰਾ ਆਡੀਓ ਕਿਉਂ ਨਹੀਂ ਚੱਲ ਰਿਹਾ?';

  @override
  String get helpFaq6A =>
      'ਆਪਣਾ ਇੰਟਰਨੈੱਟ ਕਨੈਕਸ਼ਨ ਜਾਂਚੋ ਅਤੇ ਐਪ ਨੂੰ ਮੁੜ ਚਾਲੂ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ। ਜੇਕਰ ਸਮੱਸਿਆ ਬਣੀ ਰਹਿੰਦੀ ਹੈ, ਤਾਂ ਸੈਟਿੰਗਾਂ ਤੋਂ ਐਪ ਕੈਸ਼ ਸਾਫ਼ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get helpFaq7Q => 'ਮੈਨੂੰ ਰਿਫੰਡ ਕਿਵੇਂ ਮਿਲੇਗਾ?';

  @override
  String get helpFaq7A =>
      'ਆਪਣੇ ਲੈਣ-ਦੇਣ ਵੇਰਵਿਆਂ ਨਾਲ support@webrofm.com \'ਤੇ ਸਾਡੀ ਸਹਾਇਤਾ ਟੀਮ ਨਾਲ ਸੰਪਰਕ ਕਰੋ। ਅਸੀਂ 5-7 ਕਾਰੋਬਾਰੀ ਦਿਨਾਂ ਵਿੱਚ ਤੁਹਾਡਾ ਰਿਫੰਡ ਪ੍ਰੋਸੈਸ ਕਰਾਂਗੇ।';

  @override
  String get helpFaq8Q => 'ਮੈਂ ਬੱਗ ਦੀ ਰਿਪੋਰਟ ਕਿਵੇਂ ਕਰਾਂ?';

  @override
  String get helpFaq8A =>
      'ਤੁਸੀਂ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ ਭਾਗ ਰਾਹੀਂ ਬੱਗ ਦੀ ਰਿਪੋਰਟ ਕਰ ਸਕਦੇ ਹੋ। ਕਿਰਪਾ ਕਰਕੇ ਸਮੱਸਿਆ ਨੂੰ ਦੁਬਾਰਾ ਪੈਦਾ ਕਰਨ ਦੇ ਕਦਮ ਅਤੇ ਆਪਣੀ ਡਿਵਾਈਸ ਦੀ ਜਾਣਕਾਰੀ ਸ਼ਾਮਲ ਕਰੋ।';

  @override
  String get privacyPolicyTitle => 'ਗੋਪਨੀਯਤਾ ਨੀਤੀ';

  @override
  String get privacyPolicyLastUpdated => 'ਆਖਰੀ ਅੱਪਡੇਟ: 22 ਜੁਲਾਈ, 2026';

  @override
  String get privacyPolicyCollection => 'ਸੰਗ੍ਰਹਿ';

  @override
  String get privacyPolicyCollectionTitle =>
      'ਅਸੀਂ ਕਿਹੜੀ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰਦੇ ਹਾਂ';

  @override
  String get privacyPolicyCollectionText =>
      'ਅਸੀਂ ਉਹ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰਦੇ ਹਾਂ ਜੋ ਤੁਸੀਂ ਸਿੱਧੇ ਪ੍ਰਦਾਨ ਕਰਦੇ ਹੋ, ਜਿਵੇਂ ਤੁਹਾਡਾ ਨਾਮ, ਈਮੇਲ ਪਤਾ, ਫ਼ੋਨ ਨੰਬਰ ਅਤੇ ਪ੍ਰੋਫ਼ਾਈਲ ਫ਼ੋਟੋ। ਅਸੀਂ ਆਪਣੀਆਂ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਨ ਵੇਲੇ ਆਪਣੇ ਆਪ ਕੁਝ ਜਾਣਕਾਰੀ ਵੀ ਇਕੱਠੀ ਕਰਦੇ ਹਾਂ, ਜਿਸ ਵਿੱਚ ਡਿਵਾਈਸ ਜਾਣਕਾਰੀ, ਵਰਤੋਂ ਡੇਟਾ ਅਤੇ ਸੁਣਨ ਦੀਆਂ ਤਰਜੀਹਾਂ ਸ਼ਾਮਲ ਹਨ।';

  @override
  String get privacyPolicyUsage => 'ਵਰਤੋਂ';

  @override
  String get privacyPolicyUsageTitle =>
      'ਅਸੀਂ ਤੁਹਾਡੀ ਜਾਣਕਾਰੀ ਦੀ ਵਰਤੋਂ ਕਿਵੇਂ ਕਰਦੇ ਹਾਂ';

  @override
  String get privacyPolicyUsageText =>
      'ਅਸੀਂ ਆਪਣੀਆਂ ਸਟ੍ਰੀਮਿੰਗ ਸੇਵਾਵਾਂ ਪ੍ਰਦਾਨ ਕਰਨ, ਬਣਾਈ ਰੱਖਣ ਅਤੇ ਸੁਧਾਰਨ, ਤੁਹਾਡੇ ਤਜਰਬੇ ਨੂੰ ਨਿਜੀ ਬਣਾਉਣ, ਤੁਹਾਨੂੰ ਅੱਪਡੇਟ ਅਤੇ ਪ੍ਰਚਾਰ ਸਮੱਗਰੀ ਭੇਜਣ ਅਤੇ ਆਪਣੇ ਪਲੇਟਫਾਰਮ ਦੀ ਸੁਰੱਖਿਆ ਯਕੀਨੀ ਬਣਾਉਣ ਲਈ ਇਕੱਠੀ ਕੀਤੀ ਜਾਣਕਾਰੀ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਾਂ।';

  @override
  String get privacyPolicySharing => 'ਸਾਂਝਾਕਰਨ';

  @override
  String get privacyPolicySharingTitle => 'ਜਾਣਕਾਰੀ ਸਾਂਝਾਕਰਨ';

  @override
  String get privacyPolicySharingText =>
      'ਅਸੀਂ ਤੁਹਾਡੀ ਨਿੱਜੀ ਜਾਣਕਾਰੀ ਨਹੀਂ ਵੇਚਦੇ। ਅਸੀਂ ਤੁਹਾਡਾ ਡੇਟਾ ਭਰੋਸੇਯੋਗ ਸੇਵਾ ਪ੍ਰਦਾਤਾਵਾਂ ਨਾਲ ਸਾਂਝਾ ਕਰ ਸਕਦੇ ਹਾਂ ਜੋ ਸਾਡੇ ਪਲੇਟਫਾਰਮ ਦੇ ਸੰਚਾਲਨ ਵਿੱਚ ਸਾਡੀ ਸਹਾਇਤਾ ਕਰਦੇ ਹਨ, ਜੋ ਸਖ਼ਤ ਗੋਪਨੀਯਤਾ ਸਮਝੌਤਿਆਂ ਦੇ ਅਧੀਨ ਹੈ।';

  @override
  String get privacyPolicySecurity => 'ਸੁਰੱਖਿਆ';

  @override
  String get privacyPolicySecurityTitle => 'ਡੇਟਾ ਸੁਰੱਖਿਆ';

  @override
  String get privacyPolicySecurityText =>
      'ਅਸੀਂ ਤੁਹਾਡੀ ਨਿੱਜੀ ਜਾਣਕਾਰੀ ਦੀ ਸੁਰੱਖਿਆ ਲਈ ਉਦਯੋਗ-ਮਿਆਰੀ ਸੁਰੱਖਿਆ ਉਪਾਅ ਲਾਗੂ ਕਰਦੇ ਹਾਂ, ਜਿਸ ਵਿੱਚ ਟ੍ਰਾਂਜ਼ਿਟ ਅਤੇ ਆਰਾਮ ਦੋਵਾਂ ਵਿੱਚ ਐਨਕ੍ਰਿਪਸ਼ਨ, ਨਿਯਮਤ ਸੁਰੱਖਿਆ ਆਡਿਟ ਅਤੇ ਪਹੁੰਚ ਨਿਯੰਤਰਣ ਸ਼ਾਮਲ ਹਨ।';

  @override
  String get privacyPolicyRights => 'ਅਧਿਕਾਰ';

  @override
  String get privacyPolicyRightsTitle => 'ਤੁਹਾਡੇ ਅਧਿਕਾਰ ਅਤੇ ਵਿਕਲਪ';

  @override
  String get privacyPolicyRightsText =>
      'ਤੁਹਾਨੂੰ ਕਿਸੇ ਵੀ ਸਮੇਂ ਆਪਣੀਆਂ ਖਾਤਾ ਸੈਟਿੰਗਾਂ ਰਾਹੀਂ ਆਪਣੀ ਨਿੱਜੀ ਜਾਣਕਾਰੀ ਤੱਕ ਪਹੁੰਚ ਕਰਨ, ਅੱਪਡੇਟ ਕਰਨ ਜਾਂ ਮਿਟਾਉਣ ਦਾ ਅਧਿਕਾਰ ਹੈ। ਤੁਸੀਂ ਕਿਸੇ ਵੀ ਗੋਪਨੀਯਤਾ-ਸਬੰਧਤ ਬੇਨਤੀ ਲਈ ਸਿੱਧਾ ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਵੀ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get termsOfUseTitle => 'ਵਰਤੋਂ ਦੀਆਂ ਸ਼ਰਤਾਂ';

  @override
  String get termsOfUseUsage => 'ਵਰਤੋਂ';

  @override
  String get termsOfUseUsageTitle => 'ਵਰਤੋਂ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼';

  @override
  String get termsOfUseUsageText =>
      'ਵੇਬਰੋਐੱਫਐੱਮ ਦੀ ਵਰਤੋਂ ਕਰਕੇ, ਤੁਸੀਂ ਸਿਰਫ਼ ਕਾਨੂੰਨੀ ਉਦੇਸ਼ਾਂ ਲਈ ਸੇਵਾ ਦੀ ਵਰਤੋਂ ਕਰਨ ਲਈ ਸਹਿਮਤ ਹੁੰਦੇ ਹੋ। ਤੁਸੀਂ ਪੂਰਵ ਲਿਖਤੀ ਸਹਿਮਤੀ ਤੋਂ ਬਿਨਾਂ ਸਾਡੇ ਪਲੇਟਫਾਰਮ ਤੋਂ ਕਿਸੇ ਵੀ ਸਮੱਗਰੀ ਨੂੰ ਸੋਧ, ਵੰਡ ਜਾਂ ਦੁਬਾਰਾ ਪੇਸ਼ ਨਹੀਂ ਕਰ ਸਕਦੇ। ਅਸੀਂ ਇਹਨਾਂ ਸ਼ਰਤਾਂ ਦੀ ਉਲੰਘਣਾ ਲਈ ਪਹੁੰਚ ਨੂੰ ਮੁਅੱਤਲ ਜਾਂ ਖਤਮ ਕਰਨ ਦਾ ਅਧਿਕਾਰ ਰਾਖਵਾਂ ਰੱਖਦੇ ਹਾਂ।';

  @override
  String get termsOfUseAccounts => 'ਖਾਤੇ';

  @override
  String get termsOfUseAccountsTitle => 'ਉਪਭੋਗਤਾ ਖਾਤੇ';

  @override
  String get termsOfUseAccountsText =>
      'ਤੁਸੀਂ ਆਪਣੇ ਖਾਤਾ ਕ੍ਰੈਡੈਂਸ਼ੀਅਲ ਦੀ ਗੋਪਨੀਯਤਾ ਬਣਾਈ ਰੱਖਣ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੋ। ਖਾਤਾ ਬਣਾਉਣ ਵੇਲੇ ਤੁਹਾਨੂੰ ਸਹੀ ਅਤੇ ਪੂਰੀ ਜਾਣਕਾਰੀ ਪ੍ਰਦਾਨ ਕਰਨੀ ਚਾਹੀਦੀ ਹੈ। ਤੁਹਾਨੂੰ ਆਪਣੇ ਖਾਤੇ ਦੀ ਕਿਸੇ ਵੀ ਅਣਅਧਿਕਾਰਤ ਵਰਤੋਂ ਬਾਰੇ ਤੁਰੰਤ ਸਾਨੂੰ ਸੂਚਿਤ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get termsOfUseContent => 'ਸਮੱਗਰੀ';

  @override
  String get termsOfUseContentTitle => 'ਸਮੱਗਰੀ ਅਤੇ ਬੌਧਿਕ ਸੰਪੱਤੀ';

  @override
  String get termsOfUseContentText =>
      'ਵੇਬਰੋਐੱਫਐੱਮ \'ਤੇ ਉਪਲਬਧ ਸਾਰੀ ਸਮੱਗਰੀ, ਜਿਸ ਵਿੱਚ ਆਡੀਓ ਸਟ੍ਰੀਮ, ਵੀਡੀਓ ਅਤੇ ਕਲਾਕૃਤੀ ਸ਼ਾਮਲ ਹਨ, ਕਾਪੀਰਾਈਟ ਅਤੇ ਬੌਧਿਕ ਸੰਪੱਤੀ ਕਾਨੂੰਨਾਂ ਦੁਆਰਾ ਸੁਰੱਖਿਅਤ ਹੈ। ਉਪਭੋਗਤਾ ਸਪਸ਼ਟ ਇਜਾਜ਼ਤ ਤੋਂ ਬਿਨਾਂ ਸਮੱਗਰੀ ਡਾਊਨਲੋਡ, ਰਿਕਾਰਡ ਜਾਂ ਮੁੜ-ਵੰਡ ਨਹੀਂ ਕਰ ਸਕਦੇ।';

  @override
  String get termsOfUseLiability => 'ਦੇਣਦਾਰੀ';

  @override
  String get termsOfUseLiabilityTitle => 'ਦੇਣਦਾਰੀ ਦੀ ਸੀਮਾ';

  @override
  String get termsOfUseLiabilityText =>
      'ਵੇਬਰੋਐੱਫਐੱਮ ਸੇਵਾ ਦੀ ਤੁਹਾਡੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਅਪ੍ਰਤੱਖ, ਅਕਸਮਿਕ ਜਾਂ ਨਤੀਜੇ ਵਜੋਂ ਹੋਣ ਵਾਲੇ ਨੁਕਸਾਨ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹੋਵੇਗਾ। ਸਾਡੀ ਕੁੱਲ ਦੇਣਦਾਰੀ ਪਿਛਲੇ 12 ਮਹੀਨਿਆਂ ਵਿੱਚ ਤੁਹਾਡੇ ਦੁਆਰਾ ਸੇਵਾ ਲਈ ਭੁਗਤਾਨ ਕੀਤੀ ਗਈ ਰਕਮ ਤੋਂ ਵੱਧ ਨਹੀਂ ਹੋਵੇਗੀ।';

  @override
  String get notificationsTitle => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get notificationsEmptyTitle => 'ਕੋਈ ਸੂਚਨਾ ਨਹੀਂ';

  @override
  String get notificationsEmptySubtitle =>
      'ਤੁਸੀਂ ਸਭ ਤੋਂ ਅੱਪਡੇਟ ਹੋ! ਅੱਪਡੇਟ ਲਈ ਬਾਅਦ ਵਿੱਚ ਦੁਬਾਰਾ ਜਾਂਚ ਕਰੋ।';

  @override
  String get downloadsTitle => 'ਮੇਰੇ ਡਾਊਨਲੋਡ';

  @override
  String get downloadsEmptyTitle => 'ਅਜੇ ਤੱਕ ਕੋਈ ਡਾਊਨਲੋਡ ਨਹੀਂ';

  @override
  String get downloadsEmptySubtitle =>
      'ਤੁਹਾਡੇ ਡਾਊਨਲੋਡ ਕੀਤੇ ਐਪੀਸੋਡ ਇੱਥੇ ਦਿਖਾਈ ਦੇਣਗੇ ਤਾਂ ਜੋ ਤੁਸੀਂ ਕਦੇ ਵੀ ਔਫਲਾਈਨ ਸੁਣ ਸਕੋ।';

  @override
  String get downloadsBrowseShows => 'ਸ਼ੋਅ ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get premiumTitle => 'ਪ੍ਰੀਮੀਅਮ';

  @override
  String get collabTitle => 'ਸਹਿਯੋਗ';

  @override
  String get collabMyStories => 'ਮੇਰੀਆਂ ਕਹਾਣੀਆਂ';

  @override
  String get collabMySponsorships => 'ਮੇਰੇ ਸਪਾਂਸਰਸ਼ਿਪ';

  @override
  String get collabNoStories => 'ਅਜੇ ਤੱਕ ਕੋਈ ਕਹਾਣੀ ਜਮ੍ਹਾਂ ਨਹੀਂ ਕੀਤੀ ਗਈ।';

  @override
  String get collabNoSponsorships =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਸਪਾਂਸਰਸ਼ਿਪ ਜਮ੍ਹਾਂ ਨਹੀਂ ਕੀਤੀ ਗਈ।';

  @override
  String get collabApproved => 'ਮਨਜ਼ੂਰ';

  @override
  String get collabRejected => 'ਰੱਦ';

  @override
  String get collabReviewing => 'ਸਮੀਖਿਆ ਅਧੀਨ';

  @override
  String get collabPending => 'ਬਕਾਇਆ';

  @override
  String get collabShareYourStory => 'ਆਪਣੀ ਕਹਾਣੀ ਸਾਂਝੀ ਕਰੋ';

  @override
  String get collabShareYourStorySubtitle =>
      'ਫੀਚਰ ਹੋਣ ਦੇ ਮੌਕੇ ਲਈ ਆਪਣੀ ਮੂਲ ਕਹਾਣੀ ਜਮ੍ਹਾਂ ਕਰੋ।';

  @override
  String get collabSubmitStory => 'ਕਹਾਣੀ ਜਮ੍ਹਾਂ ਕਰੋ';

  @override
  String get collabSponsorshipAd => 'ਸਪਾਂਸਰਸ਼ਿਪ / ਇਸ਼ਤਿਹਾਰ';

  @override
  String get collabSponsorshipSubtitle =>
      'ਸਪਾਂਸਰਸ਼ਿਪ ਲਈ ਆਪਣਾ ਬ੍ਰਾਂਡ ਜਾਂ ਕਾਰੋਬਾਰ ਜਮ੍ਹਾਂ ਕਰੋ।';

  @override
  String get collabSubmitAd => 'ਇਸ਼ਤਿਹਾਰ ਜਮ੍ਹਾਂ ਕਰੋ';

  @override
  String get collabDialogStoryTitle => 'ਆਪਣੀ ਕਹਾਣੀ ਜਮ੍ਹਾਂ ਕਰੋ';

  @override
  String get collabStoryTitle => 'ਕਹਾਣੀ ਦਾ ਸਿਰਲੇਖ';

  @override
  String get collabStoryTitleHint => 'ਆਪਣੀ ਕਹਾਣੀ ਦਾ ਸਿਰਲੇਖ ਦਰਜ ਕਰੋ';

  @override
  String get collabStoryContent => 'ਕਹਾਣੀ ਸਮੱਗਰੀ';

  @override
  String get collabStoryContentHint => 'ਆਪਣੀ ਕਹਾਣੀ ਇੱਥੇ ਲਿਖੋ...';

  @override
  String get collabCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get collabSubmit => 'ਜਮ੍ਹਾਂ ਕਰੋ';

  @override
  String get collabDialogAdTitle => 'ਇਸ਼ਤਿਹਾਰ ਜਮ੍ਹਾਂ ਕਰੋ';

  @override
  String get collabBrandName => 'ਬ੍ਰਾਂਡ ਨਾਮ';

  @override
  String get collabBrandNameHint => 'ਤੁਹਾਡਾ ਬ੍ਰਾਂਡ/ਕਾਰੋਬਾਰ ਨਾਮ';

  @override
  String get collabDescription => 'ਵਰਣਨ';

  @override
  String get collabDescriptionHint => 'ਆਪਣਾ ਇਸ਼ਤਿਹਾਰ ਦੱਸੋ';

  @override
  String get collabTargetUrl => 'ਟਾਰਗੇਟ URL (ਵਿਕਲਪਿਕ)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'ਚਿੱਤਰ ਚੁਣਿਆ ਗਿਆ';

  @override
  String get collabUploadAdVisual => 'ਇਸ਼ਤਿਹਾਰ ਵਿਜ਼ੁਅਲ ਅਪਲੋਡ ਕਰੋ';

  @override
  String get collabStatusRunning => 'ਚੱਲ ਰਿਹਾ ਹੈ';

  @override
  String get collabStatusExpired => 'ਮਿਆਦ ਖਤਮ';

  @override
  String get languagesAppLanguage => 'ਐਪ ਭਾਸ਼ਾ';

  @override
  String get languagesSubtitleLanguage => 'ਸਬਟਾਈਟਲ ਭਾਸ਼ਾ';

  @override
  String get bottomNavHome => 'ਹੋਮ';

  @override
  String get bottomNavSearch => 'ਖੋਜ';

  @override
  String get bottomNavCategories => 'ਸ਼੍ਰੇਣੀਆਂ';

  @override
  String get bottomNavMyList => 'ਮੇਰੀ ਸੂਚੀ';

  @override
  String get bottomNavProfile => 'ਪ੍ਰੋਫ਼ਾਈਲ';

  @override
  String get networkOffline => 'ਔਫਲਾਈਨ ਮੋਡ';

  @override
  String get networkDownload => 'ਡਾਊਨਲੋਡ ਮੋਡ';

  @override
  String get networkOfflineSnackbar =>
      'ਔਫਲਾਈਨ ਮੋਡ ਚਾਲੂ\nਡਾਊਨਲੋਡ ਸਮੱਗਰੀ ਖੋਜਣੀ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get networkDismiss => 'ਖਾਰਜ ਕਰੋ';

  @override
  String get loadingPleaseWait => 'ਕਿਰਪਾ ਕਰਕੇ ਉਡੀਕ ਕਰੋ...';

  @override
  String get commonRetry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get guestTimerTitle => 'ਮੁਫਤ ਸਮਾਂ ਖਤਮ!';

  @override
  String get guestTimerBody =>
      'ਸਾਰੀ ਸਮੱਗਰੀ ਐਕਸੈਸ ਕਰਨ ਲਈ ਲੌਗਇਨ ਕਰੋ।\nਇਹ ਤੁਹਾਡੇ ਲਈ ਮੁਫਤ ਹੈ!';

  @override
  String get freeLimitTitle => 'ਮੁਫਤ ਸੀਮਾ ਪੂਰੀ';

  @override
  String get freeLimitBody =>
      'ਤੁਸੀਂ ਆਪਣੀ 1 ਮਿੰਟ ਦੀ ਮੁਫਤ ਸੁਣਨ ਦੀ ਸੀਮਾ ਵਰਤ ਲਈ ਹੈ। ਪੂਰਾ ਐਪੀਸੋਡ ਸੁਣਨਾ ਜਾਰੀ ਰੱਖਣ ਲਈ ਕਿਰਪਾ ਕਰਕੇ ਲੌਗਇਨ ਕਰੋ ਜਾਂ ਸਾਈਨ ਅੱਪ ਕਰੋ।';

  @override
  String get guestTimerLater => 'ਬਾਅਦ ਵਿੱਚ';

  @override
  String get guestTimerLogin => 'ਲੌਗਇਨ / ਸਾਈਨ ਅੱਪ';

  @override
  String get errorDataError => 'ਡੇਟਾ ਗੜਬੜੀ ਹੋਈ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errorInvalidData => 'ਅਵੈਧ ਡੇਟਾ ਫਾਰਮੈਟ ਪ੍ਰਾਪਤ ਹੋਇਆ।';

  @override
  String get errorUnexpected => 'ਇੱਕ ਅਣਕਿਆਸੀ ਗੜਬੜੀ ਹੋਈ।';

  @override
  String get errorTimeout =>
      'ਕਨੈਕਸ਼ਨ ਟਾਈਮਆਊਟ। ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਇੰਟਰਨੈੱਟ ਕਨੈਕਸ਼ਨ ਜਾਂਚੋ।';

  @override
  String get errorNoInternet =>
      'ਕੋਈ ਇੰਟਰਨੈੱਟ ਕਨੈਕਸ਼ਨ ਨਹੀਂ। ਕਿਰਪਾ ਕਰਕੇ ਆਪਣੀਆਂ ਨੈੱਟਵਰਕ ਸੈਟਿੰਗਾਂ ਜਾਂਚੋ।';

  @override
  String get errorCancelled => 'ਬੇਨਤੀ ਰੱਦ ਕਰ ਦਿੱਤੀ ਗਈ।';

  @override
  String get errorSecurity =>
      'ਕਨੈਕਸ਼ਨ ਸੁਰੱਖਿਆ ਗੜਬੜੀ। ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਐਪ ਅੱਪਡੇਟ ਕਰੋ।';

  @override
  String get errorNetwork => 'ਇੱਕ ਅਣਕਿਆਸੀ ਨੈੱਟਵਰਕ ਗੜਬੜੀ ਹੋਈ।';

  @override
  String get errorInvalidRequest =>
      'ਅਵੈਧ ਬੇਨਤੀ। ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਇਨਪੁਟ ਪ੍ਰਮਾਣਿਤ ਕਰੋ।';

  @override
  String get errorSessionExpired =>
      'ਸੈਸ਼ਨ ਖਤਮ ਹੋ ਗਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਸਾਈਨ ਇਨ ਕਰੋ।';

  @override
  String get errorPermissionDenied =>
      'ਤੁਹਾਡੇ ਕੋਲ ਇਹ ਕਾਰਵਾਈ ਕਰਨ ਦੀ ਇਜਾਜ਼ਤ ਨਹੀਂ ਹੈ।';

  @override
  String get errorNotFound => 'ਬੇਨਤੀ ਕੀਤਾ ਸਰੋਤ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String get errorConflict => 'ਟਕਰਾਅ ਪਾਇਆ ਗਿਆ। ਸਰੋਤ ਅੱਪਡੇਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।';

  @override
  String get errorValidationFailed =>
      'ਪ੍ਰਮਾਣੀਕਰਨ ਅਸਫ਼ਲ। ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਇਨਪੁਟ ਜਾਂਚੋ।';

  @override
  String get errorTooManyRequests =>
      'ਬਹੁਤ ਸਾਰੀਆਂ ਬੇਨਤੀਆਂ। ਕਿਰਪਾ ਕਰਕੇ ਬਾਅਦ ਵਿੱਚ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errorServer =>
      'ਸਰਵਰ ਗੜਬੜੀ। ਕਿਰਪਾ ਕਰਕੇ ਬਾਅਦ ਵਿੱਚ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errorServiceUnavailable =>
      'ਸੇਵਾ ਅਸਥਾਈ ਤੌਰ \'ਤੇ ਅਣਉਪਲਬਧ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errorUnderMaintenance =>
      'ਸੇਵਾ ਰੱਖ-ਰਖਾਅ ਅਧੀਨ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਬਾਅਦ ਵਿੱਚ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String errorGeneric(Object code) {
    return 'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ। (ਗੜਬੜੀ $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'ਕਨੈਕਸ਼ਨ ਟਾਈਮਆਊਟ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errorNoConnection => 'ਕੋਈ ਇੰਟਰਨੈੱਟ ਕਨੈਕਸ਼ਨ ਨਹੀਂ।';

  @override
  String errorServerWithCode(Object code) {
    return 'ਸਰਵਰ ਗੜਬੜੀ ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get pageNotFound => 'ਪੰਨਾ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get pageNotFoundMessage =>
      'ਤੁਸੀਂ ਜਿਸ ਪੰਨੇ ਦੀ ਭਾਲ ਕਰ ਰਹੇ ਹੋ ਉਹ ਮੌਜੂਦ ਨਹੀਂ ਹੈ।';

  @override
  String get goHome => 'ਹੋਮ \'ਤੇ ਜਾਓ';

  @override
  String get relativeTimeJustNow => 'ਹੁਣੇ ਹੁਣੇ';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '$minutes ਮਿ ਪਹਿਲਾਂ';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '$hours ਘ ਪਹਿਲਾਂ';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '$days ਦਿ ਪਹਿਲਾਂ';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '$weeks ਹਫ ਪਹਿਲਾਂ';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '$months ਮਹੀ ਪਹਿਲਾਂ';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '$years ਸਾ ਪਹਿਲਾਂ';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return '$minutes ਮਿ ਵਿੱਚ';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return '$hours ਘ ਵਿੱਚ';
  }

  @override
  String relativeTimeInDay(Object days) {
    return '$days ਦਿ ਵਿੱਚ';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '$hoursਘ $minutesਮਿ';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '$minutesਮਿ $secondsਸ';
  }

  @override
  String fileSizeBytes(Object size) {
    return '$size ਬਾ';
  }

  @override
  String fileSizeKB(Object size) {
    return '$size ਕੇਬੀ';
  }

  @override
  String fileSizeMB(Object size) {
    return '$size ਐੱਮਬੀ';
  }

  @override
  String fileSizeGB(Object size) {
    return '$size ਜੀਬੀ';
  }

  @override
  String countViewsM(Object count) {
    return '$countਮਿ';
  }

  @override
  String countViewsK(Object count) {
    return '$countਹ';
  }

  @override
  String episodeCount(Object count) {
    return '$count ਐਪਿ';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'S$season E$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'ਸੀਜ਼ਨ $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return 'No episodes available in $language';
  }

  @override
  String get contentDisclaimer =>
      'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.';

  @override
  String get categoryDrama => 'ਡਰਾਮਾ';

  @override
  String get categoryComedy => 'ਕਾਮੇਡੀ';

  @override
  String get categoryPodcasts => 'ਪਾਡਕਾਸਟ';

  @override
  String get categoryMusic => 'ਸੰਗੀਤ';

  @override
  String get categoryKids => 'ਬੱਚੇ';

  @override
  String get categoryDevotional => 'ਭਗਤੀ';

  @override
  String get categoryNews => 'ਖ਼ਬਰਾਂ';

  @override
  String get categorySports => 'ਖੇਡਾਂ';

  @override
  String get categoryTechnology => 'ਤਕਨਾਲੋਜੀ';

  @override
  String get categoryEducation => 'ਸਿੱਖਿਆ';

  @override
  String get categoryBusiness => 'ਕਾਰੋਬਾਰ';

  @override
  String get categoryHealth => 'ਸਿਹਤ';

  @override
  String get categoryScience => 'ਵਿਗਿਆਨ';

  @override
  String get categoryArts => 'ਕਲਾ';

  @override
  String get trendingDramaSeries => 'ਡਰਾਮਾ ਸੀਰੀਜ਼';

  @override
  String get trendingComedyShows => 'ਕਾਮੇਡੀ ਸ਼ੋਅ';

  @override
  String get trendingPodcasts => 'ਪਾਡਕਾਸਟ';

  @override
  String get trendingMusicAlbums => 'ਸੰਗੀਤ ਐਲਬਮਾਂ';

  @override
  String get trendingKidsStories => 'ਬੱਚਿਆਂ ਦੀਆਂ ਕਹਾਣੀਆਂ';

  @override
  String get trendingDevotional => 'ਭਗਤੀ';

  @override
  String get trendingNewsToday => 'ਅੱਜ ਦੀਆਂ ਖ਼ਬਰਾਂ';

  @override
  String get trendingSportsHighlights => 'ਖੇਡ ਹਾਈਲਾਈਟਸ';

  @override
  String get languageEnglish => 'ਅੰਗਰੇਜ਼ੀ';

  @override
  String get languageHindi => 'ਹਿੰਦੀ';

  @override
  String get languagePunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get languageHaryanvi => 'ਹਰਿਆਣਵੀ';

  @override
  String get languageMarathi => 'ਮਰਾਠੀ';

  @override
  String get languageGujarati => 'ਗੁਜਰਾਤੀ';

  @override
  String get languageBengali => 'ਬੰਗਾਲੀ';

  @override
  String get languageTamil => 'ਤਮਿਲ';

  @override
  String get languageTelugu => 'ਤੇਲੁਗੂ';

  @override
  String get languageKannada => 'ਕੰਨੜ';

  @override
  String get languageMalayalam => 'ਮਲਿਆਲਮ';

  @override
  String get languageUrdu => 'ਉਰਦੂ';

  @override
  String get pressBackToExit => 'ਬਾਹਰ ਜਾਣ ਲਈ ਦੁਬਾਰਾ ਪਿੱਛੇ ਦਬਾਓ';

  @override
  String get exitDialogTitle => 'ਐਪ ਬੰਦ ਕਰੋ?';

  @override
  String get exitDialogBody => 'ਕੀ ਤੁਸੀਂ ਸੱਚਮੁੱਚ ਐਪ ਬੰਦ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get exitDialogConfirm => 'ਬੰਦ ਕਰੋ';

  @override
  String get exitDialogCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get profileShareApp => 'Share App';

  @override
  String get profileShareAppMessage =>
      'Check out WebroFM - your go-to app for streaming shows and podcasts!';
}
