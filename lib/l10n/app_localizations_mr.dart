// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'वेबरोएफएम';

  @override
  String get splashLoading => 'लोड करत आहे...';

  @override
  String get welcomeTitle => 'WebroFM मध्ये आपले स्वागत आहे';

  @override
  String get welcomeSubtitle => 'तुम्हाला हलवणाऱ्या कथा शोधा';

  @override
  String get welcomeGetStarted => 'सुरू करा';

  @override
  String get welcomeContinueAsGuest => 'पाहुणे म्हणून सुरू ठेवा';

  @override
  String get loginSearchCountries => 'देश शोधा';

  @override
  String get loginInvalidPhone => 'कृपया वैध फोन नंबर टाका';

  @override
  String get loginRateLimitTitle => 'दर मर्यादा गाठली';

  @override
  String get loginRateLimitContent =>
      'खूप ओटीपी प्रयत्न. कृपया 1 तासानंतर पुन्हा प्रयत्न करा.';

  @override
  String get loginOk => 'ठीक आहे';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'या तासात फक्त $remaining प्रयत्न शिल्लक';
  }

  @override
  String get loginTitle => 'सुरू ठेवण्यासाठी लॉगिन करा';

  @override
  String get loginSubtitle => 'सुरू करण्यासाठी तुमचा फोन नंबर टाका';

  @override
  String get loginPhoneHint => '(५५५) ०००-००००';

  @override
  String get loginIAgreeTo => 'मी सहमत आहे ';

  @override
  String get loginTermsOfUse => 'वापरण्याच्या अटी';

  @override
  String get loginAnd => ' आणि ';

  @override
  String get loginPrivacyPolicy => 'गोपनीयता धोरण';

  @override
  String get loginSendOtp => 'ओटीपी पाठवा';

  @override
  String get loginContinueAsGuest => 'पाहुणे म्हणून सुरू ठेवा';

  @override
  String get otpEnterCompleteCode => 'कृपया पूर्ण ६-अंकी कोड टाका';

  @override
  String get otpTitle => 'तुमचा नंबर सत्यापित करा';

  @override
  String get otpSubtitle => 'यावर पाठवलेला कोड टाका';

  @override
  String get otpVerifyAndContinue => 'सत्यापित करा आणि सुरू ठेवा';

  @override
  String get otpDidntReceive => 'कोड मिळाला नाही? ';

  @override
  String get otpResend => 'ओटीपी पुन्हा पाठवा';

  @override
  String get completeProfileTitle => 'तुमचे प्रोफाइल पूर्ण करा';

  @override
  String get completeProfileSubtitle =>
      'तुमचा अनुभव वैयक्तिकृत करण्यात आम्हाला मदत करा';

  @override
  String get completeProfileBasicInfo => 'मूलभूत माहिती';

  @override
  String get completeProfileFullName => 'पूर्ण नाव *';

  @override
  String get completeProfileNameHint => 'जॉन डो';

  @override
  String get completeProfileEmail => 'ईमेल पत्ता';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'लिंग *';

  @override
  String get completeProfileDateOfBirth => 'जन्म तारीख';

  @override
  String get completeProfileDobHint => 'तुमची जन्म तारीख निवडा';

  @override
  String get completeProfileMale => 'पुरुष';

  @override
  String get completeProfileFemale => 'स्त्री';

  @override
  String get completeProfileOther => 'इतर';

  @override
  String get completeProfileError => 'कृपया तुमचे नाव आणि लिंग निवडा';

  @override
  String get completeProfileSkip => 'वगळा';

  @override
  String get completeProfileContinue => 'सुरू ठेवा';

  @override
  String get interestTitle => 'तुमची आवड निवडा';

  @override
  String get interestSubtitle =>
      'वैयक्तिकृत शिफारशींसाठी तुम्हाला आवडणाऱ्या श्रेणी निवडा';

  @override
  String get interestSectionHeader => 'तुमची आवड निवडा';

  @override
  String get interestTapToSelect => 'निवडण्यासाठी टॅप करा';

  @override
  String get interestContinue => 'WebroFM वर सुरू ठेवा';

  @override
  String get interestSkip => 'वगळा';

  @override
  String get registrationTitle => 'तुमच्याबद्दल सांगा';

  @override
  String get registrationSubtitle => 'तुमचा अनुभव वैयक्तिकृत करण्यात मदत करा';

  @override
  String get registrationPersonalInfo => 'वैयक्तिक माहिती';

  @override
  String get registrationFullName => 'पूर्ण नाव';

  @override
  String get registrationNameHint => 'जॉन डो';

  @override
  String get registrationEmail => 'ईमेल पत्ता';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'जन्म तारीख';

  @override
  String get registrationDobHint => 'तुमची जन्म तारीख निवडा';

  @override
  String get registrationInterestsHeader => 'तुमची आवड निवडा';

  @override
  String get registrationInterestsSubtitle => 'तुम्हाला आवडणाऱ्या श्रेणी निवडा';

  @override
  String get registrationContinue => 'WebroFM वर सुरू ठेवा';

  @override
  String get registrationNameError => 'कृपया तुमचे नाव टाका';

  @override
  String get homeContinueWatching => 'पाहणे सुरू ठेवा';

  @override
  String get homeContinueListening => 'ऐकणे सुरू ठेवा';

  @override
  String get homeResume => 'पुन्हा सुरू करा';

  @override
  String get homeNewArrivals => 'नवीन आगमन';

  @override
  String get homeSeeAll => 'सर्व पहा';

  @override
  String get homePopularNow => 'आता लोकप्रिय';

  @override
  String get homeNoShows => 'कोणतेही शो उपलब्ध नाहीत';

  @override
  String get showDetailFailed => 'लोड करण्यात अयशस्वी';

  @override
  String get showDetailNotFound => 'शो सापडला नाही';

  @override
  String showDetailShareText(Object title) {
    return 'WebroFM वर $title पहा!';
  }

  @override
  String get showDetailDownloadStarted => 'डाउनलोड सुरू झाले';

  @override
  String get showDetailNoDescription => 'वर्णन उपलब्ध नाही.';

  @override
  String get showDetailReadLess => 'कमी वाचा';

  @override
  String get showDetailReadMore => 'अधिक वाचा';

  @override
  String get showDetailPlayLatest => 'नवीनतम भाग प्ले करा';

  @override
  String get showDetailEpisodes => 'भाग';

  @override
  String get showDetailNoEpisodes => 'कोणतेही भाग उपलब्ध नाहीत';

  @override
  String get showDetailMoreLikeThis => 'यासारखे आणखी';

  @override
  String get videoPlayerNoAudio => 'या भागासाठी ऑडिओ उपलब्ध नाही';

  @override
  String get videoPlayerLoading => 'व्हिडिओ लोड करत आहे...';

  @override
  String get videoPlayerNowPlaying => 'आता प्ले होत आहे';

  @override
  String get videoPlayerPaused => 'थांबवले';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'प्लेबॅक त्रुटी: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'व्हिडिओ प्लेयर';

  @override
  String get videoPlayerNext => 'पुढील';

  @override
  String get videoPlayerAudio => 'ऑडिओ';

  @override
  String get videoPlayerVideo => 'व्हिडिओ';

  @override
  String get showCardNew => 'नवीन';

  @override
  String get searchHint => 'शो, भाग शोधा...';

  @override
  String get searchTrending => 'ट्रेंडिंग शोध';

  @override
  String get searchSuggested => 'तुमच्यासाठी सुचवलेले';

  @override
  String get searchError => 'काहीतरी चूक झाली';

  @override
  String get searchNoResults => 'कोणतेही परिणाम सापडले नाहीत';

  @override
  String get searchNoResultsSubtitle =>
      'तुमचे शोध शब्द समायोजित करण्याचा प्रयत्न करा';

  @override
  String get categoriesTitle => 'श्रेणी एक्सप्लोर करा';

  @override
  String categoriesShowCount(Object count) {
    return '$count शो';
  }

  @override
  String get categoryDetailFailed => 'लोड करण्यात अयशस्वी';

  @override
  String get categoryDetailLoadMore => 'आणखी लोड करा';

  @override
  String get categoryDetailSortBy => 'क्रमवारी लावा';

  @override
  String get categoryDetailPopular => 'लोकप्रिय';

  @override
  String get categoryDetailNewest => 'नवीनतम';

  @override
  String get categoryDetailTopRated => 'सर्वोच्च रेटेड';

  @override
  String get myListTitle => 'माझी यादी';

  @override
  String get myListSaved => 'जतन केलेले';

  @override
  String get myListWatchHistory => 'पाहण्याचा इतिहास';

  @override
  String get myListError => 'काहीतरी चूक झाली';

  @override
  String get myListNoSaved => 'अद्याप कोणतेही जतन केलेले आयटम नाहीत';

  @override
  String get myListNoHistory => 'अद्याप कोणताही पाहण्याचा इतिहास नाही';

  @override
  String get myListNoSavedSubtitle =>
      'एक्सप्लोर करणे सुरू करा आणि तुमचे आवडते जतन करा';

  @override
  String get myListNoHistorySubtitle => 'तुम्ही अलीकडे पाहिलेले शो येथे दिसतील';

  @override
  String get myListExploreShows => 'शो एक्सप्लोर करा';

  @override
  String get myListRemoved => 'माझ्या यादीतून काढले';

  @override
  String get myListLoginTitle => 'तुमचे सेव्ह केलेले शो पाहण्यासाठी लॉगिन करा';

  @override
  String get myListLoginSubtitle =>
      'तुमचे आवडते शो सेव्ह करा आणि त्यांना कधीही प्रवेश करा';

  @override
  String get profileTitle => 'प्रोफाइल';

  @override
  String get profileUser => 'वापरकर्ता';

  @override
  String get profileNoPhone => 'फोन नाही';

  @override
  String get profileEditProfile => 'प्रोफाइल संपादित करा';

  @override
  String get profileYourInterests => 'तुमच्या आवडी';

  @override
  String get profileNoCategories => 'कोणतीही श्रेणी निवडलेली नाही';

  @override
  String get profileDobLabel => 'जन्मतारीख';

  @override
  String get profileNotLoggedIn => 'तुम्ही लॉगिन केलेले नाही';

  @override
  String get profileNotLoggedInSubtitle =>
      'तुमचे प्रोफाइल, डाउनलोड आणि वैयक्तिकृत शिफारशींमध्ये प्रवेश करण्यासाठी साइन इन करा.';

  @override
  String get profileLogin => 'लॉगिन';

  @override
  String get profileCollaboration => 'सहयोग';

  @override
  String get profileSettings => 'सेटिंग्ज आणि प्राधान्ये';

  @override
  String get profileMyDownloads => 'माझे डाउनलोड';

  @override
  String get profileTermsOfUse => 'वापरण्याच्या अटी';

  @override
  String get profilePrivacyPolicy => 'गोपनीयता धोरण';

  @override
  String get profileHelpFaq => 'मदत आणि वारंवार विचारले जाणारे प्रश्न';

  @override
  String get profileContactUs => 'आमच्याशी संपर्क साधा';

  @override
  String get profileLogout => 'लॉगआउट';

  @override
  String get profileLogoutTitle => 'लॉगआउट';

  @override
  String get profileLogoutConfirm => 'तुम्हाला खरोखर लॉगआउट करायचे आहे का?';

  @override
  String get profileCancel => 'रद्द करा';

  @override
  String get editProfileTitle => 'प्रोफाइल संपादित करा';

  @override
  String get editProfileTapToChangePhoto => 'फोटो बदलण्यासाठी टॅप करा';

  @override
  String get editProfileFullName => 'पूर्ण नाव';

  @override
  String get editProfileNameRequired => 'नाव आवश्यक आहे';

  @override
  String get editProfileEmail => 'ईमेल';

  @override
  String get editProfileEmailRequired => 'ईमेल आवश्यक आहे';

  @override
  String get editProfileInvalidEmail => 'अवैध ईमेल';

  @override
  String get editProfileDob => 'जन्म तारीख';

  @override
  String get editProfilePhone => 'फोन';

  @override
  String get editProfileCategoryPreferences => 'श्रेणी प्राधान्ये';

  @override
  String get editProfileAddMore => 'आणखी जोडा';

  @override
  String get editProfileAddCategory => 'श्रेणी जोडा';

  @override
  String get editProfileSaveChanges => 'बदल जतन करा';

  @override
  String get editProfileUserDataNotAvailable => 'वापरकर्ता डेटा उपलब्ध नाही';

  @override
  String get editProfileUpdatedSuccess => 'प्रोफाइल यशस्वीरित्या अद्यतनित केले';

  @override
  String get editProfileCancel => 'रद्द करा';

  @override
  String get editProfileSubmit => 'सबमिट करा';

  @override
  String get settingsTitle => 'सेटिंग्ज';

  @override
  String get settingsGeneral => 'सामान्य';

  @override
  String get settingsAppLanguage => 'अ‍ॅप भाषा';

  @override
  String get settingsSubtitleLanguage => 'उपशीर्षक भाषा';

  @override
  String get settingsAppearancePlayback => 'स्वरूप आणि प्लेबॅक';

  @override
  String get settingsColorTheme => 'रंग थीम';

  @override
  String get settingsLight => 'हलकी';

  @override
  String get settingsDark => 'गडद';

  @override
  String get settingsSystem => 'सिस्टम';

  @override
  String get settingsAutoplayNext => 'पुढील भाग ऑटोप्ले करा';

  @override
  String get settingsDownloadQuality => 'डाउनलोड गुणवत्ता';

  @override
  String get settingsLow => 'कमी';

  @override
  String get settingsMedium => 'मध्यम';

  @override
  String get settingsHigh => 'उच्च';

  @override
  String get settingsVeryHigh => 'खूप उच्च';

  @override
  String get settingsAccountPrivacy => 'खाते आणि गोपनीयता';

  @override
  String get settingsAgeRestriction => 'वय/सामग्री प्रतिबंध';

  @override
  String get settingsNotifications => 'सूचना';

  @override
  String get settingsDangerZone => 'धोकादायक क्षेत्र';

  @override
  String get settingsDeleteAccount => 'माझे खाते हटवा';

  @override
  String get deleteAccountTitle => 'खाते हटवा';

  @override
  String get deleteAccountHeader => 'माझे खाते हटवा';

  @override
  String get deleteAccountWarning =>
      'ही क्रिया पूर्ववत करता येणार नाही. तुमचा सर्व डेटा कायमचा हटविला जाईल.';

  @override
  String get deleteAccountDataLoss => 'खालील डेटा हरविला जाईल:';

  @override
  String get deleteAccountReason => 'हटवण्याचे कारण';

  @override
  String get deleteAccountSelectReason => 'एक कारण निवडा';

  @override
  String get deleteAccountNotUsing => 'मी यापुढे अ‍ॅप वापरत नाही';

  @override
  String get deleteAccountTooExpensive => 'खूप महाग';

  @override
  String get deleteAccountPrivacy => 'गोपनीयतेची चिंता';

  @override
  String get deleteAccountTechnicalIssues => 'तांत्रिक समस्या';

  @override
  String get deleteAccountFoundAlternative => 'चांगला पर्याय सापडला';

  @override
  String get deleteAccountOther => 'इतर';

  @override
  String get deleteAccountProfileSettings => 'प्रोफाइल आणि सेटिंग्ज';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'तुमची प्रोफाइल माहिती, प्राधान्ये आणि अ‍ॅप सेटिंग्ज कायमची हटविली जातील.';

  @override
  String get deleteAccountListeningHistory => 'ऐकण्याचा इतिहास';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'तुमचा ऐकण्याचा इतिहास, शोध इतिहास आणि क्रियाकलाप लॉग मिटवले जातील.';

  @override
  String get deleteAccountSavedItems => 'जतन केलेले आयटम';

  @override
  String get deleteAccountSavedItemsDesc =>
      'तुमची सर्व प्लेलिस्ट, आवडते आणि जतन केलेली सामग्री काढून टाकली जाईल.';

  @override
  String get deleteAccountSubscriptions => 'सदस्यता';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'कोणतीही सक्रिय सदस्यता रद्द केली जाईल आणि प्रीमियम प्रवेश संपेल.';

  @override
  String get deleteAccountDelete => 'माझे खाते हटवा';

  @override
  String get deleteAccountCancel => 'रद्द करा';

  @override
  String get deleteAccountOtpTitle => 'हटवण्याची पडताळणी करा';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return '$phone वर पाठवलेला ओटीपी टाका';
  }

  @override
  String get deleteAccountOtpConfirm => 'हटवण्याची पुष्टी करा';

  @override
  String get deleteAccountOtpResend => 'ओटीपी पुन्हा पाठवा';

  @override
  String get deleteAccountOtpResent => 'ओटीपी यशस्वीरित्या पुन्हा पाठवला';

  @override
  String get accountDeletedTitle => 'खाते हटविले';

  @override
  String get accountDeletedMessage =>
      'तुमचे खाते कायमचे हटविले गेले आहे.\nतुम्हाला सोडून दिल्याबद्दल आम्हाला वाईट वाटते.';

  @override
  String get accountDeletedBackToHome => 'मुख्यपृष्ठावर परत जा';

  @override
  String get contactUsTitle => 'आमच्याशी संपर्क साधा';

  @override
  String get contactUsSubtitle => 'तुमच्याकडून ऐकायला आम्हाला आवडेल';

  @override
  String get contactUsSubject => 'विषय';

  @override
  String get contactUsMessageLabel => 'संदेश';

  @override
  String get contactUsMessageHint => 'तुमची समस्या किंवा प्रश्न वर्णन करा...';

  @override
  String get contactUsAddAttachment => 'संलग्नक जोडा';

  @override
  String get contactUsQuickContact => 'त्वरित संपर्क';

  @override
  String get contactUsEmail => 'ईमेल';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'कॉल';

  @override
  String get contactUsCallValue => '+१ (५५५) १२३-४५६७';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'आमच्याशी गप्पा मारा';

  @override
  String get contactUsSend => 'संदेश पाठवा';

  @override
  String get contactUsSending => 'पाठवत आहे...';

  @override
  String get contactUsNoMessage => 'कृपया एक संदेश टाका';

  @override
  String get contactUsSent => 'संदेश यशस्वीरित्या पाठविला!';

  @override
  String get contactUsGeneralInquiry => 'सामान्य चौकशी';

  @override
  String get contactUsTechnicalSupport => 'तांत्रिक समर्थन';

  @override
  String get contactUsAccountIssue => 'खाते समस्या';

  @override
  String get contactUsBillingQuestion => 'बिलिंग प्रश्न';

  @override
  String get contactUsFeatureRequest => 'वैशिष्ट्य विनंती';

  @override
  String get contactUsBugReport => 'बग अहवाल';

  @override
  String get helpFaqTitle => 'मदत आणि वारंवार विचारले जाणारे प्रश्न';

  @override
  String get helpFaqSearchHint => 'वारंवार विचारले जाणारे प्रश्न शोधा...';

  @override
  String get helpFaqNoResults => 'कोणतेही परिणाम सापडले नाहीत';

  @override
  String get helpFaqStillNeedHelp => 'अद्याप मदत हवी आहे?';

  @override
  String get helpFaqContactUs => 'आमच्याशी संपर्क साधा';

  @override
  String get helpFaqAll => 'सर्व';

  @override
  String get helpFaqAccount => 'खाते';

  @override
  String get helpFaqPlayback => 'प्लेबॅक';

  @override
  String get helpFaqBilling => 'बिलिंग';

  @override
  String get helpFaqOther => 'इतर';

  @override
  String get helpFaq1Q => 'मी माझा पासवर्ड कसा रीसेट करू?';

  @override
  String get helpFaq1A =>
      'तुम्ही लॉगिन स्क्रीनवरून \'फॉरगॉट पासवर्ड\' वर टॅप करून तुमचा पासवर्ड रीसेट करू शकता. तुमच्या नोंदणीकृत ईमेल किंवा फोनवर पाठवलेल्या सूचनांचे अनुसरण करा.';

  @override
  String get helpFaq2Q => 'मी माझी सदस्यता योजना बदलू शकतो का?';

  @override
  String get helpFaq2A =>
      'होय, तुमची सद्य योजना पाहण्यासाठी आणि बदलण्यासाठी सेटिंग्ज > सदस्यता वर जा. बदल पुढील बिलिंग सायकलपासून लागू होतील.';

  @override
  String get helpFaq3Q => 'मी माझे खाते कसे हटवू?';

  @override
  String get helpFaq3A =>
      'सेटिंग्ज > धोकादायक क्षेत्र > माझे खाते हटवा वर जा. तुमचे खाते कायमचे हटवण्यासाठी पडताळणी चरणांचे अनुसरण करा.';

  @override
  String get helpFaq4Q => 'माझे डाउनलोड केलेले फाइल्स कुठे आहेत?';

  @override
  String get helpFaq4A =>
      'डाउनलोड केलेले भाग अ‍ॅपमध्ये माझे डाउनलोड अंतर्गत संग्रहित केले जातात. ते ऑफलाइन कधीही ऐकण्यासाठी उपलब्ध आहेत.';

  @override
  String get helpFaq5Q => 'मी माझी प्रोफाइल माहिती कशी अद्यतनित करू?';

  @override
  String get helpFaq5A =>
      'तुमचे नाव, ईमेल, जन्म तारीख आणि प्रोफाइल चित्र अद्यतनित करण्यासाठी प्रोफाइल > प्रोफाइल संपादित करा वर जा.';

  @override
  String get helpFaq6Q => 'माझे ऑडिओ का प्ले होत नाही?';

  @override
  String get helpFaq6A =>
      'तुमचे इंटरनेट कनेक्शन तपासा आणि अ‍ॅप पुन्हा सुरू करण्याचा प्रयत्न करा. समस्या कायम राहिल्यास, सेटिंग्ज मधून अ‍ॅप कॅशे साफ करण्याचा प्रयत्न करा.';

  @override
  String get helpFaq7Q => 'मी रिफंड कसा मिळवू?';

  @override
  String get helpFaq7A =>
      'तुमच्या व्यवहार तपशीलांसह support@webrofm.com वर आमच्या समर्थन टीमशी संपर्क साधा. आम्ही ५-७ कामकाजाच्या दिवसांत तुमचा रिफंड प्रक्रिया करू.';

  @override
  String get helpFaq8Q => 'मी बग कसा रिपोर्ट करू?';

  @override
  String get helpFaq8A =>
      'तुम्ही सेटिंग्जमधील आमच्याशी संपर्क साधा विभागाद्वारे बग रिपोर्ट करू शकता. कृपया समस्या पुन्हा निर्माण करण्याच्या पायऱ्या आणि तुमची डिव्हाइस माहिती समाविष्ट करा.';

  @override
  String get privacyPolicyTitle => 'गोपनीयता धोरण';

  @override
  String get privacyPolicyLastUpdated => 'शेवटचे अद्यतन: २२ जुलै २०२६';

  @override
  String get privacyPolicyCollection => 'संग्रह';

  @override
  String get privacyPolicyCollectionTitle => 'आम्ही कोणती माहिती गोळा करतो';

  @override
  String get privacyPolicyCollectionText =>
      'आम्ही तुम्ही थेट प्रदान केलेली माहिती गोळा करतो, जसे की तुमचे नाव, ईमेल पत्ता, फोन नंबर आणि प्रोफाइल चित्र. जेव्हा तुम्ही आमच्या सेवा वापरता तेव्हा आम्ही डिव्हाइस माहिती, वापर डेटा आणि ऐकण्याची प्राधान्ये यासह काही माहिती आपोआप गोळा करतो.';

  @override
  String get privacyPolicyUsage => 'वापर';

  @override
  String get privacyPolicyUsageTitle => 'आम्ही तुमची माहिती कशी वापरतो';

  @override
  String get privacyPolicyUsageText =>
      'आम्ही आमच्या स्ट्रीमिंग सेवा प्रदान करण्यासाठी, राखण्यासाठी आणि सुधारण्यासाठी, तुमचा अनुभव वैयक्तिकृत करण्यासाठी, तुम्हाला अद्यतने आणि प्रचारात्मक साहित्य पाठवण्यासाठी आणि आमच्या प्लॅटफॉर्मची सुरक्षा सुनिश्चित करण्यासाठी गोळा केलेली माहिती वापरतो.';

  @override
  String get privacyPolicySharing => 'सामायिकरण';

  @override
  String get privacyPolicySharingTitle => 'माहिती सामायिकरण';

  @override
  String get privacyPolicySharingText =>
      'आम्ही तुमची वैयक्तिक माहिती विकत नाही. आम्ही तुमचा डेटा विश्वसनीय सेवा प्रदात्यांसह सामायिक करू शकतो जे आमच्या प्लॅटफॉर्मच्या संचालनात मदत करतात, कठोर गोपनीयता करारांच्या अधीन.';

  @override
  String get privacyPolicySecurity => 'सुरक्षा';

  @override
  String get privacyPolicySecurityTitle => 'डेटा सुरक्षा';

  @override
  String get privacyPolicySecurityText =>
      'आम्ही तुमची वैयक्तिक माहिती संरक्षित करण्यासाठी उद्योग-मानक सुरक्षा उपाय लागू करतो, ज्यामध्ये ट्रान्झिट आणि रेस्टमध्ये एन्क्रिप्शन, नियमित सुरक्षा ऑडिट आणि प्रवेश नियंत्रणे समाविष्ट आहेत.';

  @override
  String get privacyPolicyRights => 'अधिकार';

  @override
  String get privacyPolicyRightsTitle => 'तुमचे अधिकार आणि पर्याय';

  @override
  String get privacyPolicyRightsText =>
      'तुम्हाला तुमच्या खाते सेटिंग्जद्वारे कधीही तुमची वैयक्तिक माहिती प्रवेश, अद्यतनित किंवा हटविण्याचा अधिकार आहे. तुम्ही कोणत्याही गोपनीयता-संबंधित विनंत्यांसाठी थेट आमच्याशी संपर्क साधू शकता.';

  @override
  String get termsOfUseTitle => 'वापरण्याच्या अटी';

  @override
  String get termsOfUseUsage => 'वापर';

  @override
  String get termsOfUseUsageTitle => 'वापर मार्गदर्शक तत्त्वे';

  @override
  String get termsOfUseUsageText =>
      'WebroFM वापरून, तुम्ही केवळ कायदेशीर हेतूंसाठी सेवा वापरण्यास सहमती देता. तुम्ही आमच्या प्लॅटफॉर्मवरील कोणतीही सामग्री पूर्व लेखी संमतीशिवाय सुधारित, वितरित किंवा पुनरुत्पादित करू शकत नाही. या अटींच्या उल्लंघनासाठी प्रवेश निलंबित किंवा समाप्त करण्याचा अधिकार आम्ही राखून ठेवतो.';

  @override
  String get termsOfUseAccounts => 'खाती';

  @override
  String get termsOfUseAccountsTitle => 'वापरकर्ता खाती';

  @override
  String get termsOfUseAccountsText =>
      'तुमच्या खात्याची क्रेडेन्शियल्सची गोपनीयता राखण्यासाठी तुम्ही जबाबदार आहात. खाते तयार करताना तुम्ही अचूक आणि पूर्ण माहिती प्रदान करणे आवश्यक आहे. तुमच्या खात्याच्या कोणत्याही अनधिकृत वापराची त्वरित आम्हाला सूचित करणे आवश्यक आहे.';

  @override
  String get termsOfUseContent => 'सामग्री';

  @override
  String get termsOfUseContentTitle => 'सामग्री आणि बौद्धिक संपदा';

  @override
  String get termsOfUseContentText =>
      'WebroFM वर उपलब्ध सर्व सामग्री, ऑडिओ स्ट्रीम, व्हिडिओ आणि आर्टवर्कसह, कॉपीराइट आणि बौद्धिक संपदा कायद्यांद्वारे संरक्षित आहे. वापरकर्ते स्पष्ट परवानगीशिवाय सामग्री डाउनलोड, रेकॉर्ड किंवा पुनर्वितरित करू शकत नाहीत.';

  @override
  String get termsOfUseLiability => 'दायित्व';

  @override
  String get termsOfUseLiabilityTitle => 'दायित्वाची मर्यादा';

  @override
  String get termsOfUseLiabilityText =>
      'तुमच्या सेवेच्या वापरामुळे उद्भवणाऱ्या कोणत्याही अप्रत्यक्ष, आकस्मिक किंवा परिणामी नुकसानीसाठी WebroFM जबाबदार राहणार नाही. आमचे एकूण दायित्व गेल्या १२ महिन्यांत तुम्ही सेवेसाठी भरलेल्या रकमेपेक्षा जास्त राहणार नाही.';

  @override
  String get notificationsTitle => 'सूचना';

  @override
  String get notificationsEmptyTitle => 'सूचना नाहीत';

  @override
  String get notificationsEmptySubtitle =>
      'तुम्ही सर्व अद्ययावत आहात! अद्यतनांसाठी नंतर परत तपासा.';

  @override
  String get downloadsTitle => 'माझे डाउनलोड';

  @override
  String get downloadsEmptyTitle => 'अद्याप डाउनलोड नाहीत';

  @override
  String get downloadsEmptySubtitle =>
      'तुमचे डाउनलोड केलेले भाग येथे दिसतील जेणेकरून तुम्ही कधीही ऑफलाइन ऐकू शकता.';

  @override
  String get downloadsBrowseShows => 'शो ब्राउझ करा';

  @override
  String get premiumTitle => 'प्रीमियम';

  @override
  String get collabTitle => 'सहयोग';

  @override
  String get collabMyStories => 'माझ्या कथा';

  @override
  String get collabMySponsorships => 'माझे प्रायोजकत्व';

  @override
  String get collabNoStories => 'अद्याप कोणत्याही कथा सबमिट केल्या नाहीत.';

  @override
  String get collabNoSponsorships =>
      'अद्याप कोणतेही प्रायोजकत्व सबमिट केले नाही.';

  @override
  String get collabApproved => 'मंजूर';

  @override
  String get collabRejected => 'नाकारले';

  @override
  String get collabReviewing => 'पुनरावलोकन करत आहे';

  @override
  String get collabPending => 'प्रलंबित';

  @override
  String get collabShareYourStory => 'तुमची कथा शेअर करा';

  @override
  String get collabShareYourStorySubtitle =>
      'वैशिष्ट्यीकृत होण्याच्या संधीसाठी तुमची मूळ कथा सबमिट करा.';

  @override
  String get collabSubmitStory => 'कथा सबमिट करा';

  @override
  String get collabSponsorshipAd => 'प्रायोजकत्व / जाहिरात';

  @override
  String get collabSponsorshipSubtitle =>
      'प्रायोजकत्वासाठी तुमचा ब्रँड किंवा व्यवसाय सबमिट करा.';

  @override
  String get collabSubmitAd => 'जाहिरात सबमिट करा';

  @override
  String get collabDialogStoryTitle => 'तुमची कथा सबमिट करा';

  @override
  String get collabStoryTitle => 'कथेचे शीर्षक';

  @override
  String get collabStoryTitleHint => 'तुमचे कथेचे शीर्षक टाका';

  @override
  String get collabStoryContent => 'कथेची सामग्री';

  @override
  String get collabStoryContentHint => 'तुमची कथा येथे लिहा...';

  @override
  String get collabCancel => 'रद्द करा';

  @override
  String get collabSubmit => 'सबमिट करा';

  @override
  String get collabDialogAdTitle => 'जाहिरात सबमिट करा';

  @override
  String get collabBrandName => 'ब्रँड नाव';

  @override
  String get collabBrandNameHint => 'तुमचे ब्रँड/व्यवसाय नाव';

  @override
  String get collabDescription => 'वर्णन';

  @override
  String get collabDescriptionHint => 'तुमची जाहिरात वर्णन करा';

  @override
  String get collabTargetUrl => 'लक्ष्य URL (पर्यायी)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'प्रतिमा निवडली';

  @override
  String get collabUploadAdVisual => 'जाहिरात व्हिज्युअल अपलोड करा';

  @override
  String get collabStatusRunning => 'चालू आहे';

  @override
  String get collabStatusExpired => 'कालबाह्य';

  @override
  String get languagesAppLanguage => 'अ‍ॅप भाषा';

  @override
  String get languagesSubtitleLanguage => 'उपशीर्षक भाषा';

  @override
  String get bottomNavHome => 'मुख्यपृष्ठ';

  @override
  String get bottomNavSearch => 'शोध';

  @override
  String get bottomNavCategories => 'श्रेणी';

  @override
  String get bottomNavMyList => 'माझी यादी';

  @override
  String get bottomNavProfile => 'प्रोफाइल';

  @override
  String get networkOffline => 'ऑफलाइन मोड';

  @override
  String get networkDownload => 'डाउनलोड मोड';

  @override
  String get networkOfflineSnackbar =>
      'ऑफलाइन मोड चालू\nडाउनलोड सामग्री एक्सप्लोर करणे सुरू करा';

  @override
  String get networkDismiss => 'बरखास्त करा';

  @override
  String get loadingPleaseWait => 'कृपया प्रतीक्षा करा...';

  @override
  String get commonRetry => 'पुन्हा प्रयत्न करा';

  @override
  String get guestTimerTitle => 'मोफत वेळ संपली!';

  @override
  String get guestTimerBody =>
      'सर्व सामग्रीमध्ये प्रवेश करण्यासाठी लॉगिन करा.\nते तुमच्यासाठी मोफत आहे!';

  @override
  String get freeLimitTitle => 'मोफत मर्यादा पूर्ण';

  @override
  String get freeLimitBody =>
      'तुम्ही तुमची 1 मिनिटाची मोफत ऐकण्याची मर्यादा वापरली आहे. पूर्ण भाग ऐकणे सुरू ठेवण्यासाठी कृपया लॉगिन करा किंवा साइन अप करा.';

  @override
  String get guestTimerLater => 'नंतर';

  @override
  String get guestTimerLogin => 'लॉगिन / साइन अप';

  @override
  String get errorDataError => 'डेटा त्रुटी आली. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errorInvalidData => 'अवैध डेटा फॉरमॅट प्राप्त झाला.';

  @override
  String get errorUnexpected => 'एक अनपेक्षित त्रुटी आली.';

  @override
  String get errorTimeout =>
      'कनेक्शन वेळ संपली. कृपया तुमचे इंटरनेट कनेक्शन तपासा.';

  @override
  String get errorNoInternet =>
      'इंटरनेट कनेक्शन नाही. कृपया तुमची नेटवर्क सेटिंग्ज तपासा.';

  @override
  String get errorCancelled => 'विनंती रद्द केली गेली.';

  @override
  String get errorSecurity =>
      'कनेक्शन सुरक्षा त्रुटी. कृपया तुमचे अ‍ॅप अद्यतनित करा.';

  @override
  String get errorNetwork => 'एक अनपेक्षित नेटवर्क त्रुटी आली.';

  @override
  String get errorInvalidRequest =>
      'अवैध विनंती. कृपया तुमचे इनपुट सत्यापित करा.';

  @override
  String get errorSessionExpired =>
      'सत्र कालबाह्य झाले. कृपया पुन्हा साइन इन करा.';

  @override
  String get errorPermissionDenied =>
      'ही क्रिया करण्यासाठी तुम्हाला परवानगी नाही.';

  @override
  String get errorNotFound => 'विनंती केलेला संसाधन सापडला नाही.';

  @override
  String get errorConflict => 'संघर्ष आढळला. संसाधन अद्यतनित केले गेले असावे.';

  @override
  String get errorValidationFailed =>
      'सत्यापन अयशस्वी. कृपया तुमचे इनपुट तपासा.';

  @override
  String get errorTooManyRequests =>
      'खूप विनंत्या. कृपया नंतर पुन्हा प्रयत्न करा.';

  @override
  String get errorServer => 'सर्व्हर त्रुटी. कृपया नंतर पुन्हा प्रयत्न करा.';

  @override
  String get errorServiceUnavailable =>
      'सेवा तात्पुरती अनुपलब्ध आहे. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errorUnderMaintenance =>
      'सेवा देखभालीखाली आहे. कृपया नंतर पुन्हा प्रयत्न करा.';

  @override
  String errorGeneric(Object code) {
    return 'काहीतरी चूक झाली. (त्रुटी $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'कनेक्शन वेळ संपली. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errorNoConnection => 'इंटरनेट कनेक्शन नाही.';

  @override
  String errorServerWithCode(Object code) {
    return 'सर्व्हर त्रुटी ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'काहीतरी चूक झाली. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get pageNotFound => 'पृष्ठ सापडले नाही';

  @override
  String get pageNotFoundMessage => 'तुम्ही शोधत असलेले पृष्ठ अस्तित्वात नाही.';

  @override
  String get goHome => 'मुख्यपृष्ठावर जा';

  @override
  String get relativeTimeJustNow => 'आत्ताच';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '$minutes मि पूर्वी';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '$hours ता पूर्वी';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '$days दि पूर्वी';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '$weeks आठ पूर्वी';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '$months महि पूर्वी';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '$years वि पूर्वी';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return '$minutes मि मध्ये';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return '$hours ता मध्ये';
  }

  @override
  String relativeTimeInDay(Object days) {
    return '$days दि मध्ये';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '$hours ता $minutes मि';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '$minutes मि $seconds से';
  }

  @override
  String fileSizeBytes(Object size) {
    return '$size बा';
  }

  @override
  String fileSizeKB(Object size) {
    return '$size केबी';
  }

  @override
  String fileSizeMB(Object size) {
    return '$size एमबी';
  }

  @override
  String fileSizeGB(Object size) {
    return '$size जीबी';
  }

  @override
  String countViewsM(Object count) {
    return '$count मि';
  }

  @override
  String countViewsK(Object count) {
    return '$count ह';
  }

  @override
  String episodeCount(Object count) {
    return '$count भा';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'S$season E$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'सीझन $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return 'No episodes available in $language';
  }

  @override
  String get contentDisclaimer =>
      'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.';

  @override
  String get categoryDrama => 'नाटक';

  @override
  String get categoryComedy => 'विनोदी';

  @override
  String get categoryPodcasts => 'पॉडकास्ट';

  @override
  String get categoryMusic => 'संगीत';

  @override
  String get categoryKids => 'मुले';

  @override
  String get categoryDevotional => 'भक्तीपर';

  @override
  String get categoryNews => 'बातम्या';

  @override
  String get categorySports => 'खेळ';

  @override
  String get categoryTechnology => 'तंत्रज्ञान';

  @override
  String get categoryEducation => 'शिक्षण';

  @override
  String get categoryBusiness => 'व्यवसाय';

  @override
  String get categoryHealth => 'आरोग्य';

  @override
  String get categoryScience => 'विज्ञान';

  @override
  String get categoryArts => 'कला';

  @override
  String get trendingDramaSeries => 'नाटक मालिका';

  @override
  String get trendingComedyShows => 'विनोदी शो';

  @override
  String get trendingPodcasts => 'पॉडकास्ट';

  @override
  String get trendingMusicAlbums => 'संगीत अल्बम';

  @override
  String get trendingKidsStories => 'मुलांच्या कथा';

  @override
  String get trendingDevotional => 'भक्तीपर';

  @override
  String get trendingNewsToday => 'आजच्या बातम्या';

  @override
  String get trendingSportsHighlights => 'क्रीडा हायलाइट्स';

  @override
  String get languageEnglish => 'इंग्रजी';

  @override
  String get languageHindi => 'हिंदी';

  @override
  String get languagePunjabi => 'पंजाबी';

  @override
  String get languageHaryanvi => 'हरियाणवी';

  @override
  String get languageMarathi => 'मराठी';

  @override
  String get languageGujarati => 'गुजराती';

  @override
  String get languageBengali => 'बंगाली';

  @override
  String get languageTamil => 'तामिळ';

  @override
  String get languageTelugu => 'तेलुगु';

  @override
  String get languageKannada => 'कन्नड';

  @override
  String get languageMalayalam => 'मल्याळम';

  @override
  String get languageUrdu => 'उर्दू';

  @override
  String get pressBackToExit => 'बाहेर जाण्यासाठी पुन्हा मागे दाबा';

  @override
  String get exitDialogTitle => 'अॅप बंद करायचे?';

  @override
  String get exitDialogBody => 'तुम्हाला खरोखर अॅप बंद करायचे आहे का?';

  @override
  String get exitDialogConfirm => 'बंद करा';

  @override
  String get exitDialogCancel => 'रद्द करा';

  @override
  String get profileShareApp => 'Share App';

  @override
  String get profileShareAppMessage =>
      'Check out WebroFM - your go-to app for streaming shows and podcasts!';
}
