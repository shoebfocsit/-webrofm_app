// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'WebroFM';

  @override
  String get splashLoading => 'లోడ్ అవుతోంది...';

  @override
  String get welcomeTitle => 'WebroFM కి స్వాగతం';

  @override
  String get welcomeSubtitle => 'మిమ్మల్ని కదిలించే కథలను కనుగొనండి';

  @override
  String get welcomeGetStarted => 'ప్రారంభించండి';

  @override
  String get welcomeContinueAsGuest => 'అతిథిగా కొనసాగండి';

  @override
  String get loginSearchCountries => 'దేశాలను శోధించండి';

  @override
  String get loginInvalidPhone => 'చెల్లుబాటు అయ్యే ఫోన్ నంబర్ను నమోదు చేయండి';

  @override
  String get loginRateLimitTitle => 'రేట్ పరిమితి చేరుకుంది';

  @override
  String get loginRateLimitContent =>
      'చాలా ఎక్కువ OTP ప్రయత్నాలు. దయచేసి 1 గంట తర్వాత మళ్లీ ప్రయత్నించండి.';

  @override
  String get loginOk => 'సరే';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'ఈ గంటలో $remaining ప్రయత్నం మాత్రమే మిగిలి ఉంది';
  }

  @override
  String get loginTitle => 'కొనసాగడానికి లాగిన్ చేయండి';

  @override
  String get loginSubtitle => 'ప్రారంభించడానికి మీ ఫోన్ నంబర్ను నమోదు చేయండి';

  @override
  String get loginPhoneHint => '(555) 000-0000';

  @override
  String get loginIAgreeTo => 'నేను దీనికి అంగీకరిస్తున్నాను ';

  @override
  String get loginTermsOfUse => 'వినియోగ నిబంధనలు';

  @override
  String get loginAnd => ' మరియు ';

  @override
  String get loginPrivacyPolicy => 'గోప్యతా విధానం';

  @override
  String get loginSendOtp => 'OTP పంపండి';

  @override
  String get loginContinueAsGuest => 'అతిథిగా కొనసాగండి';

  @override
  String get otpEnterCompleteCode =>
      'దయచేసి పూర్తి 6 అంకెల కోడ్ను నమోదు చేయండి';

  @override
  String get otpTitle => 'మీ నంబర్ను ధృవీకరించండి';

  @override
  String get otpSubtitle => 'దీనికి పంపిన కోడ్ను నమోదు చేయండి';

  @override
  String get otpVerifyAndContinue => 'ధృవీకరించండి & కొనసాగండి';

  @override
  String get otpDidntReceive => 'కోడ్ రాలేదా? ';

  @override
  String get otpResend => 'OTP మళ్లీ పంపు';

  @override
  String get completeProfileTitle => 'మీ ప్రొఫైల్ను పూర్తి చేయండి';

  @override
  String get completeProfileSubtitle =>
      'మీ అనుభవాన్ని వ్యక్తిగతీకరించడంలో మాకు సహాయపడండి';

  @override
  String get completeProfileBasicInfo => 'ప్రాథమిక సమాచారం';

  @override
  String get completeProfileFullName => 'పూర్తి పేరు *';

  @override
  String get completeProfileNameHint => 'జాన్ డో';

  @override
  String get completeProfileEmail => 'ఇమెయిల్ చిరునామా';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'లింగం *';

  @override
  String get completeProfileDateOfBirth => 'పుట్టిన తేదీ';

  @override
  String get completeProfileDobHint => 'మీ పుట్టిన తేదీని ఎంచుకోండి';

  @override
  String get completeProfileMale => 'పురుషుడు';

  @override
  String get completeProfileFemale => 'స్త్రీ';

  @override
  String get completeProfileOther => 'ఇతర';

  @override
  String get completeProfileError =>
      'దయచేసి మీ పేరును నమోదు చేసి లింగాన్ని ఎంచుకోండి';

  @override
  String get completeProfileSkip => 'దాటవేయి';

  @override
  String get completeProfileContinue => 'కొనసాగించు';

  @override
  String get interestTitle => 'మీ ఆసక్తులను ఎంచుకోండి';

  @override
  String get interestSubtitle =>
      'వ్యక్తిగతీకరించిన సిఫార్సుల కోసం మీరు ఆనందించే వర్గాలను ఎంచుకోండి';

  @override
  String get interestSectionHeader => 'మీ ఆసక్తులను ఎంచుకోండి';

  @override
  String get interestTapToSelect => 'ఎంచుకోవడానికి నొక్కండి';

  @override
  String get interestContinue => 'WebroFM కి కొనసాగండి';

  @override
  String get interestSkip => 'దాటవేయి';

  @override
  String get registrationTitle => 'మీ గురించి మాకు చెప్పండి';

  @override
  String get registrationSubtitle =>
      'మీ అనుభవాన్ని వ్యక్తిగతీకరించడంలో మాకు సహాయపడండి';

  @override
  String get registrationPersonalInfo => 'వ్యక్తిగత సమాచారం';

  @override
  String get registrationFullName => 'పూర్తి పేరు';

  @override
  String get registrationNameHint => 'జాన్ డో';

  @override
  String get registrationEmail => 'ఇమెయిల్ చిరునామా';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'పుట్టిన తేదీ';

  @override
  String get registrationDobHint => 'మీ పుట్టిన తేదీని ఎంచుకోండి';

  @override
  String get registrationInterestsHeader => 'మీ ఆసక్తులను ఎంచుకోండి';

  @override
  String get registrationInterestsSubtitle =>
      'మీరు ఆనందించే వర్గాలను ఎంచుకోండి';

  @override
  String get registrationContinue => 'WebroFM కి కొనసాగండి';

  @override
  String get registrationNameError => 'దయచేసి మీ పేరును నమోదు చేయండి';

  @override
  String get homeContinueWatching => 'చూస్తూ ఉండండి';

  @override
  String get homeContinueListening => 'వింటూ ఉండండి';

  @override
  String get homeResume => 'కొనసాగించు';

  @override
  String get homeNewArrivals => 'కొత్త రాకలు';

  @override
  String get homeSeeAll => 'అన్నీ చూడండి';

  @override
  String get homePopularNow => 'ఇప్పుడు ప్రముఖమైనవి';

  @override
  String get homeNoShows => 'షోలు అందుబాటులో లేవు';

  @override
  String get showDetailFailed => 'లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get showDetailNotFound => 'షో కనుగొనబడలేదు';

  @override
  String showDetailShareText(Object title) {
    return 'WebroFM లో $title ని చూడండి!';
  }

  @override
  String get showDetailDownloadStarted => 'డౌన్లోడ్ ప్రారంభమైంది';

  @override
  String get showDetailNoDescription => 'వివరణ అందుబాటులో లేదు.';

  @override
  String get showDetailReadLess => 'తక్కువ చదవండి';

  @override
  String get showDetailReadMore => 'మరింత చదవండి';

  @override
  String get showDetailPlayLatest => 'తాజా ఎపిసోడ్ ప్లే చేయండి';

  @override
  String get showDetailEpisodes => 'ఎపిసోడ్లు';

  @override
  String get showDetailNoEpisodes => 'ఎపిసోడ్లు అందుబాటులో లేవు';

  @override
  String get showDetailMoreLikeThis => 'ఇలాంటివి మరిన్ని';

  @override
  String get videoPlayerNoAudio => 'ఈ ఎపిసోడ్కు ఆడియో అందుబాటులో లేదు';

  @override
  String get videoPlayerLoading => 'వీడియో లోడ్ అవుతోంది...';

  @override
  String get videoPlayerNowPlaying => 'ఇప్పుడు ప్లే అవుతోంది';

  @override
  String get videoPlayerPaused => 'పాజ్ చేయబడింది';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'ప్లేబ్యాక్ లోపం: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'వీడియో ప్లేయర్';

  @override
  String get videoPlayerNext => 'తదుపరి';

  @override
  String get videoPlayerAudio => 'ఆడియో';

  @override
  String get videoPlayerVideo => 'వీడియో';

  @override
  String get showCardNew => 'కొత్త';

  @override
  String get searchHint => 'షోలు, ఎపిసోడ్లను శోధించండి...';

  @override
  String get searchTrending => 'ట్రెండింగ్ శోధనలు';

  @override
  String get searchSuggested => 'మీ కోసం సూచించబడినవి';

  @override
  String get searchError => 'ఏదో తప్పు జరిగింది';

  @override
  String get searchNoResults => 'ఫలితాలు కనుగొనబడలేదు';

  @override
  String get searchNoResultsSubtitle =>
      'మీ శోధన నిబంధనలను సర్దుబాటు చేయడానికి ప్రయత్నించండి';

  @override
  String get categoriesTitle => 'వర్గాలను అన్వేషించండి';

  @override
  String categoriesShowCount(Object count) {
    return '$count షోలు';
  }

  @override
  String get categoryDetailFailed => 'లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get categoryDetailLoadMore => 'మరింత లోడ్ చేయండి';

  @override
  String get categoryDetailSortBy => 'క్రమబద్ధీకరించు';

  @override
  String get categoryDetailPopular => 'ప్రముఖమైనవి';

  @override
  String get categoryDetailNewest => 'కొత్తవి';

  @override
  String get categoryDetailTopRated => 'అత్యధిక రేటింగ్';

  @override
  String get myListTitle => 'నా జాబితా';

  @override
  String get myListSaved => 'సేవ్ చేసినవి';

  @override
  String get myListWatchHistory => 'చూసిన చరిత్ర';

  @override
  String get myListError => 'ఏదో తప్పు జరిగింది';

  @override
  String get myListNoSaved => 'ఇంకా సేవ్ చేసిన అంశాలు లేవు';

  @override
  String get myListNoHistory => 'ఇంకా చూసిన చరిత్ర లేదు';

  @override
  String get myListNoSavedSubtitle =>
      'అన్వేషించడం ప్రారంభించండి మరియు మీ ఫేవరెట్లను సేవ్ చేయండి';

  @override
  String get myListNoHistorySubtitle =>
      'మీరు ఇటీవల చూసిన షోలు ఇక్కడ కనిపిస్తాయి';

  @override
  String get myListExploreShows => 'షోలను అన్వేషించండి';

  @override
  String get myListRemoved => 'నా జాబితా నుండి తీసివేయబడింది';

  @override
  String get myListLoginTitle => 'మీ సేవ్ చేసిన షోలను చూడటానికి లాగిన్ అవ్వండి';

  @override
  String get myListLoginSubtitle =>
      'మీకు ఇష్టమైన షోలను సేవ్ చేసి వాటిని ఎప్పుడైనా యాక్సెస్ చేయండి';

  @override
  String get profileTitle => 'ప్రొఫైల్';

  @override
  String get profileUser => 'వినియోగదారు';

  @override
  String get profileNoPhone => 'ఫోన్ లేదు';

  @override
  String get profileEditProfile => 'ప్రొఫైల్‌ను సవరించండి';

  @override
  String get profileYourInterests => 'మీ ఆసక్తులు';

  @override
  String get profileNoCategories => 'వర్గం ఏదీ ఎంచుకోలేదు';

  @override
  String get profileDobLabel => 'పుట్టిన తేదీ';

  @override
  String get profileNotLoggedIn => 'మీరు లాగిన్ చేయలేదు';

  @override
  String get profileNotLoggedInSubtitle =>
      'మీ ప్రొఫైల్, డౌన్లోడ్లు మరియు వ్యక్తిగతీకరించిన సిఫార్సులను యాక్సెస్ చేయడానికి సైన్ ఇన్ చేయండి.';

  @override
  String get profileLogin => 'లాగిన్';

  @override
  String get profileCollaboration => 'సహకారం';

  @override
  String get profileSettings => 'సెట్టింగ్లు & ప్రాధాన్యతలు';

  @override
  String get profileMyDownloads => 'నా డౌన్లోడ్లు';

  @override
  String get profileTermsOfUse => 'వినియోగ నిబంధనలు';

  @override
  String get profilePrivacyPolicy => 'గోప్యతా విధానం';

  @override
  String get profileHelpFaq => 'సహాయం & FAQ';

  @override
  String get profileContactUs => 'మమ్మల్ని సంప్రదించండి';

  @override
  String get profileLogout => 'లాగౌట్';

  @override
  String get profileLogoutTitle => 'లాగౌట్';

  @override
  String get profileLogoutConfirm =>
      'మీరు ఖచ్చితంగా లాగౌట్ చేయాలనుకుంటున్నారా?';

  @override
  String get profileCancel => 'రద్దు చేయండి';

  @override
  String get editProfileTitle => 'ప్రొఫైల్‌ను సవరించండి';

  @override
  String get editProfileTapToChangePhoto => 'ఫోటో మార్చడానికి నొక్కండి';

  @override
  String get editProfileFullName => 'పూర్తి పేరు';

  @override
  String get editProfileNameRequired => 'పేరు అవసరం';

  @override
  String get editProfileEmail => 'ఇమెయిల్';

  @override
  String get editProfileEmailRequired => 'ఇమెయిల్ అవసరం';

  @override
  String get editProfileInvalidEmail => 'చెల్లని ఇమెయిల్';

  @override
  String get editProfileDob => 'పుట్టిన తేదీ';

  @override
  String get editProfilePhone => 'ఫోన్';

  @override
  String get editProfileCategoryPreferences => 'వర్గ ప్రాధాన్యతలు';

  @override
  String get editProfileAddMore => 'మరింత జోడించండి';

  @override
  String get editProfileAddCategory => 'వర్గాన్ని జోడించండి';

  @override
  String get editProfileSaveChanges => 'మార్పులను సేవ్ చేయండి';

  @override
  String get editProfileUserDataNotAvailable =>
      'వినియోగదారు డేటా అందుబాటులో లేదు';

  @override
  String get editProfileUpdatedSuccess => 'ప్రొఫైల్ విజయవంతంగా నవీకరించబడింది';

  @override
  String get editProfileCancel => 'రద్దు చేయండి';

  @override
  String get editProfileSubmit => 'సమర్పించండి';

  @override
  String get settingsTitle => 'సెట్టింగ్లు';

  @override
  String get settingsGeneral => 'సాధారణం';

  @override
  String get settingsAppLanguage => 'యాప్ భాష';

  @override
  String get settingsSubtitleLanguage => 'ఉపశీర్షిక భాష';

  @override
  String get settingsAppearancePlayback => 'రూపం & ప్లేబ్యాక్';

  @override
  String get settingsColorTheme => 'రంగు థీమ్';

  @override
  String get settingsLight => 'లైట్';

  @override
  String get settingsDark => 'డార్క్';

  @override
  String get settingsSystem => 'సిస్టమ్';

  @override
  String get settingsAutoplayNext => 'తదుపరి ఎపిసోడ్ ఆటోప్లే';

  @override
  String get settingsDownloadQuality => 'డౌన్లోడ్ నాణ్యత';

  @override
  String get settingsLow => 'తక్కువ';

  @override
  String get settingsMedium => 'మధ్యస్థం';

  @override
  String get settingsHigh => 'అధికం';

  @override
  String get settingsVeryHigh => 'చాలా ఎక్కువ';

  @override
  String get settingsAccountPrivacy => 'ఖాతా & గోప్యత';

  @override
  String get settingsAgeRestriction => 'వయస్సు/కంటెంట్ పరిమితి';

  @override
  String get settingsNotifications => 'నోటిఫికేషన్లు';

  @override
  String get settingsDangerZone => 'ప్రమాద జోన్';

  @override
  String get settingsDeleteAccount => 'నా ఖాతాను తొలగించండి';

  @override
  String get deleteAccountTitle => 'ఖాతాను తొలగించండి';

  @override
  String get deleteAccountHeader => 'నా ఖాతాను తొలగించండి';

  @override
  String get deleteAccountWarning =>
      'ఈ చర్యను రద్దు చేయలేము. మీ మొత్తం డేటా శాశ్వతంగా తొలగించబడుతుంది.';

  @override
  String get deleteAccountDataLoss => 'కింది డేటా కోల్పోతుంది:';

  @override
  String get deleteAccountReason => 'తొలగింపుకు కారణం';

  @override
  String get deleteAccountSelectReason => 'కారణాన్ని ఎంచుకోండి';

  @override
  String get deleteAccountNotUsing => 'నేను ఇకపై యాప్‌ను ఉపయోగించడం లేదు';

  @override
  String get deleteAccountTooExpensive => 'చాలా ఖరీదైనది';

  @override
  String get deleteAccountPrivacy => 'గోప్యతా ఆందోళనలు';

  @override
  String get deleteAccountTechnicalIssues => 'సాంకేతిక సమస్యలు';

  @override
  String get deleteAccountFoundAlternative => 'మంచి ప్రత్యామ్నాయం దొరికింది';

  @override
  String get deleteAccountOther => 'ఇతర';

  @override
  String get deleteAccountProfileSettings => 'ప్రొఫైల్ & సెట్టింగ్లు';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'మీ ప్రొఫైల్ సమాచారం, ప్రాధాన్యతలు మరియు యాప్ సెట్టింగ్లు శాశ్వతంగా తొలగించబడతాయి.';

  @override
  String get deleteAccountListeningHistory => 'విన్న చరిత్ర';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'మీ విన్న చరిత్ర, శోధన చరిత్ర మరియు కార్యాచరణ లాగ్లు తొలగించబడతాయి.';

  @override
  String get deleteAccountSavedItems => 'సేవ్ చేసిన అంశాలు';

  @override
  String get deleteAccountSavedItemsDesc =>
      'మీ మొత్తం ప్లేలిస్ట్లు, ఫేవరెట్లు మరియు సేవ్ చేసిన కంటెంట్ తొలగించబడతాయి.';

  @override
  String get deleteAccountSubscriptions => 'సబ్స్క్రిప్షన్లు';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'యాక్టివ్ సబ్స్క్రిప్షన్లు రద్దు చేయబడతాయి మరియు ప్రీమియం యాక్సెస్ ముగుస్తుంది.';

  @override
  String get deleteAccountDelete => 'నా ఖాతాను తొలగించండి';

  @override
  String get deleteAccountCancel => 'రద్దు చేయండి';

  @override
  String get deleteAccountOtpTitle => 'తొలగింపును ధృవీకరించండి';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return '$phone కు పంపిన OTP ను నమోదు చేయండి';
  }

  @override
  String get deleteAccountOtpConfirm => 'తొలగింపును నిర్ధారించండి';

  @override
  String get deleteAccountOtpResend => 'OTP మళ్లీ పంపు';

  @override
  String get deleteAccountOtpResent => 'OTP విజయవంతంగా మళ్లీ పంపబడింది';

  @override
  String get accountDeletedTitle => 'ఖాతా తొలగించబడింది';

  @override
  String get accountDeletedMessage =>
      'మీ ఖాతా శాశ్వతంగా తొలగించబడింది.\nమీరు వెళ్లడం చూసి మేము చింతిస్తున్నాము.';

  @override
  String get accountDeletedBackToHome => 'హోమ్‌కు తిరిగి వెళ్లండి';

  @override
  String get contactUsTitle => 'మమ్మల్ని సంప్రదించండి';

  @override
  String get contactUsSubtitle => 'మీ నుండి వినడానికి మేము సంతోషిస్తాము';

  @override
  String get contactUsSubject => 'విషయం';

  @override
  String get contactUsMessageLabel => 'సందేశం';

  @override
  String get contactUsMessageHint => 'మీ సమస్య లేదా ప్రశ్నను వివరించండి...';

  @override
  String get contactUsAddAttachment => 'అటాచ్మెంట్ జోడించండి';

  @override
  String get contactUsQuickContact => 'శీఘ్ర సంప్రదింపు';

  @override
  String get contactUsEmail => 'ఇమెయిల్';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'కాల్';

  @override
  String get contactUsCallValue => '+1 (555) 123-4567';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'మాతో చాట్ చేయండి';

  @override
  String get contactUsSend => 'సందేశం పంపండి';

  @override
  String get contactUsSending => 'పంపుతోంది...';

  @override
  String get contactUsNoMessage => 'దయచేసి సందేశాన్ని నమోదు చేయండి';

  @override
  String get contactUsSent => 'సందేశం విజయవంతంగా పంపబడింది!';

  @override
  String get contactUsGeneralInquiry => 'సాధారణ విచారణ';

  @override
  String get contactUsTechnicalSupport => 'సాంకేతిక సహాయం';

  @override
  String get contactUsAccountIssue => 'ఖాతా సమస్య';

  @override
  String get contactUsBillingQuestion => 'బిల్లింగ్ ప్రశ్న';

  @override
  String get contactUsFeatureRequest => 'ఫీచర్ అభ్యర్థన';

  @override
  String get contactUsBugReport => 'బగ్ నివేదిక';

  @override
  String get helpFaqTitle => 'సహాయం & FAQ';

  @override
  String get helpFaqSearchHint => 'FAQలను శోధించండి...';

  @override
  String get helpFaqNoResults => 'ఫలితాలు కనుగొనబడలేదు';

  @override
  String get helpFaqStillNeedHelp => 'ఇంకా సహాయం కావాలా?';

  @override
  String get helpFaqContactUs => 'మమ్మల్ని సంప్రదించండి';

  @override
  String get helpFaqAll => 'అన్నీ';

  @override
  String get helpFaqAccount => 'ఖాతా';

  @override
  String get helpFaqPlayback => 'ప్లేబ్యాక్';

  @override
  String get helpFaqBilling => 'బిల్లింగ్';

  @override
  String get helpFaqOther => 'ఇతర';

  @override
  String get helpFaq1Q => 'నేను నా పాస్‌వర్డ్‌ను ఎలా రీసెట్ చేయాలి?';

  @override
  String get helpFaq1A =>
      'లాగిన్ స్క్రీన్ నుండి \'పాస్‌వర్డ్ మర్చిపోయారా\' ట్యాప్ చేసి మీ పాస్‌వర్డ్‌ను రీసెట్ చేయవచ్చు. మీ రిజిస్టర్ చేసిన ఇమెయిల్ లేదా ఫోన్‌కు పంపిన సూచనలను అనుసరించండి.';

  @override
  String get helpFaq2Q => 'నేను నా సబ్స్క్రిప్షన్ ప్లాన్‌ను మార్చవచ్చా?';

  @override
  String get helpFaq2A =>
      'అవును, మీ ప్రస్తుత ప్లాన్‌ను వీక్షించడానికి మరియు మార్చడానికి సెట్టింగ్లు > సబ్స్క్రిప్షన్‌కు వెళ్లండి. మార్పులు తదుపరి బిల్లింగ్ సైకిల్ నుండి అమలులోకి వస్తాయి.';

  @override
  String get helpFaq3Q => 'నేను నా ఖాతాను ఎలా తొలగించాలి?';

  @override
  String get helpFaq3A =>
      'సెట్టింగ్లు > ప్రమాద జోన్ > నా ఖాతాను తొలగించండి అనే చోటికి వెళ్లండి. మీ ఖాతాను శాశ్వతంగా తొలగించడానికి ధృవీకరణ దశలను అనుసరించండి.';

  @override
  String get helpFaq4Q => 'నా డౌన్లోడ్ చేసిన ఫైల్లు ఎక్కడ ఉన్నాయి?';

  @override
  String get helpFaq4A =>
      'డౌన్లోడ్ చేసిన ఎపిసోడ్లు యాప్ లోపల నా డౌన్లోడ్ల కింద నిల్వ చేయబడతాయి. అవి ఎప్పుడైనా ఆఫ్‌లైన్‌లో వినడానికి అందుబాటులో ఉంటాయి.';

  @override
  String get helpFaq5Q => 'నేను నా ప్రొఫైల్ సమాచారాన్ని ఎలా అప్‌డేట్ చేయాలి?';

  @override
  String get helpFaq5A =>
      'మీ పేరు, ఇమెయిల్, పుట్టిన తేదీ మరియు ప్రొఫైల్ చిత్రాన్ని అప్‌డేట్ చేయడానికి ప్రొఫైల్ > ప్రొఫైల్‌ను సవరించండి అనే చోటికి వెళ్లండి.';

  @override
  String get helpFaq6Q => 'నా ఆడియో ఎందుకు ప్లే అవడం లేదు?';

  @override
  String get helpFaq6A =>
      'మీ ఇంటర్నెట్ కనెక్షన్‌ను తనిఖీ చేయండి మరియు యాప్‌ను పునఃప్రారంభించడానికి ప్రయత్నించండి. సమస్య కొనసాగితే, సెట్టింగ్ల నుండి యాప్ క్యాష్‌ను క్లియర్ చేయడానికి ప్రయత్నించండి.';

  @override
  String get helpFaq7Q => 'నేను రీఫండ్ ఎలా పొందాలి?';

  @override
  String get helpFaq7A =>
      'మీ లావాదేవీ వివరాలతో support@webrofm.com వద్ద మా సపోర్ట్ టీమ్‌ను సంప్రదించండి. 5-7 పని దినాలలో మీ రీఫండ్ ప్రాసెస్ చేస్తాము.';

  @override
  String get helpFaq8Q => 'నేను బగ్‌ను ఎలా నివేదించాలి?';

  @override
  String get helpFaq8A =>
      'సెట్టింగ్లలోని మమ్మల్ని సంప్రదించండి విభాగం ద్వారా బగ్‌లను నివేదించవచ్చు. సమస్యను పునరుత్పత్తి చేయడానికి దశలు మరియు మీ పరికర సమాచారాన్ని చేర్చండి.';

  @override
  String get privacyPolicyTitle => 'గోప్యతా విధానం';

  @override
  String get privacyPolicyLastUpdated =>
      'చివరిగా నవీకరించబడింది: జూలై 22, 2026';

  @override
  String get privacyPolicyCollection => 'సేకరణ';

  @override
  String get privacyPolicyCollectionTitle => 'మేము సేకరించే సమాచారం';

  @override
  String get privacyPolicyCollectionText =>
      'మీ పేరు, ఇమెయిల్ చిరునామా, ఫోన్ నంబర్ మరియు ప్రొఫైల్ చిత్రం వంటి మీరు నేరుగా అందించే సమాచారాన్ని మేము సేకరిస్తాము. మీరు మా సేవలను ఉపయోగించినప్పుడు పరికర సమాచారం, వినియోగ డేటా మరియు వినే ప్రాధాన్యతలతో సహా కొన్ని సమాచారాన్ని కూడా మేము స్వయంచాలకంగా సేకరిస్తాము.';

  @override
  String get privacyPolicyUsage => 'వినియోగం';

  @override
  String get privacyPolicyUsageTitle => 'మేము మీ సమాచారాన్ని ఎలా ఉపయోగిస్తాము';

  @override
  String get privacyPolicyUsageText =>
      'మా స్ట్రీమింగ్ సేవలను అందించడానికి, నిర్వహించడానికి మరియు మెరుగుపరచడానికి, మీ అనుభవాన్ని వ్యక్తిగతీకరించడానికి, అప్‌డేట్లు మరియు ప్రమోషనల్ మెటీరియల్‌లను మీకు పంపడానికి మరియు మా ప్లాట్‌ఫామ్ యొక్క భద్రతను నిర్ధారించడానికి మేము సేకరించిన సమాచారాన్ని ఉపయోగిస్తాము.';

  @override
  String get privacyPolicySharing => 'భాగస్వామ్యం';

  @override
  String get privacyPolicySharingTitle => 'సమాచార భాగస్వామ్యం';

  @override
  String get privacyPolicySharingText =>
      'మేము మీ వ్యక్తిగత సమాచారాన్ని విక్రయించము. కఠినమైన గోప్యతా ఒప్పందాలకు లోబడి, మా ప్లాట్‌ఫామ్‌ను నిర్వహించడంలో మాకు సహాయపడే విశ్వసనీయ సేవా ప్రదాతలతో మీ డేటాను మేము భాగస్వామ్యం చేయవచ్చు.';

  @override
  String get privacyPolicySecurity => 'భద్రత';

  @override
  String get privacyPolicySecurityTitle => 'డేటా భద్రత';

  @override
  String get privacyPolicySecurityText =>
      'ట్రాన్సిట్ మరియు రెస్ట్ లో ఎన్క్రిప్షన్, రెగ్యులర్ సెక్యూరిటీ ఆడిట్లు మరియు యాక్సెస్ కంట్రోల్స్‌తో సహా మీ వ్యక్తిగత సమాచారాన్ని రక్షించడానికి మేము ఇండస్ట్రీ-స్టాండర్డ్ భద్రతా చర్యలను అమలు చేస్తాము.';

  @override
  String get privacyPolicyRights => 'హక్కులు';

  @override
  String get privacyPolicyRightsTitle => 'మీ హక్కులు & ఎంపికలు';

  @override
  String get privacyPolicyRightsText =>
      'మీ ఖాతా సెట్టింగ్ల ద్వారా ఎప్పుడైనా మీ వ్యక్తిగత సమాచారాన్ని యాక్సెస్ చేయడానికి, నవీకరించడానికి లేదా తొలగించడానికి మీకు హక్కు ఉంది. గోప్యతా సంబంధిత అభ్యర్థనల కోసం మీరు మమ్మల్ని నేరుగా సంప్రదించవచ్చు.';

  @override
  String get termsOfUseTitle => 'వినియోగ నిబంధనలు';

  @override
  String get termsOfUseUsage => 'వినియోగం';

  @override
  String get termsOfUseUsageTitle => 'వినియోగ మార్గదర్శకాలు';

  @override
  String get termsOfUseUsageText =>
      'WebroFM ఉపయోగించడం ద్వారా, చట్టపరమైన ప్రయోజనాల కోసం మాత్రమే సేవను ఉపయోగించడానికి మీరు అంగీకరిస్తున్నారు. ముందస్తు వ్రాతపూర్వక సమ్మతి లేకుండా మా ప్లాట్‌ఫామ్ నుండి ఏ కంటెంట్‌నైనా సవరించడం, పంపిణీ చేయడం లేదా పునరుత్పత్తి చేయడం మీకు అనుమతి లేదు. ఈ నిబంధనలను ఉల్లంఘించినందుకు యాక్సెస్‌ను సస్పెండ్ చేయడానికి లేదా ముగించడానికి మాకు హక్కు ఉంది.';

  @override
  String get termsOfUseAccounts => 'ఖాతాలు';

  @override
  String get termsOfUseAccountsTitle => 'వినియోగదారు ఖాతాలు';

  @override
  String get termsOfUseAccountsText =>
      'మీ ఖాతా ఆధారాల గోప్యతను కాపాడుకోవడానికి మీరు బాధ్యత వహిస్తారు. ఖాతాను సృష్టించేటప్పుడు మీరు ఖచ్చితమైన మరియు పూర్తి సమాచారాన్ని అందించాలి. మీ ఖాతా యొక్క ఏదైనా అనధికారిక ఉపయోగం గురించి మీరు వెంటనే మాకు తెలియజేయాలి.';

  @override
  String get termsOfUseContent => 'కంటెంట్';

  @override
  String get termsOfUseContentTitle => 'కంటెంట్ & మేధో సంపత్తి';

  @override
  String get termsOfUseContentText =>
      'ఆడియో స్ట్రీమ్లు, వీడియోలు మరియు ఆర్ట్‌వర్క్‌తో సహా WebroFM లో అందుబాటులో ఉన్న మొత్తం కంటెంట్ కాపీరైట్ మరియు మేధో సంపత్తి చట్టాలచే రక్షించబడుతుంది. స్పష్టమైన అనుమతి లేకుండా వినియోగదారులు కంటెంట్‌ను డౌన్‌లోడ్ చేయడం, రికార్డ్ చేయడం లేదా పునఃపంపిణీ చేయడం కుదరదు.';

  @override
  String get termsOfUseLiability => 'బాధ్యత';

  @override
  String get termsOfUseLiabilityTitle => 'బాధ్యత పరిమితి';

  @override
  String get termsOfUseLiabilityText =>
      'సేవను ఉపయోగించడం వల్ల ఉత్పన్నమయ్యే ఏ పరోక్ష, ఆకస్మిక లేదా పర్యవసాన నష్టాలకు WebroFM బాధ్యత వహించదు. మా మొత్తం బాధ్యత గత 12 నెలల్లో మీరు సేవ కోసం చెల్లించిన మొత్తాన్ని మించదు.';

  @override
  String get notificationsTitle => 'నోటిఫికేషన్లు';

  @override
  String get notificationsEmptyTitle => 'నోటిఫికేషన్లు లేవు';

  @override
  String get notificationsEmptySubtitle =>
      'మీరు అన్నీ క్యాచ్ అప్ చేసారు! నవీకరణల కోసం తర్వాత తిరిగి చూడండి.';

  @override
  String get downloadsTitle => 'నా డౌన్లోడ్లు';

  @override
  String get downloadsEmptyTitle => 'ఇంకా డౌన్లోడ్లు లేవు';

  @override
  String get downloadsEmptySubtitle =>
      'మీ డౌన్లోడ్ చేసిన ఎపిసోడ్లు ఇక్కడ కనిపిస్తాయి, తద్వారా మీరు ఎప్పుడైనా ఆఫ్‌లైన్‌లో వినవచ్చు.';

  @override
  String get downloadsBrowseShows => 'షోలను బ్రౌజ్ చేయండి';

  @override
  String get premiumTitle => 'ప్రీమియం';

  @override
  String get collabTitle => 'సహకారం';

  @override
  String get collabMyStories => 'నా కథలు';

  @override
  String get collabMySponsorships => 'నా స్పాన్సర్షిప్లు';

  @override
  String get collabNoStories => 'ఇంకా కథలు ఏవీ సమర్పించబడలేదు.';

  @override
  String get collabNoSponsorships => 'ఇంకా స్పాన్సర్షిప్లు ఏవీ సమర్పించబడలేదు.';

  @override
  String get collabApproved => 'ఆమోదించబడింది';

  @override
  String get collabRejected => 'తిరస్కరించబడింది';

  @override
  String get collabReviewing => 'సమీక్షించబడుతోంది';

  @override
  String get collabPending => 'పెండింగ్';

  @override
  String get collabShareYourStory => 'మీ కథను షేర్ చేయండి';

  @override
  String get collabShareYourStorySubtitle =>
      'ఫీచర్ చేయబడే అవకాశం కోసం మీ అసలు కథను సమర్పించండి.';

  @override
  String get collabSubmitStory => 'కథను సమర్పించండి';

  @override
  String get collabSponsorshipAd => 'స్పాన్సర్షిప్ / ప్రకటన';

  @override
  String get collabSponsorshipSubtitle =>
      'స్పాన్సర్షిప్ కోసం మీ బ్రాండ్ లేదా వ్యాపారాన్ని సమర్పించండి.';

  @override
  String get collabSubmitAd => 'ప్రకటనను సమర్పించండి';

  @override
  String get collabDialogStoryTitle => 'మీ కథను సమర్పించండి';

  @override
  String get collabStoryTitle => 'కథ శీర్షిక';

  @override
  String get collabStoryTitleHint => 'మీ కథ శీర్షికను నమోదు చేయండి';

  @override
  String get collabStoryContent => 'కథ కంటెంట్';

  @override
  String get collabStoryContentHint => 'మీ కథను ఇక్కడ వ్రాయండి...';

  @override
  String get collabCancel => 'రద్దు చేయండి';

  @override
  String get collabSubmit => 'సమర్పించండి';

  @override
  String get collabDialogAdTitle => 'ప్రకటనను సమర్పించండి';

  @override
  String get collabBrandName => 'బ్రాండ్ పేరు';

  @override
  String get collabBrandNameHint => 'మీ బ్రాండ్/వ్యాపార పేరు';

  @override
  String get collabDescription => 'వివరణ';

  @override
  String get collabDescriptionHint => 'మీ ప్రకటనను వివరించండి';

  @override
  String get collabTargetUrl => 'టార్గెట్ URL (ఐచ్ఛికం)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'చిత్రం ఎంపిక చేయబడింది';

  @override
  String get collabUploadAdVisual => 'ప్రకటన విజువల్ అప్‌లోడ్ చేయండి';

  @override
  String get collabStatusRunning => 'నడుస్తోంది';

  @override
  String get collabStatusExpired => 'గడువు ముగిసింది';

  @override
  String get languagesAppLanguage => 'యాప్ భాష';

  @override
  String get languagesSubtitleLanguage => 'ఉపశీర్షిక భాష';

  @override
  String get bottomNavHome => 'హోమ్';

  @override
  String get bottomNavSearch => 'శోధన';

  @override
  String get bottomNavCategories => 'వర్గాలు';

  @override
  String get bottomNavMyList => 'నా జాబితా';

  @override
  String get bottomNavProfile => 'ప్రొఫైల్';

  @override
  String get networkOffline => 'ఆఫ్‌లైన్ మోడ్';

  @override
  String get networkDownload => 'డౌన్‌లోడ్ మోడ్';

  @override
  String get networkOfflineSnackbar =>
      'ఆఫ్‌లైన్ మోడ్ ఆన్‌లో ఉంది\nడౌన్‌లోడ్ కంటెంట్‌ను అన్వేషించడం ప్రారంభించండి';

  @override
  String get networkDismiss => 'తీసివేయి';

  @override
  String get loadingPleaseWait => 'దయచేసి వేచి ఉండండి...';

  @override
  String get commonRetry => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get guestTimerTitle => 'ఉచిత సమయం ముగిసింది!';

  @override
  String get guestTimerBody =>
      'అన్ని కంటెంట్ను యాక్సెస్ చేయడానికి లాగిన్ అవ్వండి.\nఇది మీకు ఉచితం!';

  @override
  String get freeLimitTitle => 'ఉచిత పరిమితి చేరుకుంది';

  @override
  String get freeLimitBody =>
      'మీరు మీ 1 నిమిషాల ఉచిత వినడం ఉపయోగించారు. పూర్తి ఎపిసోడ్ వినడం కొనసాగించడానికి దయచేసి లాగిన్ అవ్వండి లేదా సైన్ అప్ చేయండి.';

  @override
  String get guestTimerLater => 'తర్వాత';

  @override
  String get guestTimerLogin => 'లాగిన్ / సైన్ అప్';

  @override
  String get errorDataError =>
      'డేటా లోపం సంభవించింది. దయచేసి మళ్లీ ప్రయత్నించండి.';

  @override
  String get errorInvalidData => 'చెల్లని డేటా ఫార్మాట్ అందుకుంది.';

  @override
  String get errorUnexpected => 'ఊహించని లోపం సంభవించింది.';

  @override
  String get errorTimeout =>
      'కనెక్షన్ సమయం ముగిసింది. దయచేసి మీ ఇంటర్నెట్ కనెక్షన్‌ను తనిఖీ చేయండి.';

  @override
  String get errorNoInternet =>
      'ఇంటర్నెట్ కనెక్షన్ లేదు. దయచేసి మీ నెట్‌వర్క్ సెట్టింగ్లను తనిఖీ చేయండి.';

  @override
  String get errorCancelled => 'అభ్యర్థన రద్దు చేయబడింది.';

  @override
  String get errorSecurity =>
      'కనెక్షన్ భద్రతా లోపం. దయచేసి మీ యాప్‌ను అప్‌డేట్ చేయండి.';

  @override
  String get errorNetwork => 'ఊహించని నెట్‌వర్క్ లోపం సంభవించింది.';

  @override
  String get errorInvalidRequest =>
      'చెల్లని అభ్యర్థన. దయచేసి మీ ఇన్‌పుట్‌ను ధృవీకరించండి.';

  @override
  String get errorSessionExpired =>
      'సెషన్ గడువు ముగిసింది. దయచేసి మళ్లీ సైన్ ఇన్ చేయండి.';

  @override
  String get errorPermissionDenied => 'ఈ చర్యను చేయడానికి మీకు అనుమతి లేదు.';

  @override
  String get errorNotFound => 'అభ్యర్థించిన వనరు కనుగొనబడలేదు.';

  @override
  String get errorConflict =>
      'వైరుధ్యం కనుగొనబడింది. వనరు నవీకరించబడి ఉండవచ్చు.';

  @override
  String get errorValidationFailed =>
      'ధృవీకరణ విఫలమైంది. దయచేసి మీ ఇన్‌పుట్‌ను తనిఖీ చేయండి.';

  @override
  String get errorTooManyRequests =>
      'చాలా ఎక్కువ అభ్యర్థనలు. దయచేసి తర్వాత మళ్లీ ప్రయత్నించండి.';

  @override
  String get errorServer => 'సర్వర్ లోపం. దయచేసి తర్వాత మళ్లీ ప్రయత్నించండి.';

  @override
  String get errorServiceUnavailable =>
      'సేవ తాత్కాలికంగా అందుబాటులో లేదు. దయచేసి మళ్లీ ప్రయత్నించండి.';

  @override
  String get errorUnderMaintenance =>
      'సేవ నిర్వహణలో ఉంది. దయచేసి తర్వాత మళ్లీ ప్రయత్నించండి.';

  @override
  String errorGeneric(Object code) {
    return 'ఏదో తప్పు జరిగింది. (లోపం $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'కనెక్షన్ సమయం ముగిసింది. దయచేసి మళ్లీ ప్రయత్నించండి.';

  @override
  String get errorNoConnection => 'ఇంటర్నెట్ కనెక్షన్ లేదు.';

  @override
  String errorServerWithCode(Object code) {
    return 'సర్వర్ లోపం ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'ఏదో తప్పు జరిగింది. దయచేసి మళ్లీ ప్రయత్నించండి.';

  @override
  String get pageNotFound => 'పేజీ కనుగొనబడలేదు';

  @override
  String get pageNotFoundMessage => 'మీరు వెతుకుతున్న పేజీ లేదు.';

  @override
  String get goHome => 'హోమ్‌కు వెళ్లండి';

  @override
  String get relativeTimeJustNow => 'ఇప్పుడే';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '$minutes నిమి క్రితం';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '$hours గం క్రితం';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '$days రో క్రితం';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '$weeks వా క్రితం';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '$months నె క్రితం';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '$years సం క్రితం';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return '$minutes నిమిలో';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return '$hours గంటలో';
  }

  @override
  String relativeTimeInDay(Object days) {
    return '$days రోజులో';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '$hours గం $minutes ని';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '$minutes ని $seconds సె';
  }

  @override
  String fileSizeBytes(Object size) {
    return '$size బై';
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
    return '$count మి';
  }

  @override
  String countViewsK(Object count) {
    return '$count వే';
  }

  @override
  String episodeCount(Object count) {
    return '$count ఎపి';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'S$season E$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'సీజన్ $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return 'No episodes available in $language';
  }

  @override
  String get contentDisclaimer =>
      'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.';

  @override
  String get categoryDrama => 'డ్రామా';

  @override
  String get categoryComedy => 'కామెడీ';

  @override
  String get categoryPodcasts => 'పాడ్కాస్ట్లు';

  @override
  String get categoryMusic => 'సంగీతం';

  @override
  String get categoryKids => 'పిల్లలు';

  @override
  String get categoryDevotional => 'భక్తి';

  @override
  String get categoryNews => 'వార్తలు';

  @override
  String get categorySports => 'క్రీడలు';

  @override
  String get categoryTechnology => 'టెక్నాలజీ';

  @override
  String get categoryEducation => 'విద్య';

  @override
  String get categoryBusiness => 'వ్యాపారం';

  @override
  String get categoryHealth => 'ఆరోగ్యం';

  @override
  String get categoryScience => 'సైన్స్';

  @override
  String get categoryArts => 'కళలు';

  @override
  String get trendingDramaSeries => 'డ్రామా సిరీస్లు';

  @override
  String get trendingComedyShows => 'కామెడీ షోలు';

  @override
  String get trendingPodcasts => 'పాడ్కాస్ట్లు';

  @override
  String get trendingMusicAlbums => 'సంగీత ఆల్బమ్లు';

  @override
  String get trendingKidsStories => 'పిల్లల కథలు';

  @override
  String get trendingDevotional => 'భక్తి';

  @override
  String get trendingNewsToday => 'నేటి వార్తలు';

  @override
  String get trendingSportsHighlights => 'క్రీడా హైలైట్లు';

  @override
  String get languageEnglish => 'ఇంగ్లీష్';

  @override
  String get languageHindi => 'హిందీ';

  @override
  String get languagePunjabi => 'పంజాబీ';

  @override
  String get languageHaryanvi => 'హర్యాన్వీ';

  @override
  String get languageMarathi => 'మరాఠీ';

  @override
  String get languageGujarati => 'గుజరాతీ';

  @override
  String get languageBengali => 'బెంగాలీ';

  @override
  String get languageTamil => 'తమిళం';

  @override
  String get languageTelugu => 'తెలుగు';

  @override
  String get languageKannada => 'కన్నడ';

  @override
  String get languageMalayalam => 'మలయాళం';

  @override
  String get languageUrdu => 'ఉర్దూ';

  @override
  String get pressBackToExit => 'నిష్క్రమించడానికి మళ్లీ వెనుక నొక్కండి';

  @override
  String get exitDialogTitle => 'అప్ మూసివేయాలా?';

  @override
  String get exitDialogBody => 'మీరు నిజంగా అప్ మూసివేయాలనుకుంటున్నారా?';

  @override
  String get exitDialogConfirm => 'మూసివేయండి';

  @override
  String get exitDialogCancel => 'రద్దు';

  @override
  String get profileShareApp => 'Share App';

  @override
  String get profileShareAppMessage =>
      'Check out WebroFM - your go-to app for streaming shows and podcasts!';
}
