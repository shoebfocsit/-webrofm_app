// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'WebroFM';

  @override
  String get splashLoading => 'ஏற்றுகிறது...';

  @override
  String get welcomeTitle => 'WebroFM க்கு வரவேற்கிறோம்';

  @override
  String get welcomeSubtitle => 'உங்களை நகர்த்தும் கதைகளைக் கண்டறியுங்கள்';

  @override
  String get welcomeGetStarted => 'தொடங்கு';

  @override
  String get welcomeContinueAsGuest => 'விருந்தினராக தொடரவும்';

  @override
  String get loginSearchCountries => 'நாடுகளைத் தேடு';

  @override
  String get loginInvalidPhone => 'சரியான தொலைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get loginRateLimitTitle => 'விகித வரம்பு அடைந்தது';

  @override
  String get loginRateLimitContent =>
      'அதிக OTP முயற்சிகள். 1 மணி நேரத்திற்குப் பிறகு மீண்டும் முயற்சிக்கவும்.';

  @override
  String get loginOk => 'சரி';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'இந்த நேரத்தில் $remaining முயற்சி மட்டுமே மீதம்';
  }

  @override
  String get loginTitle => 'தொடர உள்நுழைக';

  @override
  String get loginSubtitle => 'தொடங்க உங்கள் தொலைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get loginPhoneHint => '(555) 000-0000';

  @override
  String get loginIAgreeTo => 'நான் இதற்கு சம்மதிக்கிறேன் ';

  @override
  String get loginTermsOfUse => 'பயன்பாட்டு விதிமுறைகள்';

  @override
  String get loginAnd => ' மற்றும் ';

  @override
  String get loginPrivacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get loginSendOtp => 'OTP அனுப்பு';

  @override
  String get loginContinueAsGuest => 'விருந்தினராக தொடரவும்';

  @override
  String get otpEnterCompleteCode => 'முழு 6 இலக்க குறியீட்டை உள்ளிடவும்';

  @override
  String get otpTitle => 'உங்கள் எண்ணை சரிபார்க்கவும்';

  @override
  String get otpSubtitle => 'இதற்கு அனுப்பப்பட்ட குறியீட்டை உள்ளிடவும்';

  @override
  String get otpVerifyAndContinue => 'சரிபார்த்து தொடர்க';

  @override
  String get otpDidntReceive => 'குறியீடு வரவில்லையா? ';

  @override
  String get otpResend => 'OTP மீண்டும் அனுப்பு';

  @override
  String get completeProfileTitle => 'உங்கள் சுயவிவரத்தை நிரப்பவும்';

  @override
  String get completeProfileSubtitle =>
      'உங்கள் அனுபவத்தை தனிப்பயனாக்க உதவுங்கள்';

  @override
  String get completeProfileBasicInfo => 'அடிப்படை தகவல்';

  @override
  String get completeProfileFullName => 'முழு பெயர் *';

  @override
  String get completeProfileNameHint => 'ஜான் டோ';

  @override
  String get completeProfileEmail => 'மின்னஞ்சல் முகவரி';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'பாலினம் *';

  @override
  String get completeProfileDateOfBirth => 'பிறந்த தேதி';

  @override
  String get completeProfileDobHint =>
      'உங்கள் பிறந்த தேதியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get completeProfileMale => 'ஆண்';

  @override
  String get completeProfileFemale => 'பெண்';

  @override
  String get completeProfileOther => 'மற்றவை';

  @override
  String get completeProfileError =>
      'உங்கள் பெயரை உள்ளிட்டு பாலினத்தை தேர்ந்தெடுக்கவும்';

  @override
  String get completeProfileSkip => 'தவிர்';

  @override
  String get completeProfileContinue => 'தொடர்க';

  @override
  String get interestTitle => 'உங்கள் ஆர்வங்களைத் தேர்ந்தெடுக்கவும்';

  @override
  String get interestSubtitle =>
      'தனிப்பயனாக்கப்பட்ட பரிந்துரைகளுக்கு நீங்கள் விரும்பும் வகைகளைத் தேர்ந்தெடுக்கவும்';

  @override
  String get interestSectionHeader => 'உங்கள் ஆர்வங்களைத் தேர்வுசெய்க';

  @override
  String get interestTapToSelect => 'தேர்ந்தெடுக்க தொடவும்';

  @override
  String get interestContinue => 'WebroFM க்கு தொடரவும்';

  @override
  String get interestSkip => 'தவிர்';

  @override
  String get registrationTitle => 'உங்களைப் பற்றி சொல்லுங்கள்';

  @override
  String get registrationSubtitle => 'உங்கள் அனுபவத்தை தனிப்பயனாக்க உதவுங்கள்';

  @override
  String get registrationPersonalInfo => 'தனிப்பட்ட தகவல்';

  @override
  String get registrationFullName => 'முழு பெயர்';

  @override
  String get registrationNameHint => 'ஜான் டோ';

  @override
  String get registrationEmail => 'மின்னஞ்சல் முகவரி';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'பிறந்த தேதி';

  @override
  String get registrationDobHint => 'உங்கள் பிறந்த தேதியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get registrationInterestsHeader => 'உங்கள் ஆர்வங்களைத் தேர்வுசெய்க';

  @override
  String get registrationInterestsSubtitle =>
      'நீங்கள் விரும்பும் வகைகளைத் தேர்ந்தெடுக்கவும்';

  @override
  String get registrationContinue => 'WebroFM க்கு தொடரவும்';

  @override
  String get registrationNameError => 'உங்கள் பெயரை உள்ளிடவும்';

  @override
  String get homeContinueWatching => 'தொடர்ந்து பார்க்க';

  @override
  String get homeContinueListening => 'தொடர்ந்து கேட்க';

  @override
  String get homeResume => 'தொடரவும்';

  @override
  String get homeNewArrivals => 'புதிய வரவுகள்';

  @override
  String get homeSeeAll => 'அனைத்தையும் காண்க';

  @override
  String get homePopularNow => 'இப்போது பிரபலமானவை';

  @override
  String get homeNoShows => 'நிகழ்ச்சிகள் எதுவும் இல்லை';

  @override
  String get showDetailFailed => 'ஏற்ற முடியவில்லை';

  @override
  String get showDetailNotFound => 'நிகழ்ச்சி கிடைக்கவில்லை';

  @override
  String showDetailShareText(Object title) {
    return 'WebroFM இல் $title ஐ பாருங்கள்!';
  }

  @override
  String get showDetailDownloadStarted => 'பதிவிறக்கம் தொடங்கியது';

  @override
  String get showDetailNoDescription => 'விளக்கம் எதுவும் இல்லை.';

  @override
  String get showDetailReadLess => 'குறைவாக காட்டு';

  @override
  String get showDetailReadMore => 'மேலும் காட்டு';

  @override
  String get showDetailPlayLatest => 'சமீபத்திய அத்தியாயத்தை இயக்கு';

  @override
  String get showDetailEpisodes => 'அத்தியாயங்கள்';

  @override
  String get showDetailNoEpisodes => 'அத்தியாயங்கள் எதுவும் இல்லை';

  @override
  String get showDetailMoreLikeThis => 'இதுபோன்ற மேலும்';

  @override
  String get videoPlayerNoAudio => 'இந்த அத்தியாயத்திற்கு ஆடியோ எதுவும் இல்லை';

  @override
  String get videoPlayerLoading => 'வீடியோ ஏற்றுகிறது...';

  @override
  String get videoPlayerNowPlaying => 'இப்போது இயங்குகிறது';

  @override
  String get videoPlayerPaused => 'இடைநிறுத்தப்பட்டது';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'பிளேபேக் பிழை: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'வீடியோ பிளேயர்';

  @override
  String get videoPlayerNext => 'அடுத்து';

  @override
  String get videoPlayerAudio => 'ஆடியோ';

  @override
  String get videoPlayerVideo => 'வீடியோ';

  @override
  String get showCardNew => 'புதியது';

  @override
  String get searchHint => 'நிகழ்ச்சிகள், அத்தியாயங்களைத் தேடு...';

  @override
  String get searchTrending => 'பிரபலமான தேடல்கள்';

  @override
  String get searchSuggested => 'உங்களுக்கான பரிந்துரைகள்';

  @override
  String get searchError => 'ஏதோ தவறு ஏற்பட்டது';

  @override
  String get searchNoResults => 'முடிவுகள் எதுவும் இல்லை';

  @override
  String get searchNoResultsSubtitle =>
      'உங்கள் தேடல் விதிமுறைகளை மாற்றி முயற்சிக்கவும்';

  @override
  String get categoriesTitle => 'வகைகளை ஆராயுங்கள்';

  @override
  String categoriesShowCount(Object count) {
    return '$count நிகழ்ச்சிகள்';
  }

  @override
  String get categoryDetailFailed => 'ஏற்ற முடியவில்லை';

  @override
  String get categoryDetailLoadMore => 'மேலும் ஏற்று';

  @override
  String get categoryDetailSortBy => 'வரிசைப்படுத்து';

  @override
  String get categoryDetailPopular => 'பிரபலமானவை';

  @override
  String get categoryDetailNewest => 'புதியவை';

  @override
  String get categoryDetailTopRated => 'சிறந்த மதிப்பீடு';

  @override
  String get myListTitle => 'எனது பட்டியல்';

  @override
  String get myListSaved => 'சேமித்தவை';

  @override
  String get myListWatchHistory => 'பார்த்த வரலாறு';

  @override
  String get myListError => 'ஏதோ தவறு ஏற்பட்டது';

  @override
  String get myListNoSaved => 'இன்னும் சேமித்த பொருட்கள் எதுவும் இல்லை';

  @override
  String get myListNoHistory => 'இன்னும் பார்த்த வரலாறு எதுவும் இல்லை';

  @override
  String get myListNoSavedSubtitle =>
      'ஆராயத் தொடங்குங்கள் மற்றும் உங்கள் பிடித்தவற்றை சேமிக்கவும்';

  @override
  String get myListNoHistorySubtitle =>
      'நீங்கள் சமீபத்தில் பார்த்த நிகழ்ச்சிகள் இங்கே தோன்றும்';

  @override
  String get myListExploreShows => 'நிகழ்ச்சிகளை ஆராயுங்கள்';

  @override
  String get myListRemoved => 'என் பட்டியலிலிருந்து அகற்றப்பட்டது';

  @override
  String get myListLoginTitle => 'உங்கள் சேமித்த நிகழ்ச்சிகளைக் காண உள்நுழைக';

  @override
  String get myListLoginSubtitle =>
      'உங்கள் விருப்பமான நிகழ்ச்சிகளைச் சேமித்து எப்போதும் அணுகவும்';

  @override
  String get profileTitle => 'சுயவிவரம்';

  @override
  String get profileUser => 'பயனர்';

  @override
  String get profileNoPhone => 'தொலைபேசி இல்லை';

  @override
  String get profileEditProfile => 'சுயவிவரத்தைத் திருத்து';

  @override
  String get profileYourInterests => 'உங்கள் ஆர்வங்கள்';

  @override
  String get profileNoCategories => 'எந்த வகையும் தேர்ந்தெடுக்கப்படவில்லை';

  @override
  String get profileDobLabel => 'பிறந்த தேதி';

  @override
  String get profileNotLoggedIn => 'நீங்கள் உள்நுழையவில்லை';

  @override
  String get profileNotLoggedInSubtitle =>
      'உங்கள் சுயவிவரம், பதிவிறக்கங்கள் மற்றும் தனிப்பயனாக்கப்பட்ட பரிந்துரைகளை அணுக உள்நுழைக.';

  @override
  String get profileLogin => 'உள்நுழைக';

  @override
  String get profileCollaboration => 'ஒத்துழைப்பு';

  @override
  String get profileSettings => 'அமைப்புகள் மற்றும் விருப்பங்கள்';

  @override
  String get profileMyDownloads => 'எனது பதிவிறக்கங்கள்';

  @override
  String get profileTermsOfUse => 'பயன்பாட்டு விதிமுறைகள்';

  @override
  String get profilePrivacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get profileHelpFaq => 'உதவி & கேள்விகள்';

  @override
  String get profileContactUs => 'எங்களைத் தொடர்பு கொள்ளுங்கள்';

  @override
  String get profileLogout => 'வெளியேறு';

  @override
  String get profileLogoutTitle => 'வெளியேறு';

  @override
  String get profileLogoutConfirm =>
      'நீங்கள் நிச்சயமாக வெளியேற விரும்புகிறீர்களா?';

  @override
  String get profileCancel => 'ரத்துசெய்';

  @override
  String get editProfileTitle => 'சுயவிவரத்தைத் திருத்து';

  @override
  String get editProfileTapToChangePhoto => 'புகைப்படத்தை மாற்ற தொடவும்';

  @override
  String get editProfileFullName => 'முழு பெயர்';

  @override
  String get editProfileNameRequired => 'பெயர் தேவை';

  @override
  String get editProfileEmail => 'மின்னஞ்சல்';

  @override
  String get editProfileEmailRequired => 'மின்னஞ்சல் தேவை';

  @override
  String get editProfileInvalidEmail => 'தவறான மின்னஞ்சல்';

  @override
  String get editProfileDob => 'பிறந்த தேதி';

  @override
  String get editProfilePhone => 'தொலைபேசி';

  @override
  String get editProfileCategoryPreferences => 'வகை விருப்பங்கள்';

  @override
  String get editProfileAddMore => 'மேலும் சேர்';

  @override
  String get editProfileAddCategory => 'வகையைச் சேர்';

  @override
  String get editProfileSaveChanges => 'மாற்றங்களைச் சேமி';

  @override
  String get editProfileUserDataNotAvailable => 'பயனர் தரவு கிடைக்கவில்லை';

  @override
  String get editProfileUpdatedSuccess =>
      'சுயவிவரம் வெற்றிகரமாக புதுப்பிக்கப்பட்டது';

  @override
  String get editProfileCancel => 'ரத்துசெய்';

  @override
  String get editProfileSubmit => 'சமர்ப்பி';

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get settingsGeneral => 'பொது';

  @override
  String get settingsAppLanguage => 'பயன்பாட்டு மொழி';

  @override
  String get settingsSubtitleLanguage => 'வசன மொழி';

  @override
  String get settingsAppearancePlayback => 'தோற்றம் மற்றும் இயக்கம்';

  @override
  String get settingsColorTheme => 'வண்ண தீம்';

  @override
  String get settingsLight => 'ஒளி';

  @override
  String get settingsDark => 'இருண்ட';

  @override
  String get settingsSystem => 'அமைப்பு';

  @override
  String get settingsAutoplayNext => 'அடுத்த அத்தியாயத்தை தானாக இயக்கு';

  @override
  String get settingsDownloadQuality => 'பதிவிறக்க தரம்';

  @override
  String get settingsLow => 'குறைந்த';

  @override
  String get settingsMedium => 'நடுத்தர';

  @override
  String get settingsHigh => 'அதிக';

  @override
  String get settingsVeryHigh => 'மிக அதிக';

  @override
  String get settingsAccountPrivacy => 'கணக்கு மற்றும் தனியுரிமை';

  @override
  String get settingsAgeRestriction => 'வயது/உள்ளடக்க கட்டுப்பாடு';

  @override
  String get settingsNotifications => 'அறிவிப்புகள்';

  @override
  String get settingsDangerZone => 'ஆபத்து மண்டலம்';

  @override
  String get settingsDeleteAccount => 'எனது கணக்கை நீக்கு';

  @override
  String get deleteAccountTitle => 'கணக்கை நீக்கு';

  @override
  String get deleteAccountHeader => 'எனது கணக்கை நீக்கு';

  @override
  String get deleteAccountWarning =>
      'இந்த செயலை மீளமுடியாது. உங்கள் எல்லா தரவும் நிரந்தரமாக அகற்றப்படும்.';

  @override
  String get deleteAccountDataLoss => 'பின்வரும் தரவு இழக்கப்படும்:';

  @override
  String get deleteAccountReason => 'நீக்குவதற்கான காரணம்';

  @override
  String get deleteAccountSelectReason => 'ஒரு காரணத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get deleteAccountNotUsing => 'நான் இனி பயன்பாட்டைப் பயன்படுத்தவில்லை';

  @override
  String get deleteAccountTooExpensive => 'மிகவும் விலை அதிகம்';

  @override
  String get deleteAccountPrivacy => 'தனியுரிமை கவலைகள்';

  @override
  String get deleteAccountTechnicalIssues => 'தொழில்நுட்ப சிக்கல்கள்';

  @override
  String get deleteAccountFoundAlternative => 'சிறந்த மாற்று கிடைத்தது';

  @override
  String get deleteAccountOther => 'மற்றவை';

  @override
  String get deleteAccountProfileSettings => 'சுயவிவரம் மற்றும் அமைப்புகள்';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'உங்கள் சுயவிவர தகவல், விருப்பங்கள் மற்றும் பயன்பாட்டு அமைப்புகள் நிரந்தரமாக நீக்கப்படும்.';

  @override
  String get deleteAccountListeningHistory => 'கேட்ட வரலாறு';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'உங்கள் கேட்ட வரலாறு, தேடல் வரலாறு மற்றும் செயல்பாட்டு பதிவுகள் அழிக்கப்படும்.';

  @override
  String get deleteAccountSavedItems => 'சேமித்த பொருட்கள்';

  @override
  String get deleteAccountSavedItemsDesc =>
      'உங்கள் அனைத்து பிளேலிஸ்ட்கள், பிடித்தவை மற்றும் சேமித்த உள்ளடக்கம் அகற்றப்படும்.';

  @override
  String get deleteAccountSubscriptions => 'சந்தாக்கள்';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'செயலில் உள்ள சந்தாக்கள் ரத்து செய்யப்பட்டு பிரீமியம் அணுகல் முடிவடையும்.';

  @override
  String get deleteAccountDelete => 'எனது கணக்கை நீக்கு';

  @override
  String get deleteAccountCancel => 'ரத்துசெய்';

  @override
  String get deleteAccountOtpTitle => 'நீக்குதலை சரிபார்க்கவும்';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return '$phone க்கு அனுப்பப்பட்ட OTP ஐ உள்ளிடவும்';
  }

  @override
  String get deleteAccountOtpConfirm => 'நீக்குதலை உறுதிப்படுத்து';

  @override
  String get deleteAccountOtpResend => 'OTP மீண்டும் அனுப்பு';

  @override
  String get deleteAccountOtpResent =>
      'OTP வெற்றிகரமாக மீண்டும் அனுப்பப்பட்டது';

  @override
  String get accountDeletedTitle => 'கணக்கு நீக்கப்பட்டது';

  @override
  String get accountDeletedMessage =>
      'உங்கள் கணக்கு நிரந்தரமாக நீக்கப்பட்டது.\nநீங்கள் செல்வதை கண்டு வருந்துகிறோம்.';

  @override
  String get accountDeletedBackToHome => 'முகப்புக்கு செல்க';

  @override
  String get contactUsTitle => 'எங்களைத் தொடர்பு கொள்ளுங்கள்';

  @override
  String get contactUsSubtitle =>
      'உங்களிடமிருந்து கேட்பதில் மகிழ்ச்சி அடைகிறோம்';

  @override
  String get contactUsSubject => 'பொருள்';

  @override
  String get contactUsMessageLabel => 'செய்தி';

  @override
  String get contactUsMessageHint =>
      'உங்கள் சிக்கல் அல்லது கேள்வியை விவரிக்கவும்...';

  @override
  String get contactUsAddAttachment => 'இணைப்பைச் சேர்';

  @override
  String get contactUsQuickContact => 'விரைவான தொடர்பு';

  @override
  String get contactUsEmail => 'மின்னஞ்சல்';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'அழைப்பு';

  @override
  String get contactUsCallValue => '+1 (555) 123-4567';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'எங்களுடன் அரட்டையடிக்கவும்';

  @override
  String get contactUsSend => 'செய்தி அனுப்பு';

  @override
  String get contactUsSending => 'அனுப்புகிறது...';

  @override
  String get contactUsNoMessage => 'செய்தியை உள்ளிடவும்';

  @override
  String get contactUsSent => 'செய்தி வெற்றிகரமாக அனுப்பப்பட்டது!';

  @override
  String get contactUsGeneralInquiry => 'பொது விசாரணை';

  @override
  String get contactUsTechnicalSupport => 'தொழில்நுட்ப ஆதரவு';

  @override
  String get contactUsAccountIssue => 'கணக்கு சிக்கல்';

  @override
  String get contactUsBillingQuestion => 'பில்லிங் கேள்வி';

  @override
  String get contactUsFeatureRequest => 'அம்ச கோரிக்கை';

  @override
  String get contactUsBugReport => 'பிழை அறிக்கை';

  @override
  String get helpFaqTitle => 'உதவி & கேள்விகள்';

  @override
  String get helpFaqSearchHint => 'கேள்விகளைத் தேடு...';

  @override
  String get helpFaqNoResults => 'முடிவுகள் எதுவும் இல்லை';

  @override
  String get helpFaqStillNeedHelp => 'இன்னும் உதவி தேவையா?';

  @override
  String get helpFaqContactUs => 'எங்களைத் தொடர்பு கொள்ளுங்கள்';

  @override
  String get helpFaqAll => 'அனைத்தும்';

  @override
  String get helpFaqAccount => 'கணக்கு';

  @override
  String get helpFaqPlayback => 'இயக்கம்';

  @override
  String get helpFaqBilling => 'பில்லிங்';

  @override
  String get helpFaqOther => 'மற்றவை';

  @override
  String get helpFaq1Q => 'எனது கடவுச்சொல்லை எவ்வாறு மீட்டமைப்பது?';

  @override
  String get helpFaq1A =>
      'உள்நுழைவுத் திரையில் \'கடவுச்சொல்லை மறந்துவிட்டீர்களா\' என்பதைத் தொட்டு உங்கள் கடவுச்சொல்லை மீட்டமைக்கலாம். உங்கள் பதிவு செய்த மின்னஞ்சல் அல்லது தொலைபேசிக்கு அனுப்பப்பட்ட வழிமுறைகளைப் பின்பற்றவும்.';

  @override
  String get helpFaq2Q => 'எனது சந்தா திட்டத்தை மாற்ற முடியுமா?';

  @override
  String get helpFaq2A =>
      'ஆம், உங்கள் தற்போதைய திட்டத்தைக் காண மற்றும் மாற்ற அமைப்புகள் > சந்தாவுக்குச் செல்லவும். மாற்றங்கள் அடுத்த பில்லிங் சுழற்சியில் இருந்து நடைமுறைக்கு வரும்.';

  @override
  String get helpFaq3Q => 'எனது கணக்கை எவ்வாறு நீக்குவது?';

  @override
  String get helpFaq3A =>
      'அமைப்புகள் > ஆபத்து மண்டலம் > எனது கணக்கை நீக்கு என்பதற்குச் செல்லவும். உங்கள் கணக்கை நிரந்தரமாக நீக்க சரிபார்ப்பு படிகளைப் பின்பற்றவும்.';

  @override
  String get helpFaq4Q => 'எனது பதிவிறக்கப்பட்ட கோப்புகள் எங்கே?';

  @override
  String get helpFaq4A =>
      'பதிவிறக்கப்பட்ட அத்தியாயங்கள் பயன்பாட்டில் எனது பதிவிறக்கங்களின் கீழ் சேமிக்கப்படும். அவை எப்போது வேண்டுமானாலும் ஆஃப்லைனில் கேட்க கிடைக்கும்.';

  @override
  String get helpFaq5Q => 'எனது சுயவிவர தகவலை எவ்வாறு புதுப்பிப்பது?';

  @override
  String get helpFaq5A =>
      'உங்கள் பெயர், மின்னஞ்சல், பிறந்த தேதி மற்றும் சுயவிவரப் படத்தைப் புதுப்பிக்க சுயவிவரம் > சுயவிவரத்தைத் திருத்து என்பதற்குச் செல்லவும்.';

  @override
  String get helpFaq6Q => 'எனது ஆடியோ ஏன் இயங்கவில்லை?';

  @override
  String get helpFaq6A =>
      'உங்கள் இணைய இணைப்பைச் சரிபார்த்து பயன்பாட்டை மறுதொடக்கம் செய்ய முயற்சிக்கவும். சிக்கல் தொடர்ந்தால், அமைப்புகளில் இருந்து பயன்பாட்டு கேச் அழிக்க முயற்சிக்கவும்.';

  @override
  String get helpFaq7Q => 'நான் எவ்வாறு பணத்தை திரும்பப் பெறுவது?';

  @override
  String get helpFaq7A =>
      'உங்கள் பரிவர்த்தனை விவரங்களுடன் support@webrofm.com இல் எங்கள் ஆதரவு குழுவைத் தொடர்பு கொள்ளவும். 5-7 வேலை நாட்களுக்குள் உங்கள் பணத்தை திரும்பச் செய்வோம்.';

  @override
  String get helpFaq8Q => 'ஒரு பிழையை எவ்வாறு புகாரளிப்பது?';

  @override
  String get helpFaq8A =>
      'அமைப்புகளில் எங்களைத் தொடர்பு கொள்ளுங்கள் பிரிவின் மூலம் பிழைகளை புகாரளிக்கலாம். சிக்கலை மீண்டும் உருவாக்கும் படிகள் மற்றும் உங்கள் சாதன தகவலைச் சேர்க்கவும்.';

  @override
  String get privacyPolicyTitle => 'தனியுரிமைக் கொள்கை';

  @override
  String get privacyPolicyLastUpdated =>
      'கடைசியாக புதுப்பிக்கப்பட்டது: ஜூலை 22, 2026';

  @override
  String get privacyPolicyCollection => 'சேகரிப்பு';

  @override
  String get privacyPolicyCollectionTitle => 'நாங்கள் சேகரிக்கும் தகவல்';

  @override
  String get privacyPolicyCollectionText =>
      'உங்கள் பெயர், மின்னஞ்சல் முகவரி, தொலைபேசி எண் மற்றும் சுயவிவரப் படம் போன்ற நீங்கள் நேரடியாக வழங்கும் தகவல்களை நாங்கள் சேகரிக்கிறோம். எங்கள் சேவைகளைப் பயன்படுத்தும் போது சாதன தகவல், பயன்பாட்டு தரவு மற்றும் கேட்கும் விருப்பங்கள் உட்பட சில தகவல்களையும் தானாக சேகரிக்கிறோம்.';

  @override
  String get privacyPolicyUsage => 'பயன்பாடு';

  @override
  String get privacyPolicyUsageTitle =>
      'உங்கள் தகவலை நாங்கள் எவ்வாறு பயன்படுத்துகிறோம்';

  @override
  String get privacyPolicyUsageText =>
      'எங்கள் ஸ்ட்ரீமிங் சேவைகளை வழங்க, பராமரிக்க மற்றும் மேம்படுத்த, உங்கள் அனுபவத்தை தனிப்பயனாக்க, புதுப்பிப்புகள் மற்றும் விளம்பர பொருட்களை அனுப்ப, மற்றும் எங்கள் தளத்தின் பாதுகாப்பை உறுதி செய்ய நாங்கள் சேகரிக்கும் தகவலைப் பயன்படுத்துகிறோம்.';

  @override
  String get privacyPolicySharing => 'பகிர்வு';

  @override
  String get privacyPolicySharingTitle => 'தகவல் பகிர்வு';

  @override
  String get privacyPolicySharingText =>
      'நாங்கள் உங்கள் தனிப்பட்ட தகவலை விற்க மாட்டோம். கடுமையான ரகசிய ஒப்பந்தங்களுக்கு உட்பட்டு, எங்கள் தளத்தை இயக்குவதில் எங்களுக்கு உதவும் நம்பகமான சேவை வழங்குநர்களுடன் உங்கள் தரவைப் பகிரலாம்.';

  @override
  String get privacyPolicySecurity => 'பாதுகாப்பு';

  @override
  String get privacyPolicySecurityTitle => 'தரவு பாதுகாப்பு';

  @override
  String get privacyPolicySecurityText =>
      'போக்குவரத்தில் மற்றும் ஓய்வு நேரத்தில் குறியாக்கம், வழக்கமான பாதுகாப்பு தணிக்கைகள் மற்றும் அணுகல் கட்டுப்பாடுகள் உட்பட உங்கள் தனிப்பட்ட தகவலைப் பாதுகாக்க தொழில் தரநிலை பாதுகாப்பு நடவடிக்கைகளை நாங்கள் செயல்படுத்துகிறோம்.';

  @override
  String get privacyPolicyRights => 'உரிமைகள்';

  @override
  String get privacyPolicyRightsTitle => 'உங்கள் உரிமைகள் மற்றும் தேர்வுகள்';

  @override
  String get privacyPolicyRightsText =>
      'உங்கள் கணக்கு அமைப்புகள் மூலம் எந்த நேரத்திலும் உங்கள் தனிப்பட்ட தகவலை அணுக, புதுப்பிக்க அல்லது நீக்க உங்களுக்கு உரிமை உண்டு. தனியுரிமை தொடர்பான கோரிக்கைகளுக்கு எங்களை நேரடியாக தொடர்பு கொள்ளலாம்.';

  @override
  String get termsOfUseTitle => 'பயன்பாட்டு விதிமுறைகள்';

  @override
  String get termsOfUseUsage => 'பயன்பாடு';

  @override
  String get termsOfUseUsageTitle => 'பயன்பாட்டு வழிகாட்டுதல்கள்';

  @override
  String get termsOfUseUsageText =>
      'WebroFM ஐப் பயன்படுத்துவதன் மூலம், சட்டப்பூர்வ நோக்கங்களுக்காக மட்டுமே சேவையைப் பயன்படுத்த ஒப்புக்கொள்கிறீர்கள். முன் எழுத்து மூலம் ஒப்புதல் இல்லாமல் எங்கள் தளத்திலிருந்து எந்த உள்ளடக்கத்தையும் மாற்ற, விநியோகிக்க அல்லது மீண்டும் உருவாக்க முடியாது. இந்த விதிமுறைகளை மீறினால் அணுகலை இடைநிறுத்த அல்லது நிறுத்துவதற்கான உரிமை எங்களுக்கு உள்ளது.';

  @override
  String get termsOfUseAccounts => 'கணக்குகள்';

  @override
  String get termsOfUseAccountsTitle => 'பயனர் கணக்குகள்';

  @override
  String get termsOfUseAccountsText =>
      'உங்கள் கணக்கு நற்சான்றிதழ்களின் ரகசியத்தன்மையை பராமரிக்க நீங்கள் பொறுப்பு. கணக்கை உருவாக்கும் போது துல்லியமான மற்றும் முழுமையான தகவலை வழங்க வேண்டும். உங்கள் கணக்கின் அங்கீகரிக்கப்படாத பயன்பாடு குறித்து உடனடியாக எங்களுக்கு அறிவிக்க வேண்டும்.';

  @override
  String get termsOfUseContent => 'உள்ளடக்கம்';

  @override
  String get termsOfUseContentTitle => 'உள்ளடக்கம் மற்றும் அறிவுசார் சொத்து';

  @override
  String get termsOfUseContentText =>
      'ஆடியோ ஸ்ட்ரீம்கள், வீடியோக்கள் மற்றும் கலைப்படைப்புகள் உட்பட WebroFM இல் கிடைக்கும் அனைத்து உள்ளடக்கமும் பதிப்புரிமை மற்றும் அறிவுசார் சொத்து சட்டங்களால் பாதுகாக்கப்படுகிறது. பயனர்கள் வெளிப்படையான அனுமதி இல்லாமல் உள்ளடக்கத்தை பதிவிறக்கம், பதிவு அல்லது மறுவிநியோகம் செய்ய முடியாது.';

  @override
  String get termsOfUseLiability => 'பொறுப்பு';

  @override
  String get termsOfUseLiabilityTitle => 'பொறுப்பின் வரம்பு';

  @override
  String get termsOfUseLiabilityText =>
      'சேவையைப் பயன்படுத்துவதால் ஏற்படும் எந்த மறைமுக, எதிர்பாராத அல்லது விளைவு சேதங்களுக்கும் WebroFM பொறுப்பாகாது. எங்கள் மொத்த பொறுப்பு கடந்த 12 மாதங்களில் சேவைக்காக நீங்கள் செலுத்திய தொகையை தாண்டாது.';

  @override
  String get notificationsTitle => 'அறிவிப்புகள்';

  @override
  String get notificationsEmptyTitle => 'அறிவிப்புகள் எதுவும் இல்லை';

  @override
  String get notificationsEmptySubtitle =>
      'நீங்கள் அனைத்தும் பார்த்துவிட்டீர்கள்! புதுப்பிப்புகளுக்கு பின்னர் மீண்டும் வரவும்.';

  @override
  String get downloadsTitle => 'எனது பதிவிறக்கங்கள்';

  @override
  String get downloadsEmptyTitle => 'இன்னும் பதிவிறக்கங்கள் எதுவும் இல்லை';

  @override
  String get downloadsEmptySubtitle =>
      'உங்கள் பதிவிறக்கப்பட்ட அத்தியாயங்கள் இங்கே தோன்றும், அதனால் நீங்கள் எப்போது வேண்டுமானாலும் ஆஃப்லைனில் கேட்கலாம்.';

  @override
  String get downloadsBrowseShows => 'நிகழ்ச்சிகளை உலாவு';

  @override
  String get premiumTitle => 'பிரீமியம்';

  @override
  String get collabTitle => 'ஒத்துழைப்பு';

  @override
  String get collabMyStories => 'எனது கதைகள்';

  @override
  String get collabMySponsorships => 'எனது ஸ்பான்சர்ஷிப்கள்';

  @override
  String get collabNoStories => 'இதுவரை கதைகள் எதுவும் சமர்ப்பிக்கப்படவில்லை.';

  @override
  String get collabNoSponsorships =>
      'இதுவரை ஸ்பான்சர்ஷிப்கள் எதுவும் சமர்ப்பிக்கப்படவில்லை.';

  @override
  String get collabApproved => 'அங்கீகரிக்கப்பட்டது';

  @override
  String get collabRejected => 'நிராகரிக்கப்பட்டது';

  @override
  String get collabReviewing => 'மதிப்பாய்வு செய்யப்படுகிறது';

  @override
  String get collabPending => 'நிலுவையில்';

  @override
  String get collabShareYourStory => 'உங்கள் கதையைப் பகிரவும்';

  @override
  String get collabShareYourStorySubtitle =>
      'இடம்பெறும் வாய்ப்புக்காக உங்கள் அசல் கதையைச் சமர்ப்பிக்கவும்.';

  @override
  String get collabSubmitStory => 'கதையைச் சமர்ப்பி';

  @override
  String get collabSponsorshipAd => 'ஸ்பான்சர்ஷிப் / விளம்பரம்';

  @override
  String get collabSponsorshipSubtitle =>
      'ஸ்பான்சர்ஷிப்பிற்காக உங்கள் பிராண்ட் அல்லது வணிகத்தைச் சமர்ப்பிக்கவும்.';

  @override
  String get collabSubmitAd => 'விளம்பரத்தைச் சமர்ப்பி';

  @override
  String get collabDialogStoryTitle => 'உங்கள் கதையைச் சமர்ப்பிக்கவும்';

  @override
  String get collabStoryTitle => 'கதையின் தலைப்பு';

  @override
  String get collabStoryTitleHint => 'உங்கள் கதையின் தலைப்பை உள்ளிடவும்';

  @override
  String get collabStoryContent => 'கதையின் உள்ளடக்கம்';

  @override
  String get collabStoryContentHint => 'உங்கள் கதையை இங்கே எழுதுங்கள்...';

  @override
  String get collabCancel => 'ரத்துசெய்';

  @override
  String get collabSubmit => 'சமர்ப்பி';

  @override
  String get collabDialogAdTitle => 'விளம்பரத்தைச் சமர்ப்பி';

  @override
  String get collabBrandName => 'பிராண்ட் பெயர்';

  @override
  String get collabBrandNameHint => 'உங்கள் பிராண்ட்/வணிக பெயர்';

  @override
  String get collabDescription => 'விளக்கம்';

  @override
  String get collabDescriptionHint => 'உங்கள் விளம்பரத்தை விவரிக்கவும்';

  @override
  String get collabTargetUrl => 'இலக்கு URL (விருப்பம்)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'படம் தேர்ந்தெடுக்கப்பட்டது';

  @override
  String get collabUploadAdVisual => 'விளம்பர காட்சியைப் பதிவேற்று';

  @override
  String get collabStatusRunning => 'இயங்குகிறது';

  @override
  String get collabStatusExpired => 'காலாவதியானது';

  @override
  String get languagesAppLanguage => 'பயன்பாட்டு மொழி';

  @override
  String get languagesSubtitleLanguage => 'வசன மொழி';

  @override
  String get bottomNavHome => 'முகப்பு';

  @override
  String get bottomNavSearch => 'தேடு';

  @override
  String get bottomNavCategories => 'வகைகள்';

  @override
  String get bottomNavMyList => 'எனது பட்டியல்';

  @override
  String get bottomNavProfile => 'சுயவிவரம்';

  @override
  String get networkOffline => 'ஆஃப்லைன் முறை';

  @override
  String get networkDownload => 'பதிவிறக்க முறை';

  @override
  String get networkOfflineSnackbar =>
      'ஆஃப்லைன் முறை இயக்கத்தில் உள்ளது\nபதிவிறக்க உள்ளடக்கத்தை ஆராயத் தொடங்குங்கள்';

  @override
  String get networkDismiss => 'நிராகரி';

  @override
  String get loadingPleaseWait => 'தயவுசெய்து காத்திருக்கவும்...';

  @override
  String get commonRetry => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get guestTimerTitle => 'இலவச நேரம் முடிந்தது!';

  @override
  String get guestTimerBody =>
      'அனைத்து உள்ளடக்கத்தையும் அணுக உள்நுழைக.\nஇது உங்களுக்கு இலவசம்!';

  @override
  String get freeLimitTitle => 'இலவச வரம்பு எட்டப்பட்டது';

  @override
  String get freeLimitBody =>
      'உங்கள் 1 நிமிட இலவச கேட்கும் நேரத்தைப் பயன்படுத்திவிட்டீர்கள். முழு எபிசோடையும் தொடர்ந்து கேட்க உள்நுழைக அல்லது பதிவு செய்க.';

  @override
  String get guestTimerLater => 'பின்னர்';

  @override
  String get guestTimerLogin => 'உள்நுழை / பதிவு செய்க';

  @override
  String get errorDataError =>
      'தரவு பிழை ஏற்பட்டது. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get errorInvalidData => 'தவறான தரவு வடிவம் பெறப்பட்டது.';

  @override
  String get errorUnexpected => 'எதிர்பாராத பிழை ஏற்பட்டது.';

  @override
  String get errorTimeout =>
      'இணைப்பு நேரம் முடிந்தது. உங்கள் இணைய இணைப்பைச் சரிபார்க்கவும்.';

  @override
  String get errorNoInternet =>
      'இணைய இணைப்பு இல்லை. உங்கள் நெட்வொர்க் அமைப்புகளைச் சரிபார்க்கவும்.';

  @override
  String get errorCancelled => 'கோரிக்கை ரத்து செய்யப்பட்டது.';

  @override
  String get errorSecurity =>
      'இணைப்பு பாதுகாப்பு பிழை. உங்கள் பயன்பாட்டைப் புதுப்பிக்கவும்.';

  @override
  String get errorNetwork => 'எதிர்பாராத நெட்வொர்க் பிழை ஏற்பட்டது.';

  @override
  String get errorInvalidRequest =>
      'தவறான கோரிக்கை. உங்கள் உள்ளீட்டைச் சரிபார்க்கவும்.';

  @override
  String get errorSessionExpired =>
      'அமர்வு காலாவதியானது. மீண்டும் உள்நுழையவும்.';

  @override
  String get errorPermissionDenied =>
      'இந்த செயலைச் செய்ய உங்களுக்கு அனுமதி இல்லை.';

  @override
  String get errorNotFound => 'கோரப்பட்ட வளம் கிடைக்கவில்லை.';

  @override
  String get errorConflict =>
      'முரண்பாடு கண்டறியப்பட்டது. வளம் புதுப்பிக்கப்பட்டிருக்கலாம்.';

  @override
  String get errorValidationFailed =>
      'சரிபார்ப்பு தோல்வியடைந்தது. உங்கள் உள்ளீட்டைச் சரிபார்க்கவும்.';

  @override
  String get errorTooManyRequests =>
      'அதிக கோரிக்கைகள். தயவுசெய்து பின்னர் மீண்டும் முயற்சிக்கவும்.';

  @override
  String get errorServer =>
      'சர்வர் பிழை. தயவுசெய்து பின்னர் மீண்டும் முயற்சிக்கவும்.';

  @override
  String get errorServiceUnavailable =>
      'சேவை தற்காலிகமாக கிடைக்கவில்லை. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get errorUnderMaintenance =>
      'சேவை பராமரிப்பில் உள்ளது. தயவுசெய்து பின்னர் மீண்டும் முயற்சிக்கவும்.';

  @override
  String errorGeneric(Object code) {
    return 'ஏதோ தவறு ஏற்பட்டது. (பிழை $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'இணைப்பு நேரம் முடிந்தது. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get errorNoConnection => 'இணைய இணைப்பு இல்லை.';

  @override
  String errorServerWithCode(Object code) {
    return 'சர்வர் பிழை ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'ஏதோ தவறு ஏற்பட்டது. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get pageNotFound => 'பக்கம் கிடைக்கவில்லை';

  @override
  String get pageNotFoundMessage => 'நீங்கள் தேடும் பக்கம் இல்லை.';

  @override
  String get goHome => 'முகப்புக்குச் செல்க';

  @override
  String get relativeTimeJustNow => 'இப்போதுதான்';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '$minutes நிமி முன்பு';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '$hours மணி முன்பு';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '$days நா முன்பு';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '$weeks வா முன்பு';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '$months மா முன்பு';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '$years வ ஆ முன்பு';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return '$minutes நிமிடத்தில்';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return '$hours மணியில்';
  }

  @override
  String relativeTimeInDay(Object days) {
    return '$days நாளில்';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '$hours ம $minutes நி';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '$minutes நி $seconds வி';
  }

  @override
  String fileSizeBytes(Object size) {
    return '$size பை';
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
    return '$count மி';
  }

  @override
  String countViewsK(Object count) {
    return '$count ஆ';
  }

  @override
  String episodeCount(Object count) {
    return '$count அத்';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'S$season E$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'சீசன் $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return 'No episodes available in $language';
  }

  @override
  String get contentDisclaimer =>
      'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.';

  @override
  String get categoryDrama => 'நாடகம்';

  @override
  String get categoryComedy => 'நகைச்சுவை';

  @override
  String get categoryPodcasts => 'பாட்காஸ்ட்கள்';

  @override
  String get categoryMusic => 'இசை';

  @override
  String get categoryKids => 'குழந்தைகள்';

  @override
  String get categoryDevotional => 'பக்தி';

  @override
  String get categoryNews => 'செய்திகள்';

  @override
  String get categorySports => 'விளையாட்டு';

  @override
  String get categoryTechnology => 'தொழில்நுட்பம்';

  @override
  String get categoryEducation => 'கல்வி';

  @override
  String get categoryBusiness => 'வணிகம்';

  @override
  String get categoryHealth => 'ஆரோக்கியம்';

  @override
  String get categoryScience => 'அறிவியல்';

  @override
  String get categoryArts => 'கலைகள்';

  @override
  String get trendingDramaSeries => 'நாடக தொடர்கள்';

  @override
  String get trendingComedyShows => 'நகைச்சுவை நிகழ்ச்சிகள்';

  @override
  String get trendingPodcasts => 'பாட்காஸ்ட்கள்';

  @override
  String get trendingMusicAlbums => 'இசை ஆல்பங்கள்';

  @override
  String get trendingKidsStories => 'குழந்தைகள் கதைகள்';

  @override
  String get trendingDevotional => 'பக்தி';

  @override
  String get trendingNewsToday => 'இன்றைய செய்திகள்';

  @override
  String get trendingSportsHighlights => 'விளையாட்டு சிறப்பம்சங்கள்';

  @override
  String get languageEnglish => 'ஆங்கிலம்';

  @override
  String get languageHindi => 'இந்தி';

  @override
  String get languagePunjabi => 'பஞ்சாபி';

  @override
  String get languageHaryanvi => 'ஹரியான்வி';

  @override
  String get languageMarathi => 'மராத்தி';

  @override
  String get languageGujarati => 'குஜராத்தி';

  @override
  String get languageBengali => 'வங்காளி';

  @override
  String get languageTamil => 'தமிழ்';

  @override
  String get languageTelugu => 'தெலுங்கு';

  @override
  String get languageKannada => 'கன்னடம்';

  @override
  String get languageMalayalam => 'மலையாளம்';

  @override
  String get languageUrdu => 'உருது';

  @override
  String get pressBackToExit => 'வெளியேற மீண்டும் பின்செல் அழுத்தவும்';

  @override
  String get exitDialogTitle => 'ஆப் மூடவா?';

  @override
  String get exitDialogBody => 'நீங்கள் உண்மையில் ஆப் மூட விரும்புகிறீர்களா?';

  @override
  String get exitDialogConfirm => 'மூடு';

  @override
  String get exitDialogCancel => 'ரத்து';

  @override
  String get profileShareApp => 'Share App';

  @override
  String get profileShareAppMessage =>
      'Check out WebroFM - your go-to app for streaming shows and podcasts!';
}
