// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'वेबरोएफएम';

  @override
  String get splashLoading => 'लोड हो रहा है...';

  @override
  String get welcomeTitle => 'वेबरोएफएम में आपका स्वागत है';

  @override
  String get welcomeSubtitle => 'ऐसी कहानियाँ खोजें जो आपको हिला दें';

  @override
  String get welcomeGetStarted => 'शुरू करें';

  @override
  String get welcomeContinueAsGuest => 'अतिथि के रूप में जारी रखें';

  @override
  String get loginSearchCountries => 'देश खोजें';

  @override
  String get loginInvalidPhone => 'कृपया एक वैध फ़ोन नंबर दर्ज करें';

  @override
  String get loginRateLimitTitle => 'दर सीमा समाप्त';

  @override
  String get loginRateLimitContent =>
      'बहुत अधिक ओटीपी प्रयास। कृपया 1 घंटे के बाद पुनः प्रयास करें।';

  @override
  String get loginOk => 'ठीक है';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'इस घंटे केवल $remaining प्रयास शेष';
  }

  @override
  String get loginTitle => 'जारी रखने के लिए लॉगिन करें';

  @override
  String get loginSubtitle => 'शुरू करने के लिए अपना फ़ोन नंबर दर्ज करें';

  @override
  String get loginPhoneHint => '(555) 000-0000';

  @override
  String get loginIAgreeTo => 'मैं सहमत हूँ ';

  @override
  String get loginTermsOfUse => 'उपयोग की शर्तें';

  @override
  String get loginAnd => ' और ';

  @override
  String get loginPrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get loginSendOtp => 'ओटीपी भेजें';

  @override
  String get loginContinueAsGuest => 'अतिथि के रूप में जारी रखें';

  @override
  String get otpEnterCompleteCode => 'कृपया पूरा 6-अंकीय कोड दर्ज करें';

  @override
  String get otpTitle => 'अपना नंबर सत्यापित करें';

  @override
  String get otpSubtitle => 'इस पर भेजा गया कोड दर्ज करें';

  @override
  String get otpVerifyAndContinue => 'सत्यापित करें और जारी रखें';

  @override
  String get otpDidntReceive => 'कोड प्राप्त नहीं हुआ? ';

  @override
  String get otpResend => 'पुनः ओटीपी भेजें';

  @override
  String get completeProfileTitle => 'अपनी प्रोफ़ाइल पूरी करें';

  @override
  String get completeProfileSubtitle =>
      'अपने अनुभव को वैयक्तिकृत करने में हमारी सहायता करें';

  @override
  String get completeProfileBasicInfo => 'मूल जानकारी';

  @override
  String get completeProfileFullName => 'पूरा नाम *';

  @override
  String get completeProfileNameHint => 'जॉन डो';

  @override
  String get completeProfileEmail => 'ईमेल पता';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'लिंग *';

  @override
  String get completeProfileDateOfBirth => 'जन्म तिथि';

  @override
  String get completeProfileDobHint => 'अपनी जन्म तिथि चुनें';

  @override
  String get completeProfileMale => 'पुरुष';

  @override
  String get completeProfileFemale => 'महिला';

  @override
  String get completeProfileOther => 'अन्य';

  @override
  String get completeProfileError => 'कृपया अपना नाम दर्ज करें और लिंग चुनें';

  @override
  String get completeProfileSkip => 'छोड़ें';

  @override
  String get completeProfileContinue => 'जारी रखें';

  @override
  String get interestTitle => 'अपनी रुचियाँ चुनें';

  @override
  String get interestSubtitle =>
      'वैयक्तिकृत अनुशंसाएँ प्राप्त करने के लिए श्रेणियाँ चुनें';

  @override
  String get interestSectionHeader => 'अपनी रुचियाँ चुनें';

  @override
  String get interestTapToSelect => 'चुनने के लिए टैप करें';

  @override
  String get interestContinue => 'वेबरोएफएम पर जारी रखें';

  @override
  String get interestSkip => 'छोड़ें';

  @override
  String get registrationTitle => 'अपने बारे में बताएं';

  @override
  String get registrationSubtitle =>
      'अपने अनुभव को वैयक्तिकृत करने में हमारी सहायता करें';

  @override
  String get registrationPersonalInfo => 'व्यक्तिगत जानकारी';

  @override
  String get registrationFullName => 'पूरा नाम';

  @override
  String get registrationNameHint => 'जॉन डो';

  @override
  String get registrationEmail => 'ईमेल पता';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'जन्म तिथि';

  @override
  String get registrationDobHint => 'अपनी जन्म तिथि चुनें';

  @override
  String get registrationInterestsHeader => 'अपनी रुचियाँ चुनें';

  @override
  String get registrationInterestsSubtitle => 'अपनी पसंदीदा श्रेणियाँ चुनें';

  @override
  String get registrationContinue => 'वेबरोएफएम पर जारी रखें';

  @override
  String get registrationNameError => 'कृपया अपना नाम दर्ज करें';

  @override
  String get homeContinueWatching => 'देखना जारी रखें';

  @override
  String get homeContinueListening => 'सुनना जारी रखें';

  @override
  String get homeResume => 'जारी रखें';

  @override
  String get homeNewArrivals => 'नए आगमन';

  @override
  String get homeSeeAll => 'सभी देखें';

  @override
  String get homePopularNow => 'अब लोकप्रिय';

  @override
  String get homeNoShows => 'कोई शो उपलब्ध नहीं';

  @override
  String get showDetailFailed => 'लोड करने में विफल';

  @override
  String get showDetailNotFound => 'शो नहीं मिला';

  @override
  String showDetailShareText(Object title) {
    return 'वेबरोएफएम पर $title देखें!';
  }

  @override
  String get showDetailDownloadStarted => 'डाउनलोड शुरू हुआ';

  @override
  String get showDetailNoDescription => 'कोई विवरण उपलब्ध नहीं।';

  @override
  String get showDetailReadLess => 'कम पढ़ें';

  @override
  String get showDetailReadMore => 'और पढ़ें';

  @override
  String get showDetailPlayLatest => 'नवीनतम एपिसोड चलाएं';

  @override
  String get showDetailEpisodes => 'एपिसोड';

  @override
  String get showDetailNoEpisodes => 'कोई एपिसोड उपलब्ध नहीं';

  @override
  String get showDetailMoreLikeThis => 'समान और दिखाएं';

  @override
  String get videoPlayerNoAudio => 'इस एपिसोड के लिए कोई ऑडियो उपलब्ध नहीं';

  @override
  String get videoPlayerLoading => 'वीडियो लोड हो रहा है...';

  @override
  String get videoPlayerNowPlaying => 'अब चल रहा है';

  @override
  String get videoPlayerPaused => 'रोका गया';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'प्लेबैक में त्रुटि: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'वीडियो प्लेयर';

  @override
  String get videoPlayerNext => 'अगला';

  @override
  String get videoPlayerAudio => 'ऑडियो';

  @override
  String get videoPlayerVideo => 'वीडियो';

  @override
  String get showCardNew => 'नया';

  @override
  String get searchHint => 'शो, एपिसोड खोजें...';

  @override
  String get searchTrending => 'ट्रेंडिंग खोजें';

  @override
  String get searchSuggested => 'आपके लिए सुझाव';

  @override
  String get searchError => 'कुछ गलत हो गया';

  @override
  String get searchNoResults => 'कोई परिणाम नहीं मिला';

  @override
  String get searchNoResultsSubtitle => 'अपने खोज शब्दों को बदलकर देखें';

  @override
  String get categoriesTitle => 'श्रेणियाँ देखें';

  @override
  String categoriesShowCount(Object count) {
    return '$count शो';
  }

  @override
  String get categoryDetailFailed => 'लोड करने में विफल';

  @override
  String get categoryDetailLoadMore => 'और लोड करें';

  @override
  String get categoryDetailSortBy => 'क्रमबद्ध करें';

  @override
  String get categoryDetailPopular => 'लोकप्रिय';

  @override
  String get categoryDetailNewest => 'नवीनतम';

  @override
  String get categoryDetailTopRated => 'शीर्ष रेटेड';

  @override
  String get myListTitle => 'मेरी सूची';

  @override
  String get myListSaved => 'सहेजे गए';

  @override
  String get myListWatchHistory => 'देखने का इतिहास';

  @override
  String get myListError => 'कुछ गलत हो गया';

  @override
  String get myListNoSaved => 'अभी तक कोई सहेजी गई वस्तु नहीं';

  @override
  String get myListNoHistory => 'अभी तक कोई देखने का इतिहास नहीं';

  @override
  String get myListNoSavedSubtitle => 'खोजना शुरू करें और अपनी पसंदीदा सहेजें';

  @override
  String get myListNoHistorySubtitle =>
      'आपके हाल ही में देखे गए शो यहाँ दिखाई देंगे';

  @override
  String get myListExploreShows => 'शो खोजें';

  @override
  String get myListRemoved => 'मेरी सूची से हटा दिया गया';

  @override
  String get myListLoginTitle => 'अपने सहेजे गए शो देखने के लिए लॉगिन करें';

  @override
  String get myListLoginSubtitle =>
      'अपने पसंदीदा शो सहेजें और उन्हें कभी भी एक्सेस करें';

  @override
  String get profileTitle => 'प्रोफ़ाइल';

  @override
  String get profileUser => 'उपयोगकर्ता';

  @override
  String get profileNoPhone => 'कोई फ़ोन नहीं';

  @override
  String get profileEditProfile => 'प्रोफ़ाइल संपादित करें';

  @override
  String get profileYourInterests => 'आपकी रुचियाँ';

  @override
  String get profileNoCategories => 'कोई श्रेणी चयनित नहीं';

  @override
  String get profileDobLabel => 'जन्म तिथि';

  @override
  String get profileNotLoggedIn => 'आप लॉगिन नहीं हैं';

  @override
  String get profileNotLoggedInSubtitle =>
      'अपनी प्रोफ़ाइल, डाउनलोड और वैयक्तिकृत अनुशंसाओं तक पहुँचने के लिए साइन इन करें।';

  @override
  String get profileLogin => 'लॉगिन';

  @override
  String get profileCollaboration => 'सहयोग';

  @override
  String get profileSettings => 'सेटिंग्स और प्राथमिकताएँ';

  @override
  String get profileMyDownloads => 'मेरे डाउनलोड';

  @override
  String get profileTermsOfUse => 'उपयोग की शर्तें';

  @override
  String get profilePrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get profileHelpFaq => 'सहायता और अक्सर पूछे जाने वाले प्रश्न';

  @override
  String get profileContactUs => 'संपर्क करें';

  @override
  String get profileLogout => 'लॉगआउट';

  @override
  String get profileLogoutTitle => 'लॉगआउट';

  @override
  String get profileLogoutConfirm => 'क्या आप वाकई लॉगआउट करना चाहते हैं?';

  @override
  String get profileCancel => 'रद्द करें';

  @override
  String get editProfileTitle => 'प्रोफ़ाइल संपादित करें';

  @override
  String get editProfileTapToChangePhoto => 'फ़ोटो बदलने के लिए टैप करें';

  @override
  String get editProfileFullName => 'पूरा नाम';

  @override
  String get editProfileNameRequired => 'नाम आवश्यक है';

  @override
  String get editProfileEmail => 'ईमेल';

  @override
  String get editProfileEmailRequired => 'ईमेल आवश्यक है';

  @override
  String get editProfileInvalidEmail => 'अमान्य ईमेल';

  @override
  String get editProfileDob => 'जन्म तिथि';

  @override
  String get editProfilePhone => 'फ़ोन';

  @override
  String get editProfileCategoryPreferences => 'श्रेणी प्राथमिकताएँ';

  @override
  String get editProfileAddMore => 'और जोड़ें';

  @override
  String get editProfileAddCategory => 'श्रेणी जोड़ें';

  @override
  String get editProfileSaveChanges => 'परिवर्तन सहेजें';

  @override
  String get editProfileUserDataNotAvailable => 'उपयोगकर्ता डेटा उपलब्ध नहीं';

  @override
  String get editProfileUpdatedSuccess => 'प्रोफ़ाइल सफलतापूर्वक अपडेट हुई';

  @override
  String get editProfileCancel => 'रद्द करें';

  @override
  String get editProfileSubmit => 'जमा करें';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsGeneral => 'सामान्य';

  @override
  String get settingsAppLanguage => 'ऐप भाषा';

  @override
  String get settingsSubtitleLanguage => 'उपशीर्षक भाषा';

  @override
  String get settingsAppearancePlayback => 'दृश्य और प्लेबैक';

  @override
  String get settingsColorTheme => 'रंग थीम';

  @override
  String get settingsLight => 'लाइट';

  @override
  String get settingsDark => 'डार्क';

  @override
  String get settingsSystem => 'सिस्टम';

  @override
  String get settingsAutoplayNext => 'अगला एपिसोड स्वचालित रूप से चलाएं';

  @override
  String get settingsDownloadQuality => 'डाउनलोड गुणवत्ता';

  @override
  String get settingsLow => 'निम्न';

  @override
  String get settingsMedium => 'मध्यम';

  @override
  String get settingsHigh => 'उच्च';

  @override
  String get settingsVeryHigh => 'बहुत उच्च';

  @override
  String get settingsAccountPrivacy => 'खाता और गोपनीयता';

  @override
  String get settingsAgeRestriction => 'आयु/सामग्री प्रतिबंध';

  @override
  String get settingsNotifications => 'सूचनाएँ';

  @override
  String get settingsDangerZone => 'खतरा क्षेत्र';

  @override
  String get settingsDeleteAccount => 'मेरा खाता हटाएं';

  @override
  String get deleteAccountTitle => 'खाता हटाएं';

  @override
  String get deleteAccountHeader => 'मेरा खाता हटाएं';

  @override
  String get deleteAccountWarning =>
      'यह क्रिया पूर्ववत नहीं की जा सकती। आपका सारा डेटा स्थायी रूप से हटा दिया जाएगा।';

  @override
  String get deleteAccountDataLoss => 'निम्नलिखित डेटा खो जाएगा:';

  @override
  String get deleteAccountReason => 'हटाने का कारण';

  @override
  String get deleteAccountSelectReason => 'एक कारण चुनें';

  @override
  String get deleteAccountNotUsing => 'मैं अब इस ऐप का उपयोग नहीं करता';

  @override
  String get deleteAccountTooExpensive => 'बहुत महँगा';

  @override
  String get deleteAccountPrivacy => 'गोपनीयता संबंधी चिंताएँ';

  @override
  String get deleteAccountTechnicalIssues => 'तकनीकी समस्याएँ';

  @override
  String get deleteAccountFoundAlternative => 'बेहतर विकल्प मिल गया';

  @override
  String get deleteAccountOther => 'अन्य';

  @override
  String get deleteAccountProfileSettings => 'प्रोफ़ाइल और सेटिंग्स';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'आपकी प्रोफ़ाइल जानकारी, प्राथमिकताएँ और ऐप सेटिंग्स स्थायी रूप से हटा दी जाएंगी।';

  @override
  String get deleteAccountListeningHistory => 'सुनने का इतिहास';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'आपका सुनने का इतिहास, खोज इतिहास और गतिविधि लॉग मिटा दिए जाएंगे।';

  @override
  String get deleteAccountSavedItems => 'सहेजी गई वस्तुएँ';

  @override
  String get deleteAccountSavedItemsDesc =>
      'आपकी सभी प्लेलिस्ट, पसंदीदा और सहेजी गई सामग्री हटा दी जाएगी।';

  @override
  String get deleteAccountSubscriptions => 'सदस्यताएँ';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'कोई भी सक्रिय सदस्यता रद्द कर दी जाएगी और प्रीमियम पहुँच समाप्त हो जाएगी।';

  @override
  String get deleteAccountDelete => 'मेरा खाता हटाएं';

  @override
  String get deleteAccountCancel => 'रद्द करें';

  @override
  String get deleteAccountOtpTitle => 'हटाने की पुष्टि करें';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return '$phone पर भेजा गया ओटीपी दर्ज करें';
  }

  @override
  String get deleteAccountOtpConfirm => 'हटाने की पुष्टि करें';

  @override
  String get deleteAccountOtpResend => 'पुनः ओटीपी भेजें';

  @override
  String get deleteAccountOtpResent => 'ओटीपी सफलतापूर्वक पुनः भेजा गया';

  @override
  String get accountDeletedTitle => 'खाता हटा दिया गया';

  @override
  String get accountDeletedMessage =>
      'आपका खाता स्थायी रूप से हटा दिया गया है।\nआपको जाते देखकर दुख हुआ।';

  @override
  String get accountDeletedBackToHome => 'होम पर वापस जाएं';

  @override
  String get contactUsTitle => 'संपर्क करें';

  @override
  String get contactUsSubtitle => 'हमें आपसे सुनना अच्छा लगेगा';

  @override
  String get contactUsSubject => 'विषय';

  @override
  String get contactUsMessageLabel => 'संदेश';

  @override
  String get contactUsMessageHint => 'अपनी समस्या या प्रश्न का वर्णन करें...';

  @override
  String get contactUsAddAttachment => 'अटैचमेंट जोड़ें';

  @override
  String get contactUsQuickContact => 'त्वरित संपर्क';

  @override
  String get contactUsEmail => 'ईमेल';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'कॉल';

  @override
  String get contactUsCallValue => '+1 (555) 123-4567';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'हमसे बात करें';

  @override
  String get contactUsSend => 'संदेश भेजें';

  @override
  String get contactUsSending => 'भेजा जा रहा है...';

  @override
  String get contactUsNoMessage => 'कृपया एक संदेश दर्ज करें';

  @override
  String get contactUsSent => 'संदेश सफलतापूर्वक भेजा गया!';

  @override
  String get contactUsGeneralInquiry => 'सामान्य पूछताछ';

  @override
  String get contactUsTechnicalSupport => 'तकनीकी सहायता';

  @override
  String get contactUsAccountIssue => 'खाता समस्या';

  @override
  String get contactUsBillingQuestion => 'बिलिंग प्रश्न';

  @override
  String get contactUsFeatureRequest => 'सुविधा अनुरोध';

  @override
  String get contactUsBugReport => 'बग रिपोर्ट';

  @override
  String get helpFaqTitle => 'सहायता और अक्सर पूछे जाने वाले प्रश्न';

  @override
  String get helpFaqSearchHint => 'अक्सर पूछे जाने वाले प्रश्न खोजें...';

  @override
  String get helpFaqNoResults => 'कोई परिणाम नहीं मिला';

  @override
  String get helpFaqStillNeedHelp => 'अभी भी सहायता चाहिए?';

  @override
  String get helpFaqContactUs => 'संपर्क करें';

  @override
  String get helpFaqAll => 'सभी';

  @override
  String get helpFaqAccount => 'खाता';

  @override
  String get helpFaqPlayback => 'प्लेबैक';

  @override
  String get helpFaqBilling => 'बिलिंग';

  @override
  String get helpFaqOther => 'अन्य';

  @override
  String get helpFaq1Q => 'मैं अपना पासवर्ड कैसे रीसेट करूं?';

  @override
  String get helpFaq1A =>
      'आप लॉगिन स्क्रीन से \'पासवर्ड भूल गए\' पर टैप करके अपना पासवर्ड रीसेट कर सकते हैं। अपने पंजीकृत ईमेल या फ़ोन पर भेजे गए निर्देशों का पालन करें।';

  @override
  String get helpFaq2Q => 'क्या मैं अपनी सदस्यता योजना बदल सकता हूँ?';

  @override
  String get helpFaq2A =>
      'हाँ, सेटिंग्स > सदस्यता पर जाकर अपनी वर्तमान योजना देखें और बदलें। परिवर्तन अगले बिलिंग चक्र से प्रभावी होंगे।';

  @override
  String get helpFaq3Q => 'मैं अपना खाता कैसे हटाऊं?';

  @override
  String get helpFaq3A =>
      'सेटिंग्स > खतरा क्षेत्र > मेरा खाता हटाएं पर जाएं। अपना खाता स्थायी रूप से हटाने के लिए सत्यापन चरणों का पालन करें।';

  @override
  String get helpFaq4Q => 'मेरी डाउनलोड की गई फ़ाइलें कहाँ हैं?';

  @override
  String get helpFaq4A =>
      'डाउनलोड किए गए एपिसोड ऐप में मेरे डाउनलोड के अंतर्गत संग्रहीत होते हैं। वे कभी भी ऑफलाइन सुनने के लिए उपलब्ध होते हैं।';

  @override
  String get helpFaq5Q => 'मैं अपनी प्रोफ़ाइल जानकारी कैसे अपडेट करूं?';

  @override
  String get helpFaq5A =>
      'प्रोफ़ाइल > प्रोफ़ाइल संपादित करें पर जाकर अपना नाम, ईमेल, जन्म तिथि और प्रोफ़ाइल फ़ोटो अपडेट करें।';

  @override
  String get helpFaq6Q => 'मेरा ऑडियो क्यों नहीं चल रहा है?';

  @override
  String get helpFaq6A =>
      'अपना इंटरनेट कनेक्शन जांचें और ऐप को पुनः आरंभ करने का प्रयास करें। यदि समस्या बनी रहती है, तो सेटिंग्स से ऐप कैश साफ़ करने का प्रयास करें।';

  @override
  String get helpFaq7Q => 'मुझे रिफंड कैसे मिलेगा?';

  @override
  String get helpFaq7A =>
      'अपने लेन-देन विवरण के साथ support@webrofm.com पर हमारी सहायता टीम से संपर्क करें। हम 5-7 व्यावसायिक दिनों के भीतर आपका रिफंड संसाधित करेंगे।';

  @override
  String get helpFaq8Q => 'मैं बग की रिपोर्ट कैसे करूं?';

  @override
  String get helpFaq8A =>
      'आप सेटिंग्स में संपर्क करें अनुभाग के माध्यम से बग की रिपोर्ट कर सकते हैं। कृपया समस्या को पुनः उत्पन्न करने के चरण और अपनी डिवाइस की जानकारी शामिल करें।';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get privacyPolicyLastUpdated => 'अंतिम अपडेट: 22 जुलाई, 2026';

  @override
  String get privacyPolicyCollection => 'संग्रह';

  @override
  String get privacyPolicyCollectionTitle => 'हम कौन सी जानकारी एकत्र करते हैं';

  @override
  String get privacyPolicyCollectionText =>
      'हम वह जानकारी एकत्र करते हैं जो आप सीधे प्रदान करते हैं, जैसे आपका नाम, ईमेल पता, फ़ोन नंबर और प्रोफ़ाइल फ़ोटो। जब आप हमारी सेवाओं का उपयोग करते हैं तो हम स्वचालित रूप से कुछ जानकारी भी एकत्र करते हैं, जिसमें डिवाइस जानकारी, उपयोग डेटा और सुनने की प्राथमिकताएँ शामिल हैं।';

  @override
  String get privacyPolicyUsage => 'उपयोग';

  @override
  String get privacyPolicyUsageTitle =>
      'हम आपकी जानकारी का उपयोग कैसे करते हैं';

  @override
  String get privacyPolicyUsageText =>
      'हम अपनी स्ट्रीमिंग सेवाएँ प्रदान करने, बनाए रखने और सुधारने, आपके अनुभव को वैयक्तिकृत करने, आपको अपडेट और प्रचार सामग्री भेजने और अपने प्लेटफ़ॉर्म की सुरक्षा सुनिश्चित करने के लिए एकत्रित जानकारी का उपयोग करते हैं।';

  @override
  String get privacyPolicySharing => 'साझाकरण';

  @override
  String get privacyPolicySharingTitle => 'जानकारी साझाकरण';

  @override
  String get privacyPolicySharingText =>
      'हम आपकी व्यक्तिगत जानकारी नहीं बेचते हैं। हम आपका डेटा विश्वसनीय सेवा प्रदाताओं के साथ साझा कर सकते हैं जो हमारे प्लेटफ़ॉर्म के संचालन में हमारी सहायता करते हैं, जो सख्त गोपनीयता समझौतों के अधीन है।';

  @override
  String get privacyPolicySecurity => 'सुरक्षा';

  @override
  String get privacyPolicySecurityTitle => 'डेटा सुरक्षा';

  @override
  String get privacyPolicySecurityText =>
      'हम आपकी व्यक्तिगत जानकारी की सुरक्षा के लिए उद्योग-मानक सुरक्षा उपायों को लागू करते हैं, जिसमें ट्रांज़िट और आराम दोनों में एन्क्रिप्शन, नियमित सुरक्षा ऑडिट और पहुँच नियंत्रण शामिल हैं।';

  @override
  String get privacyPolicyRights => 'अधिकार';

  @override
  String get privacyPolicyRightsTitle => 'आपके अधिकार और विकल्प';

  @override
  String get privacyPolicyRightsText =>
      'आपको किसी भी समय अपनी खाता सेटिंग्स के माध्यम से अपनी व्यक्तिगत जानकारी तक पहुँचने, अपडेट करने या हटाने का अधिकार है। आप किसी भी गोपनीयता-संबंधी अनुरोध के लिए सीधे हमसे संपर्क भी कर सकते हैं।';

  @override
  String get termsOfUseTitle => 'उपयोग की शर्तें';

  @override
  String get termsOfUseUsage => 'उपयोग';

  @override
  String get termsOfUseUsageTitle => 'उपयोग दिशानिर्देश';

  @override
  String get termsOfUseUsageText =>
      'वेबरोएफएम का उपयोग करके, आप केवल कानूनी उद्देश्यों के लिए सेवा का उपयोग करने के लिए सहमत होते हैं। आप पूर्व लिखित सहमति के बिना हमारे प्लेटफ़ॉर्म से किसी भी सामग्री को संशोधित, वितरित या पुन: प्रस्तुत नहीं कर सकते हैं। हम इन शर्तों के उल्लंघन के लिए पहुँच को निलंबित या समाप्त करने का अधिकार सुरक्षित रखते हैं।';

  @override
  String get termsOfUseAccounts => 'खाते';

  @override
  String get termsOfUseAccountsTitle => 'उपयोगकर्ता खाते';

  @override
  String get termsOfUseAccountsText =>
      'आप अपने खाता क्रेडेंशियल्स की गोपनीयता बनाए रखने के लिए जिम्मेदार हैं। खाता बनाते समय आपको सटीक और पूर्ण जानकारी प्रदान करनी होगी। आपको अपने खाते के किसी भी अनधिकृत उपयोग की तुरंत हमें सूचित करना होगा।';

  @override
  String get termsOfUseContent => 'सामग्री';

  @override
  String get termsOfUseContentTitle => 'सामग्री और बौद्धिक संपदा';

  @override
  String get termsOfUseContentText =>
      'वेबरोएफएम पर उपलब्ध सभी सामग्री, जिसमें ऑडियो स्ट्रीम, वीडियो और कलाकृति शामिल हैं, कॉपीराइट और बौद्धिक संपदा कानूनों द्वारा संरक्षित है। उपयोगकर्ता स्पष्ट अनुमति के बिना सामग्री डाउनलोड, रिकॉर्ड या पुनर्वितरित नहीं कर सकते हैं।';

  @override
  String get termsOfUseLiability => 'दायित्व';

  @override
  String get termsOfUseLiabilityTitle => 'दायित्व की सीमा';

  @override
  String get termsOfUseLiabilityText =>
      'वेबरोएफएम सेवा के आपके उपयोग से उत्पन्न होने वाले किसी भी अप्रत्यक्ष, आकस्मिक या परिणामी क्षति के लिए उत्तरदायी नहीं होगा। हमारा कुल दायित्व पिछले 12 महीनों में आपके द्वारा सेवा के लिए भुगतान की गई राशि से अधिक नहीं होगा।';

  @override
  String get notificationsTitle => 'सूचनाएँ';

  @override
  String get notificationsEmptyTitle => 'कोई सूचना नहीं';

  @override
  String get notificationsEmptySubtitle =>
      'आप सबसे अपडेटेड हैं! अपडेट के लिए बाद में पुनः जाँच करें।';

  @override
  String get downloadsTitle => 'मेरे डाउनलोड';

  @override
  String get downloadsEmptyTitle => 'अभी तक कोई डाउनलोड नहीं';

  @override
  String get downloadsEmptySubtitle =>
      'आपके डाउनलोड किए गए एपिसोड यहाँ दिखाई देंगे ताकि आप कभी भी ऑफलाइन सुन सकें।';

  @override
  String get downloadsBrowseShows => 'शो ब्राउज़ करें';

  @override
  String get premiumTitle => 'प्रीमियम';

  @override
  String get collabTitle => 'सहयोग';

  @override
  String get collabMyStories => 'मेरी कहानियाँ';

  @override
  String get collabMySponsorships => 'मेरी प्रायोजन';

  @override
  String get collabNoStories => 'अभी तक कोई कहानी सबमिट नहीं की गई।';

  @override
  String get collabNoSponsorships => 'अभी तक कोई प्रायोजन सबमिट नहीं किया गया।';

  @override
  String get collabApproved => 'स्वीकृत';

  @override
  String get collabRejected => 'अस्वीकृत';

  @override
  String get collabReviewing => 'समीक्षाधीन';

  @override
  String get collabPending => 'लंबित';

  @override
  String get collabShareYourStory => 'अपनी कहानी साझा करें';

  @override
  String get collabShareYourStorySubtitle =>
      'फीचर होने के अवसर के लिए अपनी मूल कहानी सबमिट करें।';

  @override
  String get collabSubmitStory => 'कहानी सबमिट करें';

  @override
  String get collabSponsorshipAd => 'प्रायोजन / विज्ञापन';

  @override
  String get collabSponsorshipSubtitle =>
      'प्रायोजन के लिए अपना ब्रांड या व्यवसाय सबमिट करें।';

  @override
  String get collabSubmitAd => 'विज्ञापन सबमिट करें';

  @override
  String get collabDialogStoryTitle => 'अपनी कहानी सबमिट करें';

  @override
  String get collabStoryTitle => 'कहानी का शीर्षक';

  @override
  String get collabStoryTitleHint => 'अपनी कहानी का शीर्षक दर्ज करें';

  @override
  String get collabStoryContent => 'कहानी की सामग्री';

  @override
  String get collabStoryContentHint => 'अपनी कहानी यहाँ लिखें...';

  @override
  String get collabCancel => 'रद्द करें';

  @override
  String get collabSubmit => 'सबमिट करें';

  @override
  String get collabDialogAdTitle => 'विज्ञापन सबमिट करें';

  @override
  String get collabBrandName => 'ब्रांड नाम';

  @override
  String get collabBrandNameHint => 'आपका ब्रांड/व्यवसाय नाम';

  @override
  String get collabDescription => 'विवरण';

  @override
  String get collabDescriptionHint => 'अपना विज्ञापन बताएं';

  @override
  String get collabTargetUrl => 'लक्ष्य URL (वैकल्पिक)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'छवि चयनित';

  @override
  String get collabUploadAdVisual => 'विज्ञापन दृश्य अपलोड करें';

  @override
  String get collabStatusRunning => 'चल रहा है';

  @override
  String get collabStatusExpired => 'समाप्त';

  @override
  String get languagesAppLanguage => 'ऐप भाषा';

  @override
  String get languagesSubtitleLanguage => 'उपशीर्षक भाषा';

  @override
  String get bottomNavHome => 'होम';

  @override
  String get bottomNavSearch => 'खोजें';

  @override
  String get bottomNavCategories => 'श्रेणियाँ';

  @override
  String get bottomNavMyList => 'मेरी सूची';

  @override
  String get bottomNavProfile => 'प्रोफ़ाइल';

  @override
  String get networkOffline => 'ऑफलाइन मोड';

  @override
  String get networkDownload => 'डाउनलोड मोड';

  @override
  String get networkOfflineSnackbar =>
      'ऑफलाइन मोड चालू\nडाउनलोड सामग्री देखना शुरू करें';

  @override
  String get networkDismiss => 'खारिज करें';

  @override
  String get loadingPleaseWait => 'कृपया प्रतीक्षा करें...';

  @override
  String get commonRetry => 'पुनः प्रयास करें';

  @override
  String get guestTimerTitle => 'मुफ्त समय समाप्त!';

  @override
  String get guestTimerBody =>
      'सभी सामग्री एक्सेस करने के लिए लॉगिन करें।\nयह आपके लिए मुफ्त है!';

  @override
  String get freeLimitTitle => 'मुफ्त सीमा समाप्त';

  @override
  String get freeLimitBody =>
      'आपने अपनी 1 मिनट की मुफ्त सुनने की सीमा उपयोग कर ली है। पूरा एपिसोड सुनना जारी रखने के लिए कृपया लॉगिन करें या साइन अप करें।';

  @override
  String get guestTimerLater => 'बाद में';

  @override
  String get guestTimerLogin => 'लॉगिन / साइन अप';

  @override
  String get errorDataError => 'डेटा त्रुटि हुई। कृपया पुनः प्रयास करें।';

  @override
  String get errorInvalidData => 'अमान्य डेटा प्रारूप प्राप्त हुआ।';

  @override
  String get errorUnexpected => 'एक अप्रत्याशित त्रुटि हुई।';

  @override
  String get errorTimeout =>
      'कनेक्शन टाइमआउट। कृपया अपना इंटरनेट कनेक्शन जांचें।';

  @override
  String get errorNoInternet =>
      'कोई इंटरनेट कनेक्शन नहीं। कृपया अपनी नेटवर्क सेटिंग्स जांचें।';

  @override
  String get errorCancelled => 'अनुरोध रद्द कर दिया गया।';

  @override
  String get errorSecurity =>
      'कनेक्शन सुरक्षा त्रुटि। कृपया अपना ऐप अपडेट करें।';

  @override
  String get errorNetwork => 'एक अप्रत्याशित नेटवर्क त्रुटि हुई।';

  @override
  String get errorInvalidRequest =>
      'अमान्य अनुरोध। कृपया अपना इनपुट सत्यापित करें।';

  @override
  String get errorSessionExpired =>
      'सत्र समाप्त हो गया। कृपया पुनः साइन इन करें।';

  @override
  String get errorPermissionDenied =>
      'आपके पास यह क्रिया करने की अनुमति नहीं है।';

  @override
  String get errorNotFound => 'अनुरोधित संसाधन नहीं मिला।';

  @override
  String get errorConflict => 'विरोध पाया गया। संसाधन अपडेट किया जा सकता है।';

  @override
  String get errorValidationFailed => 'सत्यापन विफल। कृपया अपना इनपुट जांचें।';

  @override
  String get errorTooManyRequests =>
      'बहुत अधिक अनुरोध। कृपया बाद में पुनः प्रयास करें।';

  @override
  String get errorServer => 'सर्वर त्रुटि। कृपया बाद में पुनः प्रयास करें।';

  @override
  String get errorServiceUnavailable =>
      'सेवा अस्थायी रूप से अनुपलब्ध। कृपया पुनः प्रयास करें।';

  @override
  String get errorUnderMaintenance =>
      'सेवा रखरखाव के अंतर्गत है। कृपया बाद में पुनः प्रयास करें।';

  @override
  String errorGeneric(Object code) {
    return 'कुछ गलत हो गया। (त्रुटि $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'कनेक्शन टाइमआउट। कृपया पुनः प्रयास करें।';

  @override
  String get errorNoConnection => 'कोई इंटरनेट कनेक्शन नहीं।';

  @override
  String errorServerWithCode(Object code) {
    return 'सर्वर त्रुटि ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get pageNotFound => 'पेज नहीं मिला';

  @override
  String get pageNotFoundMessage =>
      'आप जिस पेज की तलाश कर रहे हैं वह मौजूद नहीं है।';

  @override
  String get goHome => 'होम पर जाएं';

  @override
  String get relativeTimeJustNow => 'अभी अभी';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '$minutes मि पहले';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '$hours घं पहले';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '$days दि पहले';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '$weeks सप्त पहले';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '$months मा पहले';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '$years व पहले';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return '$minutes मि में';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return '$hours घं में';
  }

  @override
  String relativeTimeInDay(Object days) {
    return '$days दि में';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '$hoursघं $minutesमि';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '$minutesमि $secondsसे';
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
    return '$countमि';
  }

  @override
  String countViewsK(Object count) {
    return '$countह';
  }

  @override
  String episodeCount(Object count) {
    return '$count एपि';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'S$season E$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'सीज़न $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return '$language में कोई एपिसोड उपलब्ध नहीं';
  }

  @override
  String get contentDisclaimer =>
      'अस्वीकरण: सभी ऑडियो और वीडियो सामग्री पूरी तरह काल्पनिक है और केवल मनोरंजन के लिए बनाई गई है। यह किसी वास्तविक व्यक्ति, कहानी या घटना का चित्रण, प्रतिनिधित्व या संदर्भ नहीं देती।';

  @override
  String get categoryDrama => 'ड्रामा';

  @override
  String get categoryComedy => 'कॉमेडी';

  @override
  String get categoryPodcasts => 'पॉडकास्ट';

  @override
  String get categoryMusic => 'संगीत';

  @override
  String get categoryKids => 'बच्चे';

  @override
  String get categoryDevotional => 'भक्ति';

  @override
  String get categoryNews => 'समाचार';

  @override
  String get categorySports => 'खेल';

  @override
  String get categoryTechnology => 'प्रौद्योगिकी';

  @override
  String get categoryEducation => 'शिक्षा';

  @override
  String get categoryBusiness => 'व्यवसाय';

  @override
  String get categoryHealth => 'स्वास्थ्य';

  @override
  String get categoryScience => 'विज्ञान';

  @override
  String get categoryArts => 'कला';

  @override
  String get trendingDramaSeries => 'ड्रामा सीरीज़';

  @override
  String get trendingComedyShows => 'कॉमेडी शो';

  @override
  String get trendingPodcasts => 'पॉडकास्ट';

  @override
  String get trendingMusicAlbums => 'संगीत एल्बम';

  @override
  String get trendingKidsStories => 'बच्चों की कहानियाँ';

  @override
  String get trendingDevotional => 'भक्ति';

  @override
  String get trendingNewsToday => 'आज के समाचार';

  @override
  String get trendingSportsHighlights => 'खेल हाइलाइट्स';

  @override
  String get languageEnglish => 'अंग्रेज़ी';

  @override
  String get languageHindi => 'हिन्दी';

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
  String get languageTamil => 'तमिल';

  @override
  String get languageTelugu => 'तेलुगु';

  @override
  String get languageKannada => 'कन्नड़';

  @override
  String get languageMalayalam => 'मलयालम';

  @override
  String get languageUrdu => 'उर्दू';

  @override
  String get pressBackToExit => 'बाहर जाने के लिए फिर से पीछे दबाएं';

  @override
  String get exitDialogTitle => 'ऐप बंद करें?';

  @override
  String get exitDialogBody => 'क्या आप वाकई ऐप बंद करना चाहते हैं?';

  @override
  String get exitDialogConfirm => 'बंद करें';

  @override
  String get exitDialogCancel => 'रद्द करें';

  @override
  String get profileShareApp => 'ऐप शेयर करें';

  @override
  String get profileShareAppMessage =>
      'WebroFM देखें - शो और पॉडकास्ट स्ट्रीमिंग के लिए आपका पसंदीदा ऐप!';
}
