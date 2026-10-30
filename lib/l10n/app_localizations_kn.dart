// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'WebroFM';

  @override
  String get splashLoading => 'ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get welcomeTitle => 'WebroFM ಗೆ ಸುಸ್ವಾಗತ';

  @override
  String get welcomeSubtitle => 'ನಿಮ್ಮನ್ನು ಕದಲಿಸುವ ಕಥೆಗಳನ್ನು ಅನ್ವೇಷಿಸಿ';

  @override
  String get welcomeGetStarted => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get welcomeContinueAsGuest => 'ಅತಿಥಿಯಾಗಿ ಮುಂದುವರಿಸಿ';

  @override
  String get loginSearchCountries => 'ದೇಶಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get loginInvalidPhone => 'ದಯವಿಟ್ಟು ಮಾನ್ಯ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ';

  @override
  String get loginRateLimitTitle => 'ದರ ಮಿತಿ ತಲುಪಿದೆ';

  @override
  String get loginRateLimitContent =>
      'ಹಲವು OTP ಪ್ರಯತ್ನಗಳು. ದಯವಿಟ್ಟು 1 ಗಂಟೆಯ ನಂತರ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get loginOk => 'ಸರಿ';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'ಈ ಗಂಟೆಯಲ್ಲಿ $remaining ಪ್ರಯತ್ನ ಮಾತ್ರ ಉಳಿದಿದೆ';
  }

  @override
  String get loginTitle => 'ಮುಂದುವರಿಸಲು ಲಾಗಿನ್ ಮಾಡಿ';

  @override
  String get loginSubtitle => 'ಪ್ರಾರಂಭಿಸಲು ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ';

  @override
  String get loginPhoneHint => '(555) 000-0000';

  @override
  String get loginIAgreeTo => 'ನಾನು ಇದನ್ನು ಒಪ್ಪುತ್ತೇನೆ ';

  @override
  String get loginTermsOfUse => 'ಬಳಕೆಯ ನಿಯಮಗಳು';

  @override
  String get loginAnd => ' ಮತ್ತು ';

  @override
  String get loginPrivacyPolicy => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get loginSendOtp => 'OTP ಕಳುಹಿಸಿ';

  @override
  String get loginContinueAsGuest => 'ಅತಿಥಿಯಾಗಿ ಮುಂದುವರಿಸಿ';

  @override
  String get otpEnterCompleteCode => 'ದಯವಿಟ್ಟು ಸಂಪೂರ್ಣ 6-ಅಂಕಿಯ ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get otpTitle => 'ನಿಮ್ಮ ಸಂಖ್ಯೆಯನ್ನು ಪರಿಶೀಲಿಸಿ';

  @override
  String get otpSubtitle => 'ಇದಕ್ಕೆ ಕಳುಹಿಸಿದ ಕೋಡ್ ಅನ್ನು ನಮೂದಿಸಿ';

  @override
  String get otpVerifyAndContinue => 'ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಮುಂದುವರಿಸಿ';

  @override
  String get otpDidntReceive => 'ಕೋಡ್ ಸ್ವೀಕರಿಸಲಿಲ್ಲವೇ? ';

  @override
  String get otpResend => 'OTP ಮರುಕಳುಹಿಸಿ';

  @override
  String get completeProfileTitle => 'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ';

  @override
  String get completeProfileSubtitle =>
      'ನಿಮ್ಮ ಅನುಭವವನ್ನು ವೈಯಕ್ತೀಕರಿಸಲು ನಮಗೆ ಸಹಾಯ ಮಾಡಿ';

  @override
  String get completeProfileBasicInfo => 'ಮೂಲ ಮಾಹಿತಿ';

  @override
  String get completeProfileFullName => 'ಪೂರ್ಣ ಹೆಸರು *';

  @override
  String get completeProfileNameHint => 'ಜಾನ್ ಡೋ';

  @override
  String get completeProfileEmail => 'ಇಮೇಲ್ ವಿಳಾಸ';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'ಲಿಂಗ *';

  @override
  String get completeProfileDateOfBirth => 'ಹುಟ್ಟಿದ ದಿನಾಂಕ';

  @override
  String get completeProfileDobHint => 'ನಿಮ್ಮ ಹುಟ್ಟಿದ ದಿನಾಂಕವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get completeProfileMale => 'ಪುರುಷ';

  @override
  String get completeProfileFemale => 'ಸ್ತ್ರೀ';

  @override
  String get completeProfileOther => 'ಇತರೆ';

  @override
  String get completeProfileError =>
      'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಹೆಸರನ್ನು ನಮೂದಿಸಿ ಮತ್ತು ಲಿಂಗವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get completeProfileSkip => 'ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get completeProfileContinue => 'ಮುಂದುವರಿಸಿ';

  @override
  String get interestTitle => 'ನಿಮ್ಮ ಆಸಕ್ತಿಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get interestSubtitle =>
      'ವೈಯಕ್ತೀಕರಿಸಿದ ಶಿಫಾರಸುಗಳಿಗಾಗಿ ನೀವು ಆನಂದಿಸುವ ವರ್ಗಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get interestSectionHeader => 'ನಿಮ್ಮ ಆಸಕ್ತಿಗಳನ್ನು ಆರಿಸಿಕೊಳ್ಳಿ';

  @override
  String get interestTapToSelect => 'ಆಯ್ಕೆ ಮಾಡಲು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get interestContinue => 'WebroFM ಗೆ ಮುಂದುವರಿಸಿ';

  @override
  String get interestSkip => 'ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get registrationTitle => 'ನಿಮ್ಮ ಬಗ್ಗೆ ನಮಗೆ ತಿಳಿಸಿ';

  @override
  String get registrationSubtitle =>
      'ನಿಮ್ಮ ಅನುಭವವನ್ನು ವೈಯಕ್ತೀಕರಿಸಲು ನಮಗೆ ಸಹಾಯ ಮಾಡಿ';

  @override
  String get registrationPersonalInfo => 'ವೈಯಕ್ತಿಕ ಮಾಹಿತಿ';

  @override
  String get registrationFullName => 'ಪೂರ್ಣ ಹೆಸರು';

  @override
  String get registrationNameHint => 'ಜಾನ್ ಡೋ';

  @override
  String get registrationEmail => 'ಇಮೇಲ್ ವಿಳಾಸ';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'ಹುಟ್ಟಿದ ದಿನಾಂಕ';

  @override
  String get registrationDobHint => 'ನಿಮ್ಮ ಹುಟ್ಟಿದ ದಿನಾಂಕವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get registrationInterestsHeader => 'ನಿಮ್ಮ ಆಸಕ್ತಿಗಳನ್ನು ಆರಿಸಿಕೊಳ್ಳಿ';

  @override
  String get registrationInterestsSubtitle =>
      'ನೀವು ಆನಂದಿಸುವ ವರ್ಗಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get registrationContinue => 'WebroFM ಗೆ ಮುಂದುವರಿಸಿ';

  @override
  String get registrationNameError => 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಹೆಸರನ್ನು ನಮೂದಿಸಿ';

  @override
  String get homeContinueWatching => 'ವೀಕ್ಷಿಸುವುದನ್ನು ಮುಂದುವರಿಸಿ';

  @override
  String get homeContinueListening => 'ಕೇಳುವುದನ್ನು ಮುಂದುವರಿಸಿ';

  @override
  String get homeResume => 'ಪುನರಾರಂಭಿಸಿ';

  @override
  String get homeNewArrivals => 'ಹೊಸ ಆಗಮನಗಳು';

  @override
  String get homeSeeAll => 'ಎಲ್ಲವನ್ನು ನೋಡಿ';

  @override
  String get homePopularNow => 'ಈಗ ಜನಪ್ರಿಯವಾಗಿವೆ';

  @override
  String get homeNoShows => 'ಶೋಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get showDetailFailed => 'ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get showDetailNotFound => 'ಶೋ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String showDetailShareText(Object title) {
    return 'WebroFM ನಲ್ಲಿ $title ಅನ್ನು ಪರಿಶೀಲಿಸಿ!';
  }

  @override
  String get showDetailDownloadStarted => 'ಡೌನ್ಲೋಡ್ ಪ್ರಾರಂಭವಾಗಿದೆ';

  @override
  String get showDetailNoDescription => 'ವಿವರಣೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get showDetailReadLess => 'ಕಡಿಮೆ ಓದಿ';

  @override
  String get showDetailReadMore => 'ಹೆಚ್ಚು ಓದಿ';

  @override
  String get showDetailPlayLatest => 'ಇತ್ತೀಚಿನ ಸಂಚಿಕೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get showDetailEpisodes => 'ಸಂಚಿಕೆಗಳು';

  @override
  String get showDetailNoEpisodes => 'ಸಂಚಿಕೆಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get showDetailMoreLikeThis => 'ಇದೇ ರೀತಿಯವುಗಳು';

  @override
  String get videoPlayerNoAudio => 'ಈ ಸಂಚಿಕೆಗೆ ಆಡಿಯೊ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get videoPlayerLoading => 'ವೀಡಿಯೊ ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get videoPlayerNowPlaying => 'ಈಗ ಪ್ಲೇ ಆಗುತ್ತಿದೆ';

  @override
  String get videoPlayerPaused => 'ವಿರಾಮಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'ಪ್ಲೇಬ್ಯಾಕ್ ದೋಷ: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'ವೀಡಿಯೊ ಪ್ಲೇಯರ್';

  @override
  String get videoPlayerNext => 'ಮುಂದಿನ';

  @override
  String get videoPlayerAudio => 'ಆಡಿಯೊ';

  @override
  String get videoPlayerVideo => 'ವೀಡಿಯೊ';

  @override
  String get showCardNew => 'ಹೊಸದು';

  @override
  String get searchHint => 'ಶೋಗಳು, ಸಂಚಿಕೆಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String get searchTrending => 'ಟ್ರೆಂಡಿಂಗ್ ಹುಡುಕಾಟಗಳು';

  @override
  String get searchSuggested => 'ನಿಮಗಾಗಿ ಸೂಚಿಸಲಾಗಿದೆ';

  @override
  String get searchError => 'ಏನೋ ತಪ್ಪಾಗಿದೆ';

  @override
  String get searchNoResults => 'ಫಲಿತಾಂಶಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get searchNoResultsSubtitle =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟ ಪದಗಳನ್ನು ಸರಿಹೊಂದಿಸಲು ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get categoriesTitle => 'ವರ್ಗಗಳನ್ನು ಅನ್ವೇಷಿಸಿ';

  @override
  String categoriesShowCount(Object count) {
    return '$count ಶೋಗಳು';
  }

  @override
  String get categoryDetailFailed => 'ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get categoryDetailLoadMore => 'ಹೆಚ್ಚು ಲೋಡ್ ಮಾಡಿ';

  @override
  String get categoryDetailSortBy => 'ವಿಂಗಡಿಸು';

  @override
  String get categoryDetailPopular => 'ಜನಪ್ರಿಯ';

  @override
  String get categoryDetailNewest => 'ಹೊಸದು';

  @override
  String get categoryDetailTopRated => 'ಉನ್ನತ ರೇಟೆಡ್';

  @override
  String get myListTitle => 'ನನ್ನ ಪಟ್ಟಿ';

  @override
  String get myListSaved => 'ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get myListWatchHistory => 'ವೀಕ್ಷಣೆ ಇತಿಹಾಸ';

  @override
  String get myListError => 'ಏನೋ ತಪ್ಪಾಗಿದೆ';

  @override
  String get myListNoSaved => 'ಇನ್ನೂ ಉಳಿಸಿದ ವಸ್ತುಗಳಿಲ್ಲ';

  @override
  String get myListNoHistory => 'ಇನ್ನೂ ವೀಕ್ಷಣೆ ಇತಿಹಾಸವಿಲ್ಲ';

  @override
  String get myListNoSavedSubtitle =>
      'ಅನ್ವೇಷಿಸಲು ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ನಿಮ್ಮ ಮೆಚ್ಚಿನವುಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get myListNoHistorySubtitle =>
      'ನೀವು ಇತ್ತೀಚೆಗೆ ವೀಕ್ಷಿಸಿದ ಶೋಗಳು ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ';

  @override
  String get myListExploreShows => 'ಶೋಗಳನ್ನು ಅನ್ವೇಷಿಸಿ';

  @override
  String get myListRemoved => 'ನನ್ನ ಪಟ್ಟಿಯಿಂದ ತೆಗೆದುಹಾಕಲಾಗಿದೆ';

  @override
  String get myListLoginTitle => 'ನಿಮ್ಮ ಉಳಿಸಿದ ಶೋಗಳನ್ನು ನೋಡಲು ಲಾಗಿನ್ ಮಾಡಿ';

  @override
  String get myListLoginSubtitle =>
      'ನಿಮ್ಮ ನೆಚ್ಚಿನ ಶೋಗಳನ್ನು ಉಳಿಸಿ ಮತ್ತು ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಪ್ರವೇಶಿಸಿ';

  @override
  String get profileTitle => 'ಪ್ರೊಫೈಲ್';

  @override
  String get profileUser => 'ಬಳಕೆದಾರ';

  @override
  String get profileNoPhone => 'ಫೋನ್ ಇಲ್ಲ';

  @override
  String get profileEditProfile => 'ಪ್ರೊಫೈಲ್ ಸಂಪಾದಿಸಿ';

  @override
  String get profileYourInterests => 'ನಿಮ್ಮ ಆಸಕ್ತಿಗಳು';

  @override
  String get profileNoCategories => 'ಯಾವುದೇ ವರ್ಗ ಆಯ್ಕೆ ಮಾಡಿಲ್ಲ';

  @override
  String get profileDobLabel => 'ಜನ್ಮ ದಿನಾಂಕ';

  @override
  String get profileNotLoggedIn => 'ನೀವು ಲಾಗಿನ್ ಆಗಿಲ್ಲ';

  @override
  String get profileNotLoggedInSubtitle =>
      'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್, ಡೌನ್ಲೋಡ್ಗಳು ಮತ್ತು ವೈಯಕ್ತೀಕರಿಸಿದ ಶಿಫಾರಸುಗಳನ್ನು ಪ್ರವೇಶಿಸಲು ಸೈನ್ ಇನ್ ಮಾಡಿ.';

  @override
  String get profileLogin => 'ಲಾಗಿನ್';

  @override
  String get profileCollaboration => 'ಸಹಯೋಗ';

  @override
  String get profileSettings => 'ಸೆಟ್ಟಿಂಗ್ಗಳು ಮತ್ತು ಆದ್ಯತೆಗಳು';

  @override
  String get profileMyDownloads => 'ನನ್ನ ಡೌನ್ಲೋಡ್ಗಳು';

  @override
  String get profileTermsOfUse => 'ಬಳಕೆಯ ನಿಯಮಗಳು';

  @override
  String get profilePrivacyPolicy => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get profileHelpFaq => 'ಸಹಾಯ ಮತ್ತು FAQ';

  @override
  String get profileContactUs => 'ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get profileLogout => 'ಲಾಗೌಟ್';

  @override
  String get profileLogoutTitle => 'ಲಾಗೌಟ್';

  @override
  String get profileLogoutConfirm => 'ನೀವು ಖಚಿತವಾಗಿ ಲಾಗೌಟ್ ಮಾಡಲು ಬಯಸುವಿರಾ?';

  @override
  String get profileCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get editProfileTitle => 'ಪ್ರೊಫೈಲ್ ಸಂಪಾದಿಸಿ';

  @override
  String get editProfileTapToChangePhoto => 'ಫೋಟೋ ಬದಲಾಯಿಸಲು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get editProfileFullName => 'ಪೂರ್ಣ ಹೆಸರು';

  @override
  String get editProfileNameRequired => 'ಹೆಸರು ಅಗತ್ಯವಿದೆ';

  @override
  String get editProfileEmail => 'ಇಮೇಲ್';

  @override
  String get editProfileEmailRequired => 'ಇಮೇಲ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get editProfileInvalidEmail => 'ಅಮಾನ್ಯ ಇಮೇಲ್';

  @override
  String get editProfileDob => 'ಹುಟ್ಟಿದ ದಿನಾಂಕ';

  @override
  String get editProfilePhone => 'ಫೋನ್';

  @override
  String get editProfileCategoryPreferences => 'ವರ್ಗದ ಆದ್ಯತೆಗಳು';

  @override
  String get editProfileAddMore => 'ಹೆಚ್ಚು ಸೇರಿಸಿ';

  @override
  String get editProfileAddCategory => 'ವರ್ಗ ಸೇರಿಸಿ';

  @override
  String get editProfileSaveChanges => 'ಬದಲಾವಣೆಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get editProfileUserDataNotAvailable => 'ಬಳಕೆದಾರ ಡೇಟಾ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get editProfileUpdatedSuccess => 'ಪ್ರೊಫೈಲ್ ಯಶಸ್ವಿಯಾಗಿ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get editProfileCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get editProfileSubmit => 'ಸಲ್ಲಿಸಿ';

  @override
  String get settingsTitle => 'ಸೆಟ್ಟಿಂಗ್ಗಳು';

  @override
  String get settingsGeneral => 'ಸಾಮಾನ್ಯ';

  @override
  String get settingsAppLanguage => 'ಅಪ್ಲಿಕೇಶನ್ ಭಾಷೆ';

  @override
  String get settingsSubtitleLanguage => 'ಉಪಶೀರ್ಷಿಕೆ ಭಾಷೆ';

  @override
  String get settingsAppearancePlayback => 'ಗೋಚರತೆ ಮತ್ತು ಪ್ಲೇಬ್ಯಾಕ್';

  @override
  String get settingsColorTheme => 'ಬಣ್ಣದ ಥೀಮ್';

  @override
  String get settingsLight => 'ಲೈಟ್';

  @override
  String get settingsDark => 'ಡಾರ್ಕ್';

  @override
  String get settingsSystem => 'ಸಿಸ್ಟಮ್';

  @override
  String get settingsAutoplayNext => 'ಮುಂದಿನ ಸಂಚಿಕೆ ಸ್ವಯಂಪ್ಲೇ';

  @override
  String get settingsDownloadQuality => 'ಡೌನ್ಲೋಡ್ ಗುಣಮಟ್ಟ';

  @override
  String get settingsLow => 'ಕಡಿಮೆ';

  @override
  String get settingsMedium => 'ಮಧ್ಯಮ';

  @override
  String get settingsHigh => 'ಹೆಚ್ಚು';

  @override
  String get settingsVeryHigh => 'ತುಂಬಾ ಹೆಚ್ಚು';

  @override
  String get settingsAccountPrivacy => 'ಖಾತೆ ಮತ್ತು ಗೌಪ್ಯತೆ';

  @override
  String get settingsAgeRestriction => 'ವಯಸ್ಸು/ವಿಷಯ ನಿರ್ಬಂಧ';

  @override
  String get settingsNotifications => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get settingsDangerZone => 'ಅಪಾಯ ವಲಯ';

  @override
  String get settingsDeleteAccount => 'ನನ್ನ ಖಾತೆಯನ್ನು ಅಳಿಸಿ';

  @override
  String get deleteAccountTitle => 'ಖಾತೆಯನ್ನು ಅಳಿಸಿ';

  @override
  String get deleteAccountHeader => 'ನನ್ನ ಖಾತೆಯನ್ನು ಅಳಿಸಿ';

  @override
  String get deleteAccountWarning =>
      'ಈ ಕ್ರಿಯೆಯನ್ನು ಹಿಂತಿರುಗಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ. ನಿಮ್ಮ ಎಲ್ಲಾ ಡೇಟಾವನ್ನು ಶಾಶ್ವತವಾಗಿ ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ.';

  @override
  String get deleteAccountDataLoss => 'ಕೆಳಗಿನ ಡೇಟಾ ಕಳೆದುಹೋಗುತ್ತದೆ:';

  @override
  String get deleteAccountReason => 'ಅಳಿಸುವಿಕೆಗೆ ಕಾರಣ';

  @override
  String get deleteAccountSelectReason => 'ಕಾರಣವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get deleteAccountNotUsing => 'ನಾನು ಇನ್ನು ಮುಂದೆ ಅಪ್ಲಿಕೇಶನ್ ಬಳಸುವುದಿಲ್ಲ';

  @override
  String get deleteAccountTooExpensive => 'ತುಂಬಾ ದುಬಾರಿ';

  @override
  String get deleteAccountPrivacy => 'ಗೌಪ್ಯತೆ ಕಾಳಜಿಗಳು';

  @override
  String get deleteAccountTechnicalIssues => 'ತಾಂತ್ರಿಕ ಸಮಸ್ಯೆಗಳು';

  @override
  String get deleteAccountFoundAlternative => 'ಉತ್ತಮ ಪರ್ಯಾಯ ಸಿಕ್ಕಿದೆ';

  @override
  String get deleteAccountOther => 'ಇತರೆ';

  @override
  String get deleteAccountProfileSettings => 'ಪ್ರೊಫೈಲ್ ಮತ್ತು ಸೆಟ್ಟಿಂಗ್ಗಳು';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಮಾಹಿತಿ, ಆದ್ಯತೆಗಳು ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಸೆಟ್ಟಿಂಗ್ಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get deleteAccountListeningHistory => 'ಕೇಳಿದ ಇತಿಹಾಸ';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'ನಿಮ್ಮ ಕೇಳಿದ ಇತಿಹಾಸ, ಹುಡುಕಾಟ ಇತಿಹಾಸ ಮತ್ತು ಚಟುವಟಿಕೆ ಲಾಗ್ಗಳನ್ನು ಅಳಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get deleteAccountSavedItems => 'ಉಳಿಸಿದ ವಸ್ತುಗಳು';

  @override
  String get deleteAccountSavedItemsDesc =>
      'ನಿಮ್ಮ ಎಲ್ಲಾ ಪ್ಲೇಲಿಸ್ಟ್ಗಳು, ಮೆಚ್ಚಿನವುಗಳು ಮತ್ತು ಉಳಿಸಿದ ವಿಷಯವನ್ನು ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ.';

  @override
  String get deleteAccountSubscriptions => 'ಚಂದಾದಾರಿಕೆಗಳು';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'ಯಾವುದೇ ಸಕ್ರಿಯ ಚಂದಾದಾರಿಕೆಗಳನ್ನು ರದ್ದುಗೊಳಿಸಲಾಗುತ್ತದೆ ಮತ್ತು ಪ್ರೀಮಿಯಂ ಪ್ರವೇಶವು ಕೊನೆಗೊಳ್ಳುತ್ತದೆ.';

  @override
  String get deleteAccountDelete => 'ನನ್ನ ಖಾತೆಯನ್ನು ಅಳಿಸಿ';

  @override
  String get deleteAccountCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get deleteAccountOtpTitle => 'ಅಳಿಸುವಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return '$phone ಗೆ ಕಳುಹಿಸಿದ OTP ಅನ್ನು ನಮೂದಿಸಿ';
  }

  @override
  String get deleteAccountOtpConfirm => 'ಅಳಿಸುವಿಕೆಯನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get deleteAccountOtpResend => 'OTP ಮರುಕಳುಹಿಸಿ';

  @override
  String get deleteAccountOtpResent => 'OTP ಯಶಸ್ವಿಯಾಗಿ ಮರುಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String get accountDeletedTitle => 'ಖಾತೆ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get accountDeletedMessage =>
      'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಲಾಗಿದೆ.\nನೀವು ಹೋಗುತ್ತಿರುವುದನ್ನು ನೋಡಿ ನಮಗೆ ವಿಷಾದವಿದೆ.';

  @override
  String get accountDeletedBackToHome => 'ಹೋಮ್‌ಗೆ ಹಿಂತಿರುಗಿ';

  @override
  String get contactUsTitle => 'ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get contactUsSubtitle => 'ನಿಮ್ಮಿಂದ ಕೇಳಲು ನಾವು ಇಷ್ಟಪಡುತ್ತೇವೆ';

  @override
  String get contactUsSubject => 'ವಿಷಯ';

  @override
  String get contactUsMessageLabel => 'ಸಂದೇಶ';

  @override
  String get contactUsMessageHint =>
      'ನಿಮ್ಮ ಸಮಸ್ಯೆ ಅಥವಾ ಪ್ರಶ್ನೆಯನ್ನು ವಿವರಿಸಿ...';

  @override
  String get contactUsAddAttachment => 'ಲಗತ್ತು ಸೇರಿಸಿ';

  @override
  String get contactUsQuickContact => 'ತ್ವರಿತ ಸಂಪರ್ಕ';

  @override
  String get contactUsEmail => 'ಇಮೇಲ್';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'ಕರೆ';

  @override
  String get contactUsCallValue => '+1 (555) 123-4567';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'ನಮ್ಮೊಂದಿಗೆ ಚಾಟ್ ಮಾಡಿ';

  @override
  String get contactUsSend => 'ಸಂದೇಶ ಕಳುಹಿಸಿ';

  @override
  String get contactUsSending => 'ಕಳುಹಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get contactUsNoMessage => 'ದಯವಿಟ್ಟು ಸಂದೇಶವನ್ನು ನಮೂದಿಸಿ';

  @override
  String get contactUsSent => 'ಸಂದೇಶವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕಳುಹಿಸಲಾಗಿದೆ!';

  @override
  String get contactUsGeneralInquiry => 'ಸಾಮಾನ್ಯ ವಿಚಾರಣೆ';

  @override
  String get contactUsTechnicalSupport => 'ತಾಂತ್ರಿಕ ಬೆಂಬಲ';

  @override
  String get contactUsAccountIssue => 'ಖಾತೆ ಸಮಸ್ಯೆ';

  @override
  String get contactUsBillingQuestion => 'ಬಿಲ್ಲಿಂಗ್ ಪ್ರಶ್ನೆ';

  @override
  String get contactUsFeatureRequest => 'ವೈಶಿಷ್ಟ್ಯ ವಿನಂತಿ';

  @override
  String get contactUsBugReport => 'ದೋಷ ವರದಿ';

  @override
  String get helpFaqTitle => 'ಸಹಾಯ ಮತ್ತು FAQ';

  @override
  String get helpFaqSearchHint => 'FAQಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String get helpFaqNoResults => 'ಫಲಿತಾಂಶಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get helpFaqStillNeedHelp => 'ಇನ್ನೂ ಸಹಾಯ ಬೇಕೇ?';

  @override
  String get helpFaqContactUs => 'ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get helpFaqAll => 'ಎಲ್ಲಾ';

  @override
  String get helpFaqAccount => 'ಖಾತೆ';

  @override
  String get helpFaqPlayback => 'ಪ್ಲೇಬ್ಯಾಕ್';

  @override
  String get helpFaqBilling => 'ಬಿಲ್ಲಿಂಗ್';

  @override
  String get helpFaqOther => 'ಇತರೆ';

  @override
  String get helpFaq1Q => 'ನನ್ನ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ನಾನು ಹೇಗೆ ಮರುಹೊಂದಿಸುವುದು?';

  @override
  String get helpFaq1A =>
      'ಲಾಗಿನ್ ಪರದೆಯಿಂದ \'ಪಾಸ್‌ವರ್ಡ್ ಮರೆತಿರಾ\' ಟ್ಯಾಪ್ ಮಾಡುವ ಮೂಲಕ ನಿಮ್ಮ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಮರುಹೊಂದಿಸಬಹುದು. ನಿಮ್ಮ ನೋಂದಾಯಿತ ಇಮೇಲ್ ಅಥವಾ ಫೋನ್‌ಗೆ ಕಳುಹಿಸಲಾದ ಸೂಚನೆಗಳನ್ನು ಅನುಸರಿಸಿ.';

  @override
  String get helpFaq2Q => 'ನಾನು ನನ್ನ ಚಂದಾದಾರಿಕೆ ಯೋಜನೆಯನ್ನು ಬದಲಾಯಿಸಬಹುದೇ?';

  @override
  String get helpFaq2A =>
      'ಹೌದು, ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಯೋಜನೆಯನ್ನು ವೀಕ್ಷಿಸಲು ಮತ್ತು ಬದಲಾಯಿಸಲು ಸೆಟ್ಟಿಂಗ್ಗಳು > ಚಂದಾದಾರಿಕೆಗೆ ಹೋಗಿ. ಬದಲಾವಣೆಗಳು ಮುಂದಿನ ಬಿಲ್ಲಿಂಗ್ ಸೈಕಲ್‌ನಿಂದ ಜಾರಿಗೆ ಬರುತ್ತವೆ.';

  @override
  String get helpFaq3Q => 'ನನ್ನ ಖಾತೆಯನ್ನು ನಾನು ಹೇಗೆ ಅಳಿಸುವುದು?';

  @override
  String get helpFaq3A =>
      'ಸೆಟ್ಟಿಂಗ್ಗಳು > ಅಪಾಯ ವಲಯ > ನನ್ನ ಖಾತೆಯನ್ನು ಅಳಿಸಿ ಎಂಬಲ್ಲಿಗೆ ಹೋಗಿ. ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಲು ಪರಿಶೀಲನೆ ಹಂತಗಳನ್ನು ಅನುಸರಿಸಿ.';

  @override
  String get helpFaq4Q => 'ನನ್ನ ಡೌನ್ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್ಗಳು ಎಲ್ಲಿವೆ?';

  @override
  String get helpFaq4A =>
      'ಡೌನ್ಲೋಡ್ ಮಾಡಿದ ಸಂಚಿಕೆಗಳನ್ನು ಅಪ್ಲಿಕೇಶನ್ ಒಳಗೆ ನನ್ನ ಡೌನ್ಲೋಡ್ಗಳ ಅಡಿಯಲ್ಲಿ ಸಂಗ್ರಹಿಸಲಾಗುತ್ತದೆ. ಅವು ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ಕೇಳಲು ಲಭ್ಯವಿರುತ್ತವೆ.';

  @override
  String get helpFaq5Q => 'ನನ್ನ ಪ್ರೊಫೈಲ್ ಮಾಹಿತಿಯನ್ನು ನಾನು ಹೇಗೆ ನವೀಕರಿಸುವುದು?';

  @override
  String get helpFaq5A =>
      'ನಿಮ್ಮ ಹೆಸರು, ಇಮೇಲ್, ಹುಟ್ಟಿದ ದಿನಾಂಕ ಮತ್ತು ಪ್ರೊಫೈಲ್ ಚಿತ್ರವನ್ನು ನವೀಕರಿಸಲು ಪ್ರೊಫೈಲ್ > ಪ್ರೊಫೈಲ್ ಸಂಪಾದಿಸಿ ಎಂಬಲ್ಲಿಗೆ ಹೋಗಿ.';

  @override
  String get helpFaq6Q => 'ನನ್ನ ಆಡಿಯೊ ಏಕೆ ಪ್ಲೇ ಆಗುತ್ತಿಲ್ಲ?';

  @override
  String get helpFaq6A =>
      'ನಿಮ್ಮ ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಲು ಪ್ರಯತ್ನಿಸಿ. ಸಮಸ್ಯೆ ಮುಂದುವರಿದರೆ, ಸೆಟ್ಟಿಂಗ್ಗಳಿಂದ ಅಪ್ಲಿಕೇಶನ್ ಕ್ಯಾಷ್ ಅನ್ನು ತೆರವುಗೊಳಿಸಲು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get helpFaq7Q => 'ನಾನು ಹೇಗೆ ಮರುಪಾವತಿ ಪಡೆಯುವುದು?';

  @override
  String get helpFaq7A =>
      'ನಿಮ್ಮ ವಹಿವಾಟು ವಿವರಗಳೊಂದಿಗೆ support@webrofm.com ನಲ್ಲಿ ನಮ್ಮ ಬೆಂಬಲ ತಂಡವನ್ನು ಸಂಪರ್ಕಿಸಿ. ನಾವು 5-7 ಕೆಲಸದ ದಿನಗಳಲ್ಲಿ ನಿಮ್ಮ ಮರುಪಾವತಿಯನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸುತ್ತೇವೆ.';

  @override
  String get helpFaq8Q => 'ದೋಷವನ್ನು ನಾನು ಹೇಗೆ ವರದಿ ಮಾಡುವುದು?';

  @override
  String get helpFaq8A =>
      'ಸೆಟ್ಟಿಂಗ್ಗಳಲ್ಲಿನ ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ ವಿಭಾಗದ ಮೂಲಕ ದೋಷಗಳನ್ನು ವರದಿ ಮಾಡಬಹುದು. ಸಮಸ್ಯೆಯನ್ನು ಪುನರುತ್ಪಾದಿಸುವ ಹಂತಗಳು ಮತ್ತು ನಿಮ್ಮ ಸಾಧನ ಮಾಹಿತಿಯನ್ನು ಸೇರಿಸಿ.';

  @override
  String get privacyPolicyTitle => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get privacyPolicyLastUpdated =>
      'ಕೊನೆಯದಾಗಿ ನವೀಕರಿಸಲಾಗಿದೆ: ಜುಲೈ 22, 2026';

  @override
  String get privacyPolicyCollection => 'ಸಂಗ್ರಹಣೆ';

  @override
  String get privacyPolicyCollectionTitle => 'ನಾವು ಸಂಗ್ರಹಿಸುವ ಮಾಹಿತಿ';

  @override
  String get privacyPolicyCollectionText =>
      'ನಿಮ್ಮ ಹೆಸರು, ಇಮೇಲ್ ವಿಳಾಸ, ಫೋನ್ ಸಂಖ್ಯೆ ಮತ್ತು ಪ್ರೊಫೈಲ್ ಚಿತ್ರದಂತಹ ನೀವು ನೇರವಾಗಿ ಒದಗಿಸುವ ಮಾಹಿತಿಯನ್ನು ನಾವು ಸಂಗ್ರಹಿಸುತ್ತೇವೆ. ನೀವು ನಮ್ಮ ಸೇವೆಗಳನ್ನು ಬಳಸುವಾಗ ಸಾಧನ ಮಾಹಿತಿ, ಬಳಕೆಯ ಡೇಟಾ ಮತ್ತು ಕೇಳುವ ಆದ್ಯತೆಗಳು ಸೇರಿದಂತೆ ಕೆಲವು ಮಾಹಿತಿಯನ್ನು ನಾವು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಂಗ್ರಹಿಸುತ್ತೇವೆ.';

  @override
  String get privacyPolicyUsage => 'ಬಳಕೆ';

  @override
  String get privacyPolicyUsageTitle =>
      'ನಿಮ್ಮ ಮಾಹಿತಿಯನ್ನು ನಾವು ಹೇಗೆ ಬಳಸುತ್ತೇವೆ';

  @override
  String get privacyPolicyUsageText =>
      'ನಮ್ಮ ಸ್ಟ್ರೀಮಿಂಗ್ ಸೇವೆಗಳನ್ನು ಒದಗಿಸಲು, ನಿರ್ವಹಿಸಲು ಮತ್ತು ಸುಧಾರಿಸಲು, ನಿಮ್ಮ ಅನುಭವವನ್ನು ವೈಯಕ್ತೀಕರಿಸಲು, ನವೀಕರಣಗಳು ಮತ್ತು ಪ್ರಚಾರ ಸಾಮಗ್ರಿಗಳನ್ನು ಕಳುಹಿಸಲು ಮತ್ತು ನಮ್ಮ ವೇದಿಕೆಯ ಸುರಕ್ಷತೆಯನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಲು ನಾವು ಸಂಗ್ರಹಿಸುವ ಮಾಹಿತಿಯನ್ನು ಬಳಸುತ್ತೇವೆ.';

  @override
  String get privacyPolicySharing => 'ಹಂಚಿಕೆ';

  @override
  String get privacyPolicySharingTitle => 'ಮಾಹಿತಿ ಹಂಚಿಕೆ';

  @override
  String get privacyPolicySharingText =>
      'ನಾವು ನಿಮ್ಮ ವೈಯಕ್ತಿಕ ಮಾಹಿತಿಯನ್ನು ಮಾರಾಟ ಮಾಡುವುದಿಲ್ಲ. ಕಟ್ಟುನಿಟ್ಟಾದ ಗೌಪ್ಯತಾ ಒಪ್ಪಂದಗಳಿಗೆ ಒಳಪಟ್ಟು, ನಮ್ಮ ವೇದಿಕೆಯನ್ನು ನಿರ್ವಹಿಸುವಲ್ಲಿ ನಮಗೆ ಸಹಾಯ ಮಾಡುವ ವಿಶ್ವಾಸಾರ್ಹ ಸೇವಾ ಪೂರೈಕೆದಾರರೊಂದಿಗೆ ನಿಮ್ಮ ಡೇಟಾವನ್ನು ನಾವು ಹಂಚಿಕೊಳ್ಳಬಹುದು.';

  @override
  String get privacyPolicySecurity => 'ಭದ್ರತೆ';

  @override
  String get privacyPolicySecurityTitle => 'ಡೇಟಾ ಭದ್ರತೆ';

  @override
  String get privacyPolicySecurityText =>
      'ಸಾಗಣೆಯಲ್ಲಿ ಮತ್ತು ವಿಶ್ರಾಂತಿಯಲ್ಲಿ ಎನ್ಕ್ರಿಪ್ಶನ್, ನಿಯಮಿತ ಭದ್ರತಾ ಲೆಕ್ಕಪರಿಶೋಧನೆಗಳು ಮತ್ತು ಪ್ರವೇಶ ನಿಯಂತ್ರಣಗಳು ಸೇರಿದಂತೆ ನಿಮ್ಮ ವೈಯಕ್ತಿಕ ಮಾಹಿತಿಯನ್ನು ರಕ್ಷಿಸಲು ನಾವು ಉದ್ಯಮ-ಪ್ರಮಾಣಿತ ಭದ್ರತಾ ಕ್ರಮಗಳನ್ನು ಜಾರಿಗೊಳಿಸುತ್ತೇವೆ.';

  @override
  String get privacyPolicyRights => 'ಹಕ್ಕುಗಳು';

  @override
  String get privacyPolicyRightsTitle => 'ನಿಮ್ಮ ಹಕ್ಕುಗಳು ಮತ್ತು ಆಯ್ಕೆಗಳು';

  @override
  String get privacyPolicyRightsText =>
      'ನಿಮ್ಮ ಖಾತೆ ಸೆಟ್ಟಿಂಗ್ಗಳ ಮೂಲಕ ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ನಿಮ್ಮ ವೈಯಕ್ತಿಕ ಮಾಹಿತಿಯನ್ನು ಪ್ರವೇಶಿಸಲು, ನವೀಕರಿಸಲು ಅಥವಾ ಅಳಿಸಲು ನಿಮಗೆ ಹಕ್ಕಿದೆ. ಗೌಪ್ಯತೆ ಸಂಬಂಧಿತ ವಿನಂತಿಗಳಿಗಾಗಿ ನೀವು ನಮ್ಮನ್ನು ನೇರವಾಗಿ ಸಂಪರ್ಕಿಸಬಹುದು.';

  @override
  String get termsOfUseTitle => 'ಬಳಕೆಯ ನಿಯಮಗಳು';

  @override
  String get termsOfUseUsage => 'ಬಳಕೆ';

  @override
  String get termsOfUseUsageTitle => 'ಬಳಕೆ ಮಾರ್ಗಸೂಚಿಗಳು';

  @override
  String get termsOfUseUsageText =>
      'WebroFM ಅನ್ನು ಬಳಸುವ ಮೂಲಕ, ಕಾನೂನುಬದ್ಧ ಉದ್ದೇಶಗಳಿಗಾಗಿ ಮಾತ್ರ ಸೇವೆಯನ್ನು ಬಳಸಲು ನೀವು ಒಪ್ಪುತ್ತೀರಿ. ಪೂರ್ವ ಲಿಖಿತ ಸಮ್ಮತಿಯಿಲ್ಲದೆ ನಮ್ಮ ವೇದಿಕೆಯಿಂದ ಯಾವುದೇ ವಿಷಯವನ್ನು ಮಾರ್ಪಡಿಸಲು, ವಿತರಿಸಲು ಅಥವಾ ಪುನರುತ್ಪಾದಿಸಲು ನಿಮಗೆ ಅನುಮತಿಯಿಲ್ಲ. ಈ ನಿಯಮಗಳ ಉಲ್ಲಂಘನೆಗಾಗಿ ಪ್ರವೇಶವನ್ನು ಅಮಾನತುಗೊಳಿಸಲು ಅಥವಾ ಕೊನೆಗೊಳಿಸಲು ನಮಗೆ ಹಕ್ಕಿದೆ.';

  @override
  String get termsOfUseAccounts => 'ಖಾತೆಗಳು';

  @override
  String get termsOfUseAccountsTitle => 'ಬಳಕೆದಾರ ಖಾತೆಗಳು';

  @override
  String get termsOfUseAccountsText =>
      'ನಿಮ್ಮ ಖಾತೆ ರುಜುವಾತುಗಳ ಗೌಪ್ಯತೆಯನ್ನು ಕಾಪಾಡಿಕೊಳ್ಳಲು ನೀವು ಜವಾಬ್ದಾರರಾಗಿರುತ್ತೀರಿ. ಖಾತೆಯನ್ನು ರಚಿಸುವಾಗ ನೀವು ನಿಖರ ಮತ್ತು ಸಂಪೂರ್ಣ ಮಾಹಿತಿಯನ್ನು ಒದಗಿಸಬೇಕು. ನಿಮ್ಮ ಖಾತೆಯ ಯಾವುದೇ ಅನಧಿಕೃತ ಬಳಕೆಯ ಬಗ್ಗೆ ನೀವು ತಕ್ಷಣ ನಮಗೆ ತಿಳಿಸಬೇಕು.';

  @override
  String get termsOfUseContent => 'ವಿಷಯ';

  @override
  String get termsOfUseContentTitle => 'ವಿಷಯ ಮತ್ತು ಬೌದ್ಧಿಕ ಆಸ್ತಿ';

  @override
  String get termsOfUseContentText =>
      'ಆಡಿಯೊ ಸ್ಟ್ರೀಮ್ಗಳು, ವೀಡಿಯೊಗಳು ಮತ್ತು ಕಲಾಕೃತಿ ಸೇರಿದಂತೆ WebroFM ನಲ್ಲಿ ಲಭ್ಯವಿರುವ ಎಲ್ಲಾ ವಿಷಯವು ಹಕ್ಕುಸ್ವಾಮ್ಯ ಮತ್ತು ಬೌದ್ಧಿಕ ಆಸ್ತಿ ಕಾನೂನುಗಳಿಂದ ರಕ್ಷಿಸಲ್ಪಟ್ಟಿದೆ. ಸ್ಪಷ್ಟ ಅನುಮತಿಯಿಲ್ಲದೆ ಬಳಕೆದಾರರು ವಿಷಯವನ್ನು ಡೌನ್ಲೋಡ್ ಮಾಡಲು, ರೆಕಾರ್ಡ್ ಮಾಡಲು ಅಥವಾ ಮರುವಿತರಣೆ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.';

  @override
  String get termsOfUseLiability => 'ಹೊಣೆಗಾರಿಕೆ';

  @override
  String get termsOfUseLiabilityTitle => 'ಹೊಣೆಗಾರಿಕೆಯ ಮಿತಿ';

  @override
  String get termsOfUseLiabilityText =>
      'ಸೇವೆಯನ್ನು ಬಳಸುವುದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಪರೋಕ್ಷ, ಆಕಸ್ಮಿಕ ಅಥವಾ ಪರಿಣಾಮದ ಹಾನಿಗಳಿಗೆ WebroFM ಹೊಣೆಗಾರರಾಗಿರುವುದಿಲ್ಲ. ನಮ್ಮ ಒಟ್ಟು ಹೊಣೆಗಾರಿಕೆಯು ಕಳೆದ 12 ತಿಂಗಳುಗಳಲ್ಲಿ ಸೇವೆಗಾಗಿ ನೀವು ಪಾವತಿಸಿದ ಮೊತ್ತವನ್ನು ಮೀರುವುದಿಲ್ಲ.';

  @override
  String get notificationsTitle => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get notificationsEmptyTitle => 'ಅಧಿಸೂಚನೆಗಳಿಲ್ಲ';

  @override
  String get notificationsEmptySubtitle =>
      'ನೀವು ಎಲ್ಲವನ್ನೂ ನೋಡಿದ್ದೀರಿ! ನವೀಕರಣಗಳಿಗಾಗಿ ನಂತರ ಮತ್ತೆ ಪರಿಶೀಲಿಸಿ.';

  @override
  String get downloadsTitle => 'ನನ್ನ ಡೌನ್ಲೋಡ್ಗಳು';

  @override
  String get downloadsEmptyTitle => 'ಇನ್ನೂ ಡೌನ್ಲೋಡ್ಗಳಿಲ್ಲ';

  @override
  String get downloadsEmptySubtitle =>
      'ನಿಮ್ಮ ಡೌನ್ಲೋಡ್ ಮಾಡಿದ ಸಂಚಿಕೆಗಳು ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ, ಆದ್ದರಿಂದ ನೀವು ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ಕೇಳಬಹುದು.';

  @override
  String get downloadsBrowseShows => 'ಶೋಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get premiumTitle => 'ಪ್ರೀಮಿಯಂ';

  @override
  String get collabTitle => 'ಸಹಯೋಗ';

  @override
  String get collabMyStories => 'ನನ್ನ ಕಥೆಗಳು';

  @override
  String get collabMySponsorships => 'ನನ್ನ ಪ್ರಾಯೋಜಕತ್ವಗಳು';

  @override
  String get collabNoStories => 'ಇದುವರೆಗೆ ಯಾವುದೇ ಕಥೆಗಳನ್ನು ಸಲ್ಲಿಸಲಾಗಿಲ್ಲ.';

  @override
  String get collabNoSponsorships =>
      'ಇದುವರೆಗೆ ಯಾವುದೇ ಪ್ರಾಯೋಜಕತ್ವಗಳನ್ನು ಸಲ್ಲಿಸಲಾಗಿಲ್ಲ.';

  @override
  String get collabApproved => 'ಅನುಮೋದಿಸಲಾಗಿದೆ';

  @override
  String get collabRejected => 'ತಿರಸ್ಕರಿಸಲಾಗಿದೆ';

  @override
  String get collabReviewing => 'ಪರಿಶೀಲಿಸಲಾಗುತ್ತಿದೆ';

  @override
  String get collabPending => 'ಬಾಕಿ ಉಳಿದಿದೆ';

  @override
  String get collabShareYourStory => 'ನಿಮ್ಮ ಕಥೆಯನ್ನು ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get collabShareYourStorySubtitle =>
      'ಪ್ರದರ್ಶಿಸಲಾಗುವ ಅವಕಾಶಕ್ಕಾಗಿ ನಿಮ್ಮ ಮೂಲ ಕಥೆಯನ್ನು ಸಲ್ಲಿಸಿ.';

  @override
  String get collabSubmitStory => 'ಕಥೆಯನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get collabSponsorshipAd => 'ಪ್ರಾಯೋಜಕತ್ವ / ಜಾಹೀರಾತು';

  @override
  String get collabSponsorshipSubtitle =>
      'ಪ್ರಾಯೋಜಕತ್ವಕ್ಕಾಗಿ ನಿಮ್ಮ ಬ್ರ್ಯಾಂಡ್ ಅಥವಾ ವ್ಯಾಪಾರವನ್ನು ಸಲ್ಲಿಸಿ.';

  @override
  String get collabSubmitAd => 'ಜಾಹೀರಾತನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get collabDialogStoryTitle => 'ನಿಮ್ಮ ಕಥೆಯನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get collabStoryTitle => 'ಕಥೆಯ ಶೀರ್ಷಿಕೆ';

  @override
  String get collabStoryTitleHint => 'ನಿಮ್ಮ ಕಥೆಯ ಶೀರ್ಷಿಕೆಯನ್ನು ನಮೂದಿಸಿ';

  @override
  String get collabStoryContent => 'ಕಥೆಯ ವಿಷಯ';

  @override
  String get collabStoryContentHint => 'ನಿಮ್ಮ ಕಥೆಯನ್ನು ಇಲ್ಲಿ ಬರೆಯಿರಿ...';

  @override
  String get collabCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get collabSubmit => 'ಸಲ್ಲಿಸಿ';

  @override
  String get collabDialogAdTitle => 'ಜಾಹೀರಾತನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get collabBrandName => 'ಬ್ರ್ಯಾಂಡ್ ಹೆಸರು';

  @override
  String get collabBrandNameHint => 'ನಿಮ್ಮ ಬ್ರ್ಯಾಂಡ್/ವ್ಯಾಪಾರ ಹೆಸರು';

  @override
  String get collabDescription => 'ವಿವರಣೆ';

  @override
  String get collabDescriptionHint => 'ನಿಮ್ಮ ಜಾಹೀರಾತನ್ನು ವಿವರಿಸಿ';

  @override
  String get collabTargetUrl => 'ಗುರಿ URL (ಐಚ್ಛಿಕ)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'ಚಿತ್ರ ಆಯ್ಕೆ ಮಾಡಲಾಗಿದೆ';

  @override
  String get collabUploadAdVisual => 'ಜಾಹೀರಾತು ದೃಶ್ಯವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get collabStatusRunning => 'ಚಾಲನೆಯಲ್ಲಿದೆ';

  @override
  String get collabStatusExpired => 'ಅವಧಿ ಮೀರಿದೆ';

  @override
  String get languagesAppLanguage => 'ಅಪ್ಲಿಕೇಶನ್ ಭಾಷೆ';

  @override
  String get languagesSubtitleLanguage => 'ಉಪಶೀರ್ಷಿಕೆ ಭಾಷೆ';

  @override
  String get bottomNavHome => 'ಹೋಮ್';

  @override
  String get bottomNavSearch => 'ಹುಡುಕು';

  @override
  String get bottomNavCategories => 'ವರ್ಗಗಳು';

  @override
  String get bottomNavMyList => 'ನನ್ನ ಪಟ್ಟಿ';

  @override
  String get bottomNavProfile => 'ಪ್ರೊಫೈಲ್';

  @override
  String get networkOffline => 'ಆಫ್‌ಲೈನ್ ಮೋಡ್';

  @override
  String get networkDownload => 'ಡೌನ್‌ಲೋಡ್ ಮೋಡ್';

  @override
  String get networkOfflineSnackbar =>
      'ಆಫ್‌ಲೈನ್ ಮೋಡ್ ಆನ್ ಆಗಿದೆ\nಡೌನ್‌ಲೋಡ್ ವಿಷಯವನ್ನು ಅನ್ವೇಷಿಸಲು ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get networkDismiss => 'ತೆಗೆದುಹಾಕು';

  @override
  String get loadingPleaseWait => 'ದಯವಿಟ್ಟು ನಿರೀಕ್ಷಿಸಿ...';

  @override
  String get commonRetry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get guestTimerTitle => 'ಉಚಿತ ಸಮಯ ಮುಗಿಯಿತು!';

  @override
  String get guestTimerBody =>
      'ಎಲ್ಲಾ ವಿಷಯವನ್ನು ಪ್ರವೇಶಿಸಲು ಲಾಗಿನ್ ಮಾಡಿ.\nಇದು ನಿಮಗೆ ಉಚಿತ!';

  @override
  String get freeLimitTitle => 'ಉಚಿತ ಮಿತಿ ತಲುಪಿದೆ';

  @override
  String get freeLimitBody =>
      'ನೀವು ನಿಮ್ಮ 1 ನಿಮಿಷದ ಉಚಿತ ಆಲಿಸುವಿಕೆಯನ್ನು ಬಳಸಿದ್ದೀರಿ. ಪೂರ್ಣ ಸಂಚಿಕೆ ಆಲಿಸುವುದನ್ನು ಮುಂದುವರಿಸಲು ದಯವಿಟ್ಟು ಲಾಗಿನ್ ಮಾಡಿ ಅಥವಾ ಸೈನ್ ಅಪ್ ಮಾಡಿ.';

  @override
  String get guestTimerLater => 'ನಂತರ';

  @override
  String get guestTimerLogin => 'ಲಾಗಿನ್ / ಸೈನ್ ಅಪ್';

  @override
  String get errorDataError => 'ಡೇಟಾ ದೋಷ ಸಂಭವಿಸಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get errorInvalidData => 'ಅಮಾನ್ಯ ಡೇಟಾ ಸ್ವರೂಪ ಸ್ವೀಕರಿಸಲಾಗಿದೆ.';

  @override
  String get errorUnexpected => 'ಅನಿರೀಕ್ಷಿತ ದೋಷ ಸಂಭವಿಸಿದೆ.';

  @override
  String get errorTimeout =>
      'ಸಂಪರ್ಕ ಸಮಯ ಮೀರಿದೆ. ದಯವಿಟ್ಟು ನಿಮ್ಮ ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String get errorNoInternet =>
      'ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕವಿಲ್ಲ. ದಯವಿಟ್ಟು ನಿಮ್ಮ ನೆಟ್‌ವರ್ಕ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String get errorCancelled => 'ವಿನಂತಿಯನ್ನು ರದ್ದುಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get errorSecurity =>
      'ಸಂಪರ್ಕ ಭದ್ರತಾ ದೋಷ. ದಯವಿಟ್ಟು ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನವೀಕರಿಸಿ.';

  @override
  String get errorNetwork => 'ಅನಿರೀಕ್ಷಿತ ನೆಟ್‌ವರ್ಕ್ ದೋಷ ಸಂಭವಿಸಿದೆ.';

  @override
  String get errorInvalidRequest =>
      'ಅಮಾನ್ಯ ವಿನಂತಿ. ದಯವಿಟ್ಟು ನಿಮ್ಮ ಇನ್‌ಪುಟ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String get errorSessionExpired =>
      'ಸೆಶನ್ ಅವಧಿ ಮೀರಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಿ.';

  @override
  String get errorPermissionDenied => 'ಈ ಕ್ರಿಯೆಯನ್ನು ಮಾಡಲು ನಿಮಗೆ ಅನುಮತಿಯಿಲ್ಲ.';

  @override
  String get errorNotFound => 'ವಿನಂತಿಸಿದ ಸಂಪನ್ಮೂಲ ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get errorConflict =>
      'ವಿರೋಧ ಕಂಡುಹಿಡಿಯಲಾಗಿದೆ. ಸಂಪನ್ಮೂಲವನ್ನು ನವೀಕರಿಸಿರಬಹುದು.';

  @override
  String get errorValidationFailed =>
      'ಮೌಲ್ಯೀಕರಣ ವಿಫಲವಾಗಿದೆ. ದಯವಿಟ್ಟು ನಿಮ್ಮ ಇನ್‌ಪುಟ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String get errorTooManyRequests =>
      'ಹಲವು ವಿನಂತಿಗಳು. ದಯವಿಟ್ಟು ನಂತರ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get errorServer => 'ಸರ್ವರ್ ದೋಷ. ದಯವಿಟ್ಟು ನಂತರ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get errorServiceUnavailable =>
      'ಸೇವೆ ತಾತ್ಕಾಲಿಕವಾಗಿ ಲಭ್ಯವಿಲ್ಲ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get errorUnderMaintenance =>
      'ಸೇವೆ ನಿರ್ವಹಣೆಯಲ್ಲಿದೆ. ದಯವಿಟ್ಟು ನಂತರ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String errorGeneric(Object code) {
    return 'ಏನೋ ತಪ್ಪಾಗಿದೆ. (ದೋಷ $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'ಸಂಪರ್ಕ ಸಮಯ ಮೀರಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get errorNoConnection => 'ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕವಿಲ್ಲ.';

  @override
  String errorServerWithCode(Object code) {
    return 'ಸರ್ವರ್ ದೋಷ ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'ಏನೋ ತಪ್ಪಾಗಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get pageNotFound => 'ಪುಟ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get pageNotFoundMessage => 'ನೀವು ಹುಡುಕುತ್ತಿರುವ ಪುಟ ಅಸ್ತಿತ್ವದಲ್ಲಿಲ್ಲ.';

  @override
  String get goHome => 'ಹೋಮ್‌ಗೆ ಹೋಗಿ';

  @override
  String get relativeTimeJustNow => 'ಈಗಷ್ಟೇ';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '$minutes ನಿಮಿ ಹಿಂದೆ';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '$hours ಗಂ ಹಿಂದೆ';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '$days ದಿ ಹಿಂದೆ';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '$weeks ವಾ ಹಿಂದೆ';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '$months ತಿ ಹಿಂದೆ';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '$years ವ ಹಿಂದೆ';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return '$minutes ನಿಮಿಷದಲ್ಲಿ';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return '$hours ಗಂಟೆಯಲ್ಲಿ';
  }

  @override
  String relativeTimeInDay(Object days) {
    return '$days ದಿನದಲ್ಲಿ';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '$hours ಗಂ $minutes ನಿ';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '$minutes ನಿ $seconds ಸೆ';
  }

  @override
  String fileSizeBytes(Object size) {
    return '$size ಬೈ';
  }

  @override
  String fileSizeKB(Object size) {
    return '$size KB';
  }

  @override
  String fileSizeMB(Object size) {
    return '$size MB';
  }

  @override
  String fileSizeGB(Object size) {
    return '$size GB';
  }

  @override
  String countViewsM(Object count) {
    return '$count ಮಿ';
  }

  @override
  String countViewsK(Object count) {
    return '$count ಸಾ';
  }

  @override
  String episodeCount(Object count) {
    return '$count ಸಂ';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'S$season E$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'ಸೀಸನ್ $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return 'No episodes available in $language';
  }

  @override
  String get contentDisclaimer =>
      'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.';

  @override
  String get categoryDrama => 'ನಾಟಕ';

  @override
  String get categoryComedy => 'ಹಾಸ್ಯ';

  @override
  String get categoryPodcasts => 'ಪಾಡ್ಕಾಸ್ಟ್‌ಗಳು';

  @override
  String get categoryMusic => 'ಸಂಗೀತ';

  @override
  String get categoryKids => 'ಮಕ್ಕಳು';

  @override
  String get categoryDevotional => 'ಭಕ್ತಿ';

  @override
  String get categoryNews => 'ಸುದ್ದಿ';

  @override
  String get categorySports => 'ಕ್ರೀಡೆ';

  @override
  String get categoryTechnology => 'ತಂತ್ರಜ್ಞಾನ';

  @override
  String get categoryEducation => 'ಶಿಕ್ಷಣ';

  @override
  String get categoryBusiness => 'ವ್ಯಾಪಾರ';

  @override
  String get categoryHealth => 'ಆರೋಗ್ಯ';

  @override
  String get categoryScience => 'ವಿಜ್ಞಾನ';

  @override
  String get categoryArts => 'ಕಲೆಗಳು';

  @override
  String get trendingDramaSeries => 'ನಾಟಕ ಸರಣಿಗಳು';

  @override
  String get trendingComedyShows => 'ಹಾಸ್ಯ ಪ್ರದರ್ಶನಗಳು';

  @override
  String get trendingPodcasts => 'ಪಾಡ್ಕಾಸ್ಟ್‌ಗಳು';

  @override
  String get trendingMusicAlbums => 'ಸಂಗೀತ ಆಲ್ಬಮ್‌ಗಳು';

  @override
  String get trendingKidsStories => 'ಮಕ್ಕಳ ಕಥೆಗಳು';

  @override
  String get trendingDevotional => 'ಭಕ್ತಿ';

  @override
  String get trendingNewsToday => 'ಇಂದಿನ ಸುದ್ದಿ';

  @override
  String get trendingSportsHighlights => 'ಕ್ರೀಡಾ ಹೈಲೈಟ್‌ಗಳು';

  @override
  String get languageEnglish => 'ಇಂಗ್ಲಿಷ್';

  @override
  String get languageHindi => 'ಹಿಂದಿ';

  @override
  String get languagePunjabi => 'ಪಂಜಾಬಿ';

  @override
  String get languageHaryanvi => 'ಹರಿಯಾಣ್ವಿ';

  @override
  String get languageMarathi => 'ಮರಾಠಿ';

  @override
  String get languageGujarati => 'ಗುಜರಾತಿ';

  @override
  String get languageBengali => 'ಬೆಂಗಾಲಿ';

  @override
  String get languageTamil => 'ತಮಿಳು';

  @override
  String get languageTelugu => 'ತೆಲುಗು';

  @override
  String get languageKannada => 'ಕನ್ನಡ';

  @override
  String get languageMalayalam => 'ಮಲಯಾಳಂ';

  @override
  String get languageUrdu => 'ಉರ್ದು';

  @override
  String get pressBackToExit => 'ನಿರ್ಗಮಿಸಲು ಮತ್ತೆ ಹಿಂದಕ್ಕೆ ಒತ್ತಿರಿ';

  @override
  String get exitDialogTitle => 'ಆಪ್ ನಿಲ್ಲಿಸುವುದೇ?';

  @override
  String get exitDialogBody => 'ನೀವು ನಿಜವಾಗಿಯೂ ಆಪ್ ನಿಲ್ಲಿಸಲು ಬಯಸುವಿರಾ?';

  @override
  String get exitDialogConfirm => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get exitDialogCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get profileShareApp => 'Share App';

  @override
  String get profileShareAppMessage =>
      'Check out WebroFM - your go-to app for streaming shows and podcasts!';
}
