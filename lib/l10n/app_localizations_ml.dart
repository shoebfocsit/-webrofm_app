// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'വെബ്രോഎഫ്എം';

  @override
  String get splashLoading => 'ലോഡ് ചെയ്യുന്നു...';

  @override
  String get welcomeTitle => 'വെബ്രോഎഫ്എമ്മിലേക്ക് സ്വാഗതം';

  @override
  String get welcomeSubtitle => 'നിങ്ങളെ ചലിപ്പിക്കുന്ന കഥകൾ കണ്ടെത്തൂ';

  @override
  String get welcomeGetStarted => 'ആരംഭിക്കുക';

  @override
  String get welcomeContinueAsGuest => 'അതിഥിയായി തുടരുക';

  @override
  String get loginSearchCountries => 'രാജ്യങ്ങൾ തിരയുക';

  @override
  String get loginInvalidPhone => 'ദയവായി സാധുവായ ഫോൺ നമ്പർ നൽകുക';

  @override
  String get loginRateLimitTitle => 'റേറ്റ് പരിധി എത്തി';

  @override
  String get loginRateLimitContent =>
      'വളരെയധികം OTP ശ്രമങ്ങൾ. 1 മണിക്കൂറിന് ശേഷം വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get loginOk => 'ശരി';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'ഈ മണിക്കൂറിൽ $remaining ശ്രമം മാത്രം ശേഷിക്കുന്നു';
  }

  @override
  String get loginTitle => 'തുടരാൻ ലോഗിൻ ചെയ്യുക';

  @override
  String get loginSubtitle => 'ആരംഭിക്കാൻ നിങ്ങളുടെ ഫോൺ നമ്പർ നൽകുക';

  @override
  String get loginPhoneHint => '(555) 000-0000';

  @override
  String get loginIAgreeTo => 'ഞാൻ സമ്മതിക്കുന്നു ';

  @override
  String get loginTermsOfUse => 'ഉപയോഗ നിബന്ധനകൾ';

  @override
  String get loginAnd => ' ഒപ്പം ';

  @override
  String get loginPrivacyPolicy => 'സ്വകാര്യതാ നയം';

  @override
  String get loginSendOtp => 'OTP അയയ്ക്കുക';

  @override
  String get loginContinueAsGuest => 'അതിഥിയായി തുടരുക';

  @override
  String get otpEnterCompleteCode => 'ദയവായി പൂർണ്ണമായ 6 അക്ക കോഡ് നൽകുക';

  @override
  String get otpTitle => 'നിങ്ങളുടെ നമ്പർ പരിശോധിക്കുക';

  @override
  String get otpSubtitle => 'ഇതിലേക്ക് അയച്ച കോഡ് നൽകുക';

  @override
  String get otpVerifyAndContinue => 'പരിശോധിച്ച് തുടരുക';

  @override
  String get otpDidntReceive => 'കോഡ് ലഭിച്ചില്ലേ? ';

  @override
  String get otpResend => 'OTP വീണ്ടും അയയ്ക്കുക';

  @override
  String get completeProfileTitle => 'നിങ്ങളുടെ പ്രൊഫൈൽ പൂർത്തിയാക്കുക';

  @override
  String get completeProfileSubtitle =>
      'നിങ്ങളുടെ അനുഭവം വ്യക്തിഗതമാക്കാൻ ഞങ്ങളെ സഹായിക്കൂ';

  @override
  String get completeProfileBasicInfo => 'അടിസ്ഥാന വിവരങ്ങൾ';

  @override
  String get completeProfileFullName => 'പൂർണ്ണമായ പേര് *';

  @override
  String get completeProfileNameHint => 'ജോൺ ഡോ';

  @override
  String get completeProfileEmail => 'ഇമെയിൽ വിലാസം';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'ലിംഗം *';

  @override
  String get completeProfileDateOfBirth => 'ജനനത്തീയതി';

  @override
  String get completeProfileDobHint => 'നിങ്ങളുടെ ജനനത്തീയതി തിരഞ്ഞെടുക്കുക';

  @override
  String get completeProfileMale => 'പുരുഷൻ';

  @override
  String get completeProfileFemale => 'സ്ത്രീ';

  @override
  String get completeProfileOther => 'മറ്റ്';

  @override
  String get completeProfileError => 'ദയവായി നിങ്ങളുടെ പേരും ലിംഗവും നൽകുക';

  @override
  String get completeProfileSkip => 'ഒഴിവാക്കുക';

  @override
  String get completeProfileContinue => 'തുടരുക';

  @override
  String get interestTitle => 'നിങ്ങളുടെ താൽപ്പര്യങ്ങൾ തിരഞ്ഞെടുക്കുക';

  @override
  String get interestSubtitle =>
      'വ്യക്തിഗത ശുപാർശകൾ ലഭിക്കാൻ നിങ്ങൾ ഇഷ്ടപ്പെടുന്ന വിഭാഗങ്ങൾ തിരഞ്ഞെടുക്കുക';

  @override
  String get interestSectionHeader => 'നിങ്ങളുടെ താൽപ്പര്യങ്ങൾ തിരഞ്ഞെടുക്കുക';

  @override
  String get interestTapToSelect => 'തിരഞ്ഞെടുക്കാൻ ടാപ്പ് ചെയ്യുക';

  @override
  String get interestContinue => 'വെബ്രോഎഫ്എമ്മിലേക്ക് തുടരുക';

  @override
  String get interestSkip => 'ഒഴിവാക്കുക';

  @override
  String get registrationTitle => 'നിങ്ങളെക്കുറിച്ച് ഞങ്ങളോട് പറയൂ';

  @override
  String get registrationSubtitle =>
      'നിങ്ങളുടെ അനുഭവം വ്യക്തിഗതമാക്കാൻ ഞങ്ങളെ സഹായിക്കൂ';

  @override
  String get registrationPersonalInfo => 'വ്യക്തിഗത വിവരങ്ങൾ';

  @override
  String get registrationFullName => 'പൂർണ്ണമായ പേര്';

  @override
  String get registrationNameHint => 'ജോൺ ഡോ';

  @override
  String get registrationEmail => 'ഇമെയിൽ വിലാസം';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'ജനനത്തീയതി';

  @override
  String get registrationDobHint => 'നിങ്ങളുടെ ജനനത്തീയതി തിരഞ്ഞെടുക്കുക';

  @override
  String get registrationInterestsHeader =>
      'നിങ്ങളുടെ താൽപ്പര്യങ്ങൾ തിരഞ്ഞെടുക്കുക';

  @override
  String get registrationInterestsSubtitle =>
      'നിങ്ങൾ ഇഷ്ടപ്പെടുന്ന വിഭാഗങ്ങൾ തിരഞ്ഞെടുക്കുക';

  @override
  String get registrationContinue => 'വെബ്രോഎഫ്എമ്മിലേക്ക് തുടരുക';

  @override
  String get registrationNameError => 'ദയവായി നിങ്ങളുടെ പേര് നൽകുക';

  @override
  String get homeContinueWatching => 'തുടർന്ന് കാണുക';

  @override
  String get homeContinueListening => 'തുടർന്ന് കേൾക്കുക';

  @override
  String get homeResume => 'തുടരുക';

  @override
  String get homeNewArrivals => 'പുതിയ എത്തിച്ചേരലുകൾ';

  @override
  String get homeSeeAll => 'എല്ലാം കാണുക';

  @override
  String get homePopularNow => 'ഇപ്പോൾ ജനപ്രിയം';

  @override
  String get homeNoShows => 'ഷോകൾ ലഭ്യമല്ല';

  @override
  String get showDetailFailed => 'ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get showDetailNotFound => 'ഷോ കണ്ടെത്തിയില്ല';

  @override
  String showDetailShareText(Object title) {
    return 'വെബ്രോഎഫ്എമ്മിൽ $title പരിശോധിക്കൂ!';
  }

  @override
  String get showDetailDownloadStarted => 'ഡൗൺലോഡ് ആരംഭിച്ചു';

  @override
  String get showDetailNoDescription => 'വിവരണം ലഭ്യമല്ല.';

  @override
  String get showDetailReadLess => 'കുറച്ച് കാണിക്കുക';

  @override
  String get showDetailReadMore => 'കൂടുതൽ വായിക്കുക';

  @override
  String get showDetailPlayLatest => 'ഏറ്റവും പുതിയ എപ്പിസോഡ് പ്ലേ ചെയ്യുക';

  @override
  String get showDetailEpisodes => 'എപ്പിസോഡുകൾ';

  @override
  String get showDetailNoEpisodes => 'എപ്പിസോഡുകൾ ലഭ്യമല്ല';

  @override
  String get showDetailMoreLikeThis => 'ഇതുപോലുള്ള കൂടുതൽ';

  @override
  String get videoPlayerNoAudio => 'ഈ എപ്പിസോഡിന് ഓഡിയോ ലഭ്യമല്ല';

  @override
  String get videoPlayerLoading => 'വീഡിയോ ലോഡ് ചെയ്യുന്നു...';

  @override
  String get videoPlayerNowPlaying => 'ഇപ്പോൾ പ്ലേ ചെയ്യുന്നു';

  @override
  String get videoPlayerPaused => 'താൽക്കാലികമായി നിർത്തി';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'പ്ലേബാക്ക് പിശക്: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'വീഡിയോ പ്ലെയർ';

  @override
  String get videoPlayerNext => 'അടുത്തത്';

  @override
  String get videoPlayerAudio => 'ഓഡിയോ';

  @override
  String get videoPlayerVideo => 'വീഡിയോ';

  @override
  String get showCardNew => 'പുതിയത്';

  @override
  String get searchHint => 'ഷോകൾ, എപ്പിസോഡുകൾ എന്നിവ തിരയുക...';

  @override
  String get searchTrending => 'ട്രെൻഡിംഗ് തിരയലുകൾ';

  @override
  String get searchSuggested => 'നിങ്ങൾക്കായി നിർദ്ദേശിച്ചവ';

  @override
  String get searchError => 'എന്തോ പിശക് സംഭവിച്ചു';

  @override
  String get searchNoResults => 'ഫലങ്ങളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get searchNoResultsSubtitle =>
      'നിങ്ങളുടെ തിരയൽ പദങ്ങൾ ക്രമീകരിക്കാൻ ശ്രമിക്കുക';

  @override
  String get categoriesTitle => 'വിഭാഗങ്ങൾ പര്യവേക്ഷണം ചെയ്യുക';

  @override
  String categoriesShowCount(Object count) {
    return '$count ഷോകൾ';
  }

  @override
  String get categoryDetailFailed => 'ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get categoryDetailLoadMore => 'കൂടുതൽ ലോഡ് ചെയ്യുക';

  @override
  String get categoryDetailSortBy => 'അടുക്കുക';

  @override
  String get categoryDetailPopular => 'ജനപ്രിയം';

  @override
  String get categoryDetailNewest => 'ഏറ്റവും പുതിയത്';

  @override
  String get categoryDetailTopRated => 'ഏറ്റവും മികച്ച റേറ്റിംഗ്';

  @override
  String get myListTitle => 'എന്റെ പട്ടിക';

  @override
  String get myListSaved => 'സംരക്ഷിച്ചവ';

  @override
  String get myListWatchHistory => 'കാണൽ ചരിത്രം';

  @override
  String get myListError => 'എന്തോ പിശക് സംഭവിച്ചു';

  @override
  String get myListNoSaved => 'ഇതുവരെ സംരക്ഷിച്ച ഇനങ്ങളൊന്നുമില്ല';

  @override
  String get myListNoHistory => 'ഇതുവരെ കാണൽ ചരിത്രമൊന്നുമില്ല';

  @override
  String get myListNoSavedSubtitle =>
      'പര്യവേക്ഷണം ആരംഭിച്ച് നിങ്ങളുടെ പ്രിയപ്പെട്ടവ സംരക്ഷിക്കുക';

  @override
  String get myListNoHistorySubtitle =>
      'നിങ്ങൾ അടുത്തിടെ കണ്ട ഷോകൾ ഇവിടെ ദൃശ്യമാകും';

  @override
  String get myListExploreShows => 'ഷോകൾ പര്യവേക്ഷണം ചെയ്യുക';

  @override
  String get myListRemoved => 'എന്റെ പട്ടികയിൽ നിന്ന് നീക്കം ചെയ്തു';

  @override
  String get myListLoginTitle =>
      'നിങ്ങളുടെ സംരക്ഷിച്ച ഷോകൾ കാണാൻ ലോഗിൻ ചെയ്യുക';

  @override
  String get myListLoginSubtitle =>
      'നിങ്ങളുടെ പ്രിയപ്പെട്ട ഷോകൾ സംരക്ഷിച്ച് എപ്പോൾ വേണമെങ്കിലും ആക്സസ് ചെയ്യുക';

  @override
  String get profileTitle => 'പ്രൊഫൈൽ';

  @override
  String get profileUser => 'ഉപയോക്താവ്';

  @override
  String get profileNoPhone => 'ഫോൺ ഇല്ല';

  @override
  String get profileEditProfile => 'പ്രൊഫൈൽ എഡിറ്റ് ചെയ്യുക';

  @override
  String get profileYourInterests => 'നിങ്ങളുടെ താൽപ്പര്യങ്ങൾ';

  @override
  String get profileNoCategories => 'വിഭാഗങ്ങൾ തിരഞ്ഞെടുത്തിട്ടില്ല';

  @override
  String get profileDobLabel => 'ജനനത്തീയതി';

  @override
  String get profileNotLoggedIn => 'നിങ്ങൾ ലോഗിൻ ചെയ്തിട്ടില്ല';

  @override
  String get profileNotLoggedInSubtitle =>
      'നിങ്ങളുടെ പ്രൊഫൈൽ, ഡൗൺലോഡുകൾ, വ്യക്തിഗത ശുപാർശകൾ എന്നിവ ആക്സസ് ചെയ്യാൻ സൈൻ ഇൻ ചെയ്യുക.';

  @override
  String get profileLogin => 'ലോഗിൻ';

  @override
  String get profileCollaboration => 'സഹകരണം';

  @override
  String get profileSettings => 'ക്രമീകരണങ്ങളും മുൻഗണനകളും';

  @override
  String get profileMyDownloads => 'എന്റെ ഡൗൺലോഡുകൾ';

  @override
  String get profileTermsOfUse => 'ഉപയോഗ നിബന്ധനകൾ';

  @override
  String get profilePrivacyPolicy => 'സ്വകാര്യതാ നയം';

  @override
  String get profileHelpFaq => 'സഹായവും പതിവ് ചോദ്യങ്ങളും';

  @override
  String get profileContactUs => 'ഞങ്ങളെ ബന്ധപ്പെടുക';

  @override
  String get profileLogout => 'ലോഗൗട്ട്';

  @override
  String get profileLogoutTitle => 'ലോഗൗട്ട്';

  @override
  String get profileLogoutConfirm => 'നിങ്ങൾക്ക് ഉറപ്പായും ലോഗൗട്ട് ചെയ്യണോ?';

  @override
  String get profileCancel => 'റദ്ദാക്കുക';

  @override
  String get editProfileTitle => 'പ്രൊഫൈൽ എഡിറ്റ് ചെയ്യുക';

  @override
  String get editProfileTapToChangePhoto => 'ഫോട്ടോ മാറ്റാൻ ടാപ്പ് ചെയ്യുക';

  @override
  String get editProfileFullName => 'പൂർണ്ണമായ പേര്';

  @override
  String get editProfileNameRequired => 'പേര് ആവശ്യമാണ്';

  @override
  String get editProfileEmail => 'ഇമെയിൽ';

  @override
  String get editProfileEmailRequired => 'ഇമെയിൽ ആവശ്യമാണ്';

  @override
  String get editProfileInvalidEmail => 'അസാധുവായ ഇമെയിൽ';

  @override
  String get editProfileDob => 'ജനനത്തീയതി';

  @override
  String get editProfilePhone => 'ഫോൺ';

  @override
  String get editProfileCategoryPreferences => 'വിഭാഗ മുൻഗണനകൾ';

  @override
  String get editProfileAddMore => 'കൂടുതൽ ചേർക്കുക';

  @override
  String get editProfileAddCategory => 'വിഭാഗം ചേർക്കുക';

  @override
  String get editProfileSaveChanges => 'മാറ്റങ്ങൾ സംരക്ഷിക്കുക';

  @override
  String get editProfileUserDataNotAvailable => 'ഉപയോക്തൃ ഡാറ്റ ലഭ്യമല്ല';

  @override
  String get editProfileUpdatedSuccess => 'പ്രൊഫൈൽ വിജയകരമായി അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String get editProfileCancel => 'റദ്ദാക്കുക';

  @override
  String get editProfileSubmit => 'സമർപ്പിക്കുക';

  @override
  String get settingsTitle => 'ക്രമീകരണങ്ങൾ';

  @override
  String get settingsGeneral => 'പൊതുവായവ';

  @override
  String get settingsAppLanguage => 'ആപ്പ് ഭാഷ';

  @override
  String get settingsSubtitleLanguage => 'സബ്ടൈറ്റിൽ ഭാഷ';

  @override
  String get settingsAppearancePlayback => 'രൂപവും പ്ലേബാക്കും';

  @override
  String get settingsColorTheme => 'നിറത്തിന്റെ തീം';

  @override
  String get settingsLight => 'ലൈറ്റ്';

  @override
  String get settingsDark => 'ഡാർക്ക്';

  @override
  String get settingsSystem => 'സിസ്റ്റം';

  @override
  String get settingsAutoplayNext => 'അടുത്ത എപ്പിസോഡ് ഓട്ടോപ്ലേ ചെയ്യുക';

  @override
  String get settingsDownloadQuality => 'ഡൗൺലോഡ് ഗുണനിലവാരം';

  @override
  String get settingsLow => 'കുറവ്';

  @override
  String get settingsMedium => 'ഇടത്തരം';

  @override
  String get settingsHigh => 'ഉയർന്നത്';

  @override
  String get settingsVeryHigh => 'വളരെ ഉയർന്നത്';

  @override
  String get settingsAccountPrivacy => 'അക്കൗണ്ടും സ്വകാര്യതയും';

  @override
  String get settingsAgeRestriction => 'പ്രായം/ഉള്ളടക്ക നിയന്ത്രണം';

  @override
  String get settingsNotifications => 'അറിയിപ്പുകൾ';

  @override
  String get settingsDangerZone => 'അപകട മേഖല';

  @override
  String get settingsDeleteAccount => 'എന്റെ അക്കൗണ്ട് ഇല്ലാതാക്കുക';

  @override
  String get deleteAccountTitle => 'അക്കൗണ്ട് ഇല്ലാതാക്കുക';

  @override
  String get deleteAccountHeader => 'എന്റെ അക്കൗണ്ട് ഇല്ലാതാക്കുക';

  @override
  String get deleteAccountWarning =>
      'ഈ പ്രവർത്തനം പഴയപടിയാക്കാനാവില്ല. നിങ്ങളുടെ എല്ലാ ഡാറ്റയും ശാശ്വതമായി നീക്കം ചെയ്യും.';

  @override
  String get deleteAccountDataLoss => 'ഇനിപ്പറയുന്ന ഡാറ്റ നഷ്ടമാകും:';

  @override
  String get deleteAccountReason => 'ഇല്ലാതാക്കാനുള്ള കാരണം';

  @override
  String get deleteAccountSelectReason => 'ഒരു കാരണം തിരഞ്ഞെടുക്കുക';

  @override
  String get deleteAccountNotUsing => 'ഞാൻ ഇനി ആപ്പ് ഉപയോഗിക്കുന്നില്ല';

  @override
  String get deleteAccountTooExpensive => 'വളരെ ചെലവേറിയത്';

  @override
  String get deleteAccountPrivacy => 'സ്വകാര്യതാ ആശങ്കകൾ';

  @override
  String get deleteAccountTechnicalIssues => 'സാങ്കേതിക പ്രശ്നങ്ങൾ';

  @override
  String get deleteAccountFoundAlternative => 'മികച്ച ഒരു ബദൽ കണ്ടെത്തി';

  @override
  String get deleteAccountOther => 'മറ്റ്';

  @override
  String get deleteAccountProfileSettings => 'പ്രൊഫൈലും ക്രമീകരണങ്ങളും';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'നിങ്ങളുടെ പ്രൊഫൈൽ വിവരങ്ങൾ, മുൻഗണനകൾ, ആപ്പ് ക്രമീകരണങ്ങൾ എന്നിവ ശാശ്വതമായി ഇല്ലാതാക്കും.';

  @override
  String get deleteAccountListeningHistory => 'കേൾക്കൽ ചരിത്രം';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'നിങ്ങളുടെ കേൾക്കൽ ചരിത്രം, തിരയൽ ചരിത്രം, പ്രവർത്തന ലോഗുകൾ എന്നിവ മായ്ക്കും.';

  @override
  String get deleteAccountSavedItems => 'സംരക്ഷിച്ച ഇനങ്ങൾ';

  @override
  String get deleteAccountSavedItemsDesc =>
      'നിങ്ങളുടെ എല്ലാ പ്ലേലിസ്റ്റുകളും പ്രിയപ്പെട്ടവയും സംരക്ഷിച്ച ഉള്ളടക്കവും നീക്കം ചെയ്യും.';

  @override
  String get deleteAccountSubscriptions => 'സബ്സ്ക്രിപ്ഷനുകൾ';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'ഏതെങ്കിലും സജീവ സബ്സ്ക്രിപ്ഷനുകൾ റദ്ദാക്കപ്പെടും, പ്രീമിയം ആക്സസ് അവസാനിക്കും.';

  @override
  String get deleteAccountDelete => 'എന്റെ അക്കൗണ്ട് ഇല്ലാതാക്കുക';

  @override
  String get deleteAccountCancel => 'റദ്ദാക്കുക';

  @override
  String get deleteAccountOtpTitle => 'ഇല്ലാതാക്കൽ പരിശോധിക്കുക';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return '$phone എന്ന നമ്പറിലേക്ക് അയച്ച OTP നൽകുക';
  }

  @override
  String get deleteAccountOtpConfirm => 'ഇല്ലാതാക്കൽ സ്ഥിരീകരിക്കുക';

  @override
  String get deleteAccountOtpResend => 'OTP വീണ്ടും അയയ്ക്കുക';

  @override
  String get deleteAccountOtpResent => 'OTP വിജയകരമായി വീണ്ടും അയച്ചു';

  @override
  String get accountDeletedTitle => 'അക്കൗണ്ട് ഇല്ലാതാക്കി';

  @override
  String get accountDeletedMessage =>
      'നിങ്ങളുടെ അക്കൗണ്ട് ശാശ്വതമായി ഇല്ലാതാക്കിയിരിക്കുന്നു.\nനിങ്ങൾ പോകുന്നതിൽ ഞങ്ങൾക്ക് ഖേദമുണ്ട്.';

  @override
  String get accountDeletedBackToHome => 'ഹോമിലേക്ക് മടങ്ങുക';

  @override
  String get contactUsTitle => 'ഞങ്ങളെ ബന്ധപ്പെടുക';

  @override
  String get contactUsSubtitle =>
      'നിങ്ങളിൽ നിന്ന് കേൾക്കാൻ ഞങ്ങൾക്ക് സന്തോഷമാണ്';

  @override
  String get contactUsSubject => 'വിഷയം';

  @override
  String get contactUsMessageLabel => 'സന്ദേശം';

  @override
  String get contactUsMessageHint => 'നിങ്ങളുടെ പ്രശ്നമോ ചോദ്യമോ വിവരിക്കുക...';

  @override
  String get contactUsAddAttachment => 'അറ്റാച്ച്മെന്റ് ചേർക്കുക';

  @override
  String get contactUsQuickContact => 'പെട്ടെന്നുള്ള ബന്ധം';

  @override
  String get contactUsEmail => 'ഇമെയിൽ';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'കോൾ';

  @override
  String get contactUsCallValue => '+1 (555) 123-4567';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'ഞങ്ങളുമായി ചാറ്റ് ചെയ്യുക';

  @override
  String get contactUsSend => 'സന്ദേശം അയയ്ക്കുക';

  @override
  String get contactUsSending => 'അയയ്ക്കുന്നു...';

  @override
  String get contactUsNoMessage => 'ദയവായി ഒരു സന്ദേശം നൽകുക';

  @override
  String get contactUsSent => 'സന്ദേശം വിജയകരമായി അയച്ചു!';

  @override
  String get contactUsGeneralInquiry => 'പൊതു അന്വേഷണം';

  @override
  String get contactUsTechnicalSupport => 'സാങ്കേതിക പിന്തുണ';

  @override
  String get contactUsAccountIssue => 'അക്കൗണ്ട് പ്രശ്നം';

  @override
  String get contactUsBillingQuestion => 'ബില്ലിംഗ് ചോദ്യം';

  @override
  String get contactUsFeatureRequest => 'ഫീച്ചർ അഭ്യർത്ഥന';

  @override
  String get contactUsBugReport => 'ബഗ് റിപ്പോർട്ട്';

  @override
  String get helpFaqTitle => 'സഹായവും പതിവ് ചോദ്യങ്ങളും';

  @override
  String get helpFaqSearchHint => 'പതിവ് ചോദ്യങ്ങൾ തിരയുക...';

  @override
  String get helpFaqNoResults => 'ഫലങ്ങളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get helpFaqStillNeedHelp => 'ഇപ്പോഴും സഹായം വേണോ?';

  @override
  String get helpFaqContactUs => 'ഞങ്ങളെ ബന്ധപ്പെടുക';

  @override
  String get helpFaqAll => 'എല്ലാം';

  @override
  String get helpFaqAccount => 'അക്കൗണ്ട്';

  @override
  String get helpFaqPlayback => 'പ്ലേബാക്ക്';

  @override
  String get helpFaqBilling => 'ബില്ലിംഗ്';

  @override
  String get helpFaqOther => 'മറ്റ്';

  @override
  String get helpFaq1Q => 'എങ്ങനെ എന്റെ പാസ്വേഡ് റീസെറ്റ് ചെയ്യും?';

  @override
  String get helpFaq1A =>
      'ലോഗിൻ സ്ക്രീനിൽ നിന്ന് \'ഫോർഗോട്ട് പാസ്വേഡ്\' ടാപ്പ് ചെയ്ത് നിങ്ങളുടെ പാസ്വേഡ് റീസെറ്റ് ചെയ്യാം. നിങ്ങളുടെ രജിസ്റ്റർ ചെയ്ത ഇമെയിലിലേക്കോ ഫോണിലേക്കോ അയച്ച നിർദ്ദേശങ്ങൾ പാലിക്കുക.';

  @override
  String get helpFaq2Q => 'എനിക്ക് എന്റെ സബ്സ്ക്രിപ്ഷൻ പ്ലാൻ മാറ്റാനാകുമോ?';

  @override
  String get helpFaq2A =>
      'അതെ, നിലവിലെ പ്ലാൻ കാണാനും മാറ്റാനും ക്രമീകരണങ്ങൾ > സബ്സ്ക്രിപ്ഷൻ എന്നതിലേക്ക് പോകുക. അടുത്ത ബില്ലിംഗ് സൈക്കിൾ മുതൽ മാറ്റങ്ങൾ പ്രാബല്യത്തിൽ വരും.';

  @override
  String get helpFaq3Q => 'എങ്ങനെ എന്റെ അക്കൗണ്ട് ഇല്ലാതാക്കും?';

  @override
  String get helpFaq3A =>
      'ക്രമീകരണങ്ങൾ > അപകട മേഖല > എന്റെ അക്കൗണ്ട് ഇല്ലാതാക്കുക എന്നതിലേക്ക് പോകുക. നിങ്ങളുടെ അക്കൗണ്ട് ശാശ്വതമായി ഇല്ലാതാക്കാൻ പരിശോധന ഘട്ടങ്ങൾ പാലിക്കുക.';

  @override
  String get helpFaq4Q => 'എന്റെ ഡൗൺലോഡ് ചെയ്ത ഫയലുകൾ എവിടെയാണ്?';

  @override
  String get helpFaq4A =>
      'ഡൗൺലോഡ് ചെയ്ത എപ്പിസോഡുകൾ ആപ്പിനുള്ളിൽ എന്റെ ഡൗൺലോഡുകൾക്ക് കീഴിൽ സംഭരിച്ചിരിക്കുന്നു. ഏത് സമയത്തും ഓഫ്ലൈനിൽ കേൾക്കാൻ അവ ലഭ്യമാണ്.';

  @override
  String get helpFaq5Q => 'എന്റെ പ്രൊഫൈൽ വിവരങ്ങൾ എങ്ങനെ അപ്ഡേറ്റ് ചെയ്യും?';

  @override
  String get helpFaq5A =>
      'നിങ്ങളുടെ പേര്, ഇമെയിൽ, ജനനത്തീയതി, പ്രൊഫൈൽ ചിത്രം എന്നിവ അപ്ഡേറ്റ് ചെയ്യാൻ പ്രൊഫൈൽ > പ്രൊഫൈൽ എഡിറ്റ് ചെയ്യുക എന്നതിലേക്ക് പോകുക.';

  @override
  String get helpFaq6Q => 'എന്റെ ഓഡിയോ പ്ലേ ആകുന്നില്ലേ?';

  @override
  String get helpFaq6A =>
      'നിങ്ങളുടെ ഇന്റർനെറ്റ് കണക്ഷൻ പരിശോധിച്ച് ആപ്പ് വീണ്ടും ആരംഭിക്കാൻ ശ്രമിക്കുക. പ്രശ്നം നിലനിൽക്കുകയാണെങ്കിൽ, ക്രമീകരണങ്ങളിൽ നിന്ന് ആപ്പ് കാഷെ മായ്ക്കാൻ ശ്രമിക്കുക.';

  @override
  String get helpFaq7Q => 'എങ്ങനെ റീഫണ്ട് നേടും?';

  @override
  String get helpFaq7A =>
      'നിങ്ങളുടെ ഇടപാട് വിശദാംശങ്ങളുമായി support@webrofm.com എന്ന വിലാസത്തിൽ ഞങ്ങളുടെ സപ്പോർട്ട് ടീമിനെ ബന്ധപ്പെടുക. ഞങ്ങൾ 5-7 പ്രവൃത്തി ദിവസങ്ങൾക്കുള്ളിൽ നിങ്ങളുടെ റീഫണ്ട് പ്രോസസ്സ് ചെയ്യും.';

  @override
  String get helpFaq8Q => 'എങ്ങനെ ഒരു ബഗ് റിപ്പോർട്ട് ചെയ്യും?';

  @override
  String get helpFaq8A =>
      'ക്രമീകരണങ്ങളിലെ ഞങ്ങളെ ബന്ധപ്പെടുക വിഭാഗം വഴി നിങ്ങൾക്ക് ബഗുകൾ റിപ്പോർട്ട് ചെയ്യാം. പ്രശ്നം പുനഃസൃഷ്ടിക്കാനുള്ള ഘട്ടങ്ങളും നിങ്ങളുടെ ഉപകരണ വിവരങ്ങളും ഉൾപ്പെടുത്തുക.';

  @override
  String get privacyPolicyTitle => 'സ്വകാര്യതാ നയം';

  @override
  String get privacyPolicyLastUpdated =>
      'അവസാനം അപ്ഡേറ്റ് ചെയ്തത്: ജൂലൈ 22, 2026';

  @override
  String get privacyPolicyCollection => 'ശേഖരണം';

  @override
  String get privacyPolicyCollectionTitle => 'ഞങ്ങൾ ശേഖരിക്കുന്ന വിവരങ്ങൾ';

  @override
  String get privacyPolicyCollectionText =>
      'നിങ്ങൾ നേരിട്ട് നൽകുന്ന വിവരങ്ങൾ ഞങ്ങൾ ശേഖരിക്കുന്നു, അതായത് നിങ്ങളുടെ പേര്, ഇമെയിൽ വിലാസം, ഫോൺ നമ്പർ, പ്രൊഫൈൽ ചിത്രം. നിങ്ങൾ ഞങ്ങളുടെ സേവനങ്ങൾ ഉപയോഗിക്കുമ്പോൾ ഉപകരണ വിവരങ്ങൾ, ഉപയോഗ ഡാറ്റ, കേൾക്കൽ മുൻഗണനകൾ എന്നിവ ഉൾപ്പെടെ ചില വിവരങ്ങളും ഞങ്ങൾ യാന്ത്രികമായി ശേഖരിക്കുന്നു.';

  @override
  String get privacyPolicyUsage => 'ഉപയോഗം';

  @override
  String get privacyPolicyUsageTitle =>
      'ഞങ്ങൾ നിങ്ങളുടെ വിവരങ്ങൾ എങ്ങനെ ഉപയോഗിക്കുന്നു';

  @override
  String get privacyPolicyUsageText =>
      'ഞങ്ങളുടെ സ്ട്രീമിംഗ് സേവനങ്ങൾ നൽകുന്നതിനും പരിപാലിക്കുന്നതിനും മെച്ചപ്പെടുത്തുന്നതിനും, നിങ്ങളുടെ അനുഭവം വ്യക്തിഗതമാക്കുന്നതിനും, നിങ്ങൾക്ക് അപ്ഡേറ്റുകളും പ്രമോഷണൽ മെറ്റീരിയലുകളും അയയ്ക്കുന്നതിനും, ഞങ്ങളുടെ പ്ലാറ്റ്ഫോമിന്റെ സുരക്ഷ ഉറപ്പാക്കുന്നതിനും ഞങ്ങൾ ശേഖരിക്കുന്ന വിവരങ്ങൾ ഉപയോഗിക്കുന്നു.';

  @override
  String get privacyPolicySharing => 'പങ്കിടൽ';

  @override
  String get privacyPolicySharingTitle => 'വിവര പങ്കിടൽ';

  @override
  String get privacyPolicySharingText =>
      'ഞങ്ങൾ നിങ്ങളുടെ സ്വകാര്യ വിവരങ്ങൾ വിൽക്കുന്നില്ല. ഞങ്ങളുടെ പ്ലാറ്റ്ഫോം പ്രവർത്തിപ്പിക്കുന്നതിൽ ഞങ്ങളെ സഹായിക്കുന്ന വിശ്വസ്ത സേവന ദാതാക്കളുമായി ഞങ്ങൾ നിങ്ങളുടെ ഡാറ്റ പങ്കിട്ടേക്കാം, കർശനമായ രഹസ്യാത്മക കരാറുകൾക്ക് വിധേയമായി.';

  @override
  String get privacyPolicySecurity => 'സുരക്ഷ';

  @override
  String get privacyPolicySecurityTitle => 'ഡാറ്റ സുരക്ഷ';

  @override
  String get privacyPolicySecurityText =>
      'ട്രാൻസിറ്റിലും റെസ്റ്റിലും എൻക്രിപ്ഷൻ, പതിവ് സുരക്ഷാ ഓഡിറ്റുകൾ, ആക്സസ് നിയന്ത്രണങ്ങൾ എന്നിവ ഉൾപ്പെടെ നിങ്ങളുടെ സ്വകാര്യ വിവരങ്ങൾ സംരക്ഷിക്കുന്നതിന് ഞങ്ങൾ വ്യവസായ-സ്റ്റാൻഡേർഡ് സുരക്ഷാ നടപടികൾ നടപ്പിലാക്കുന്നു.';

  @override
  String get privacyPolicyRights => 'അവകാശങ്ങൾ';

  @override
  String get privacyPolicyRightsTitle =>
      'നിങ്ങളുടെ അവകാശങ്ങളും തിരഞ്ഞെടുപ്പുകളും';

  @override
  String get privacyPolicyRightsText =>
      'നിങ്ങളുടെ അക്കൗണ്ട് ക്രമീകരണങ്ങൾ വഴി എപ്പോൾ വേണമെങ്കിലും നിങ്ങളുടെ സ്വകാര്യ വിവരങ്ങൾ ആക്സസ് ചെയ്യുന്നതിനും അപ്ഡേറ്റ് ചെയ്യുന്നതിനും ഇല്ലാതാക്കുന്നതിനും നിങ്ങൾക്ക് അവകാശമുണ്ട്. സ്വകാര്യത സംബന്ധിച്ച ഏത് അഭ്യർത്ഥനകൾക്കും നിങ്ങൾക്ക് ഞങ്ങളെ നേരിട്ട് ബന്ധപ്പെടാം.';

  @override
  String get termsOfUseTitle => 'ഉപയോഗ നിബന്ധനകൾ';

  @override
  String get termsOfUseUsage => 'ഉപയോഗം';

  @override
  String get termsOfUseUsageTitle => 'ഉപയോഗ മാർഗ്ഗനിർദ്ദേശങ്ങൾ';

  @override
  String get termsOfUseUsageText =>
      'വെബ്രോഎഫ്എം ഉപയോഗിക്കുന്നതിലൂടെ, നിയമപരമായ ആവശ്യങ്ങൾക്ക് മാത്രം സേവനം ഉപയോഗിക്കാൻ നിങ്ങൾ സമ്മതിക്കുന്നു. മുൻകൂർ രേഖാമൂലമുള്ള സമ്മതമില്ലാതെ ഞങ്ങളുടെ പ്ലാറ്റ്ഫോമിൽ നിന്നുള്ള ഉള്ളടക്കം പരിഷ്കരിക്കാനോ വിതരണം ചെയ്യാനോ പുനർനിർമ്മിക്കാനോ നിങ്ങൾക്ക് അവകാശമില്ല. ഈ നിബന്ധനകളുടെ ലംഘനത്തിന് ആക്സസ് സസ്പെൻഡ് ചെയ്യുന്നതിനോ അവസാനിപ്പിക്കുന്നതിനോ ഞങ്ങൾക്ക് അവകാശമുണ്ട്.';

  @override
  String get termsOfUseAccounts => 'അക്കൗണ്ടുകൾ';

  @override
  String get termsOfUseAccountsTitle => 'ഉപയോക്തൃ അക്കൗണ്ടുകൾ';

  @override
  String get termsOfUseAccountsText =>
      'നിങ്ങളുടെ അക്കൗണ്ട് ക്രെഡൻഷ്യലുകളുടെ രഹസ്യാത്മകത നിലനിർത്തുന്നതിന് നിങ്ങൾ ഉത്തരവാദിയാണ്. ഒരു അക്കൗണ്ട് സൃഷ്ടിക്കുമ്പോൾ നിങ്ങൾ കൃത്യവും പൂർണ്ണവുമായ വിവരങ്ങൾ നൽകണം. നിങ്ങളുടെ അക്കൗണ്ടിന്റെ അനധികൃത ഉപയോഗത്തെക്കുറിച്ച് ഉടൻ തന്നെ ഞങ്ങളെ അറിയിക്കണം.';

  @override
  String get termsOfUseContent => 'ഉള്ളടക്കം';

  @override
  String get termsOfUseContentTitle => 'ഉള്ളടക്കവും ബൗദ്ധിക സ്വത്തവകാശവും';

  @override
  String get termsOfUseContentText =>
      'ഓഡിയോ സ്ട്രീമുകൾ, വീഡിയോകൾ, ആർട്ട്വർക്ക് എന്നിവ ഉൾപ്പെടെ വെബ്രോഎഫ്എമ്മിൽ ലഭ്യമായ എല്ലാ ഉള്ളടക്കവും പകർപ്പവകാശവും ബൗദ്ധിക സ്വത്തവകാശ നിയമങ്ങളും പ്രകാരം സംരക്ഷിക്കപ്പെട്ടിരിക്കുന്നു. വ്യക്തമായ അനുമതിയില്ലാതെ ഉള്ളടക്കം ഡൗൺലോഡ് ചെയ്യാനോ റെക്കോർഡ് ചെയ്യാനോ പുനർവിതരണം ചെയ്യാനോ ഉപയോക്താക്കൾക്ക് അവകാശമില്ല.';

  @override
  String get termsOfUseLiability => 'ബാധ്യത';

  @override
  String get termsOfUseLiabilityTitle => 'ബാധ്യതയുടെ പരിമിതി';

  @override
  String get termsOfUseLiabilityText =>
      'സേവനത്തിന്റെ നിങ്ങളുടെ ഉപയോഗത്തിൽ നിന്ന് ഉണ്ടാകുന്ന പരോക്ഷമായ, ആകസ്മികമായ, അനന്തരഫല ക്ഷതങ്ങൾക്ക് വെബ്രോഎഫ്എം ബാധ്യസ്ഥനായിരിക്കില്ല. ഞങ്ങളുടെ മൊത്തം ബാധ്യത കഴിഞ്ഞ 12 മാസങ്ങളിൽ നിങ്ങൾ സേവനത്തിനായി അടച്ച തുകയിൽ കവിയരുത്.';

  @override
  String get notificationsTitle => 'അറിയിപ്പുകൾ';

  @override
  String get notificationsEmptyTitle => 'അറിയിപ്പുകളൊന്നുമില്ല';

  @override
  String get notificationsEmptySubtitle =>
      'നിങ്ങൾ എല്ലാം കണ്ടുകഴിഞ്ഞു! പിന്നീട് അപ്ഡേറ്റുകൾക്കായി തിരികെ വിടൂ.';

  @override
  String get downloadsTitle => 'എന്റെ ഡൗൺലോഡുകൾ';

  @override
  String get downloadsEmptyTitle => 'ഇതുവരെ ഡൗൺലോഡുകളൊന്നുമില്ല';

  @override
  String get downloadsEmptySubtitle =>
      'നിങ്ങളുടെ ഡൗൺലോഡ് ചെയ്ത എപ്പിസോഡുകൾ ഇവിടെ ദൃശ്യമാകും, അതുവഴി എപ്പോൾ വേണമെങ്കിലും ഓഫ്ലൈനിൽ കേൾക്കാം.';

  @override
  String get downloadsBrowseShows => 'ഷോകൾ ബ്രൗസ് ചെയ്യുക';

  @override
  String get premiumTitle => 'പ്രീമിയം';

  @override
  String get collabTitle => 'സഹകരണം';

  @override
  String get collabMyStories => 'എന്റെ കഥകൾ';

  @override
  String get collabMySponsorships => 'എന്റെ സ്പോൺസർഷിപ്പുകൾ';

  @override
  String get collabNoStories => 'ഇതുവരെ കഥകളൊന്നും സമർപ്പിച്ചിട്ടില്ല.';

  @override
  String get collabNoSponsorships =>
      'ഇതുവരെ സ്പോൺസർഷിപ്പുകളൊന്നും സമർപ്പിച്ചിട്ടില്ല.';

  @override
  String get collabApproved => 'അംഗീകരിച്ചു';

  @override
  String get collabRejected => 'നിരസിച്ചു';

  @override
  String get collabReviewing => 'അവലോകനം ചെയ്യുന്നു';

  @override
  String get collabPending => 'തീർപ്പാകാത്തത്';

  @override
  String get collabShareYourStory => 'നിങ്ങളുടെ കഥ പങ്കിടൂ';

  @override
  String get collabShareYourStorySubtitle =>
      'ഫീച്ചർ ചെയ്യപ്പെടാനുള്ള അവസരത്തിനായി നിങ്ങളുടെ യഥാർത്ഥ കഥ സമർപ്പിക്കുക.';

  @override
  String get collabSubmitStory => 'കഥ സമർപ്പിക്കുക';

  @override
  String get collabSponsorshipAd => 'സ്പോൺസർഷിപ്പ് / പരസ്യം';

  @override
  String get collabSponsorshipSubtitle =>
      'സ്പോൺസർഷിപ്പിനായി നിങ്ങളുടെ ബ്രാൻഡോ ബിസിനസ്സോ സമർപ്പിക്കുക.';

  @override
  String get collabSubmitAd => 'പരസ്യം സമർപ്പിക്കുക';

  @override
  String get collabDialogStoryTitle => 'നിങ്ങളുടെ കഥ സമർപ്പിക്കുക';

  @override
  String get collabStoryTitle => 'കഥയുടെ തലക്കെട്ട്';

  @override
  String get collabStoryTitleHint => 'നിങ്ങളുടെ കഥയുടെ തലക്കെട്ട് നൽകുക';

  @override
  String get collabStoryContent => 'കഥയുടെ ഉള്ളടക്കം';

  @override
  String get collabStoryContentHint => 'നിങ്ങളുടെ കഥ ഇവിടെ എഴുതുക...';

  @override
  String get collabCancel => 'റദ്ദാക്കുക';

  @override
  String get collabSubmit => 'സമർപ്പിക്കുക';

  @override
  String get collabDialogAdTitle => 'പരസ്യം സമർപ്പിക്കുക';

  @override
  String get collabBrandName => 'ബ്രാൻഡ് നാമം';

  @override
  String get collabBrandNameHint => 'നിങ്ങളുടെ ബ്രാൻഡ്/ബിസിനസ്സ് പേര്';

  @override
  String get collabDescription => 'വിവരണം';

  @override
  String get collabDescriptionHint => 'നിങ്ങളുടെ പരസ്യം വിവരിക്കുക';

  @override
  String get collabTargetUrl => 'ടാർഗെറ്റ് URL (ഐച്ഛികം)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'ചിത്രം തിരഞ്ഞെടുത്തു';

  @override
  String get collabUploadAdVisual => 'പരസ്യ ദൃശ്യം അപ്ലോഡ് ചെയ്യുക';

  @override
  String get collabStatusRunning => 'പ്രവർത്തിക്കുന്നു';

  @override
  String get collabStatusExpired => 'കാലഹരണപ്പെട്ടു';

  @override
  String get languagesAppLanguage => 'ആപ്പ് ഭാഷ';

  @override
  String get languagesSubtitleLanguage => 'സബ്ടൈറ്റിൽ ഭാഷ';

  @override
  String get bottomNavHome => 'ഹോം';

  @override
  String get bottomNavSearch => 'തിരയുക';

  @override
  String get bottomNavCategories => 'വിഭാഗങ്ങൾ';

  @override
  String get bottomNavMyList => 'എന്റെ പട്ടിക';

  @override
  String get bottomNavProfile => 'പ്രൊഫൈൽ';

  @override
  String get networkOffline => 'ഓഫ്ലൈൻ മോഡ്';

  @override
  String get networkDownload => 'ഡൗൺലോഡ് മോഡ്';

  @override
  String get networkOfflineSnackbar =>
      'ഓഫ്ലൈൻ മോഡ് ഓൺ\nഡൗൺലോഡ് ഉള്ളടക്കം പര്യവേക്ഷണം ചെയ്യാൻ ആരംഭിക്കുക';

  @override
  String get networkDismiss => 'ഒഴിവാക്കുക';

  @override
  String get loadingPleaseWait => 'ദയവായി കാത്തിരിക്കുക...';

  @override
  String get commonRetry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get guestTimerTitle => 'സൗജന്യ സമയം അവസാനിച്ചു!';

  @override
  String get guestTimerBody =>
      'എല്ലാ ഉള്ളടക്കവും ആക്സസ് ചെയ്യാൻ ലോഗിൻ ചെയ്യുക.\nഇത് നിങ്ങൾക്ക് സൗജന്യമാണ്!';

  @override
  String get freeLimitTitle => 'സൗജന്യ പരിധി എത്തി';

  @override
  String get freeLimitBody =>
      'നിങ്ങളുടെ 1 മിനിറ്റ് സൗജന്യ ശ്രവണം ഉപയോഗിച്ചു. പൂർണ്ണ എപ്പിസോഡ് കേൾക്കുന്നത് തുടരാൻ ദയവായി ലോഗിൻ ചെയ്യുക അല്ലെങ്കിൽ സൈൻ അപ്പ് ചെയ്യുക.';

  @override
  String get guestTimerLater => 'പിന്നീട്';

  @override
  String get guestTimerLogin => 'ലോഗിൻ / സൈൻ അപ്പ്';

  @override
  String get errorDataError =>
      'ഒരു ഡാറ്റ പിശക് സംഭവിച്ചു. ദയവായി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get errorInvalidData => 'അസാധുവായ ഡാറ്റ ഫോർമാറ്റ് ലഭിച്ചു.';

  @override
  String get errorUnexpected => 'ഒരു അപ്രതീക്ഷിത പിശക് സംഭവിച്ചു.';

  @override
  String get errorTimeout =>
      'കണക്ഷൻ സമയം കഴിഞ്ഞു. നിങ്ങളുടെ ഇന്റർനെറ്റ് കണക്ഷൻ പരിശോധിക്കുക.';

  @override
  String get errorNoInternet =>
      'ഇന്റർനെറ്റ് കണക്ഷൻ ഇല്ല. നിങ്ങളുടെ നെറ്റ്വർക്ക് ക്രമീകരണങ്ങൾ പരിശോധിക്കുക.';

  @override
  String get errorCancelled => 'അഭ്യർത്ഥന റദ്ദാക്കി.';

  @override
  String get errorSecurity =>
      'കണക്ഷൻ സുരക്ഷാ പിശക്. നിങ്ങളുടെ ആപ്പ് അപ്ഡേറ്റ് ചെയ്യുക.';

  @override
  String get errorNetwork => 'ഒരു അപ്രതീക്ഷിത നെറ്റ്വർക്ക് പിശക് സംഭവിച്ചു.';

  @override
  String get errorInvalidRequest =>
      'അസാധുവായ അഭ്യർത്ഥന. നിങ്ങളുടെ ഇൻപുട്ട് പരിശോധിക്കുക.';

  @override
  String get errorSessionExpired =>
      'സെഷൻ കാലഹരണപ്പെട്ടു. ദയവായി വീണ്ടും സൈൻ ഇൻ ചെയ്യുക.';

  @override
  String get errorPermissionDenied =>
      'ഈ പ്രവർത്തനം നടത്താൻ നിങ്ങൾക്ക് അനുമതിയില്ല.';

  @override
  String get errorNotFound => 'അഭ്യർത്ഥിച്ച വിഭവം കണ്ടെത്തിയില്ല.';

  @override
  String get errorConflict =>
      'വൈരുദ്ധ്യം കണ്ടെത്തി. വിഭവം അപ്ഡേറ്റ് ചെയ്തിരിക്കാം.';

  @override
  String get errorValidationFailed =>
      'മൂല്യനിർണ്ണയം പരാജയപ്പെട്ടു. നിങ്ങളുടെ ഇൻപുട്ട് പരിശോധിക്കുക.';

  @override
  String get errorTooManyRequests =>
      'വളരെയധികം അഭ്യർത്ഥനകൾ. ദയവായി പിന്നീട് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get errorServer => 'സെർവർ പിശക്. ദയവായി പിന്നീട് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get errorServiceUnavailable =>
      'സേവനം താൽക്കാലികമായി ലഭ്യമല്ല. ദയവായി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get errorUnderMaintenance =>
      'സേവനം അറ്റകുറ്റപ്പണിയിലാണ്. ദയവായി പിന്നീട് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String errorGeneric(Object code) {
    return 'എന്തോ പിശക് സംഭവിച്ചു. (പിശക് $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'കണക്ഷൻ സമയം കഴിഞ്ഞു. ദയവായി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get errorNoConnection => 'ഇന്റർനെറ്റ് കണക്ഷൻ ഇല്ല.';

  @override
  String errorServerWithCode(Object code) {
    return 'സെർവർ പിശക് ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'എന്തോ പിശക് സംഭവിച്ചു. ദയവായി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get pageNotFound => 'പേജ് കണ്ടെത്തിയില്ല';

  @override
  String get pageNotFoundMessage => 'നിങ്ങൾ തിരയുന്ന പേജ് നിലവിലില്ല.';

  @override
  String get goHome => 'ഹോമിലേക്ക് പോകുക';

  @override
  String get relativeTimeJustNow => 'ഇപ്പോൾ മാത്രം';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '$minutes മി. മുമ്പ്';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '$hours മ. മുമ്പ്';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '$days ദി. മുമ്പ്';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '$weeks ആ. മുമ്പ്';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '$months മാ. മുമ്പ്';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '$years വ. മുമ്പ്';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return '$minutes മി.യിൽ';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return '$hours മ.യിൽ';
  }

  @override
  String relativeTimeInDay(Object days) {
    return '$days ദി.യിൽ';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '$hours മ. $minutes മി.';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '$minutes മി. $seconds സെ.';
  }

  @override
  String fileSizeBytes(Object size) {
    return '$size ബി';
  }

  @override
  String fileSizeKB(Object size) {
    return '$size കെബി';
  }

  @override
  String fileSizeMB(Object size) {
    return '$size എംബി';
  }

  @override
  String fileSizeGB(Object size) {
    return '$size ജിബി';
  }

  @override
  String countViewsM(Object count) {
    return '$count ദശലക്ഷം';
  }

  @override
  String countViewsK(Object count) {
    return '$count ആയിരം';
  }

  @override
  String episodeCount(Object count) {
    return '$count എപ്പി.';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'എസ്$season എപ്പി$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'സീസൺ $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return 'No episodes available in $language';
  }

  @override
  String get contentDisclaimer =>
      'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.';

  @override
  String get categoryDrama => 'ഡ്രാമ';

  @override
  String get categoryComedy => 'കോമഡി';

  @override
  String get categoryPodcasts => 'പോഡ്കാസ്റ്റുകൾ';

  @override
  String get categoryMusic => 'സംഗീതം';

  @override
  String get categoryKids => 'കുട്ടികൾ';

  @override
  String get categoryDevotional => 'ഭക്തി';

  @override
  String get categoryNews => 'വാർത്ത';

  @override
  String get categorySports => 'കായികം';

  @override
  String get categoryTechnology => 'സാങ്കേതികവിദ്യ';

  @override
  String get categoryEducation => 'വിദ്യാഭ്യാസം';

  @override
  String get categoryBusiness => 'ബിസിനസ്സ്';

  @override
  String get categoryHealth => 'ആരോഗ്യം';

  @override
  String get categoryScience => 'ശാസ്ത്രം';

  @override
  String get categoryArts => 'കല';

  @override
  String get trendingDramaSeries => 'ഡ്രാമ പരമ്പരകൾ';

  @override
  String get trendingComedyShows => 'കോമഡി ഷോകൾ';

  @override
  String get trendingPodcasts => 'പോഡ്കാസ്റ്റുകൾ';

  @override
  String get trendingMusicAlbums => 'സംഗീത ആൽബങ്ങൾ';

  @override
  String get trendingKidsStories => 'കുട്ടികളുടെ കഥകൾ';

  @override
  String get trendingDevotional => 'ഭക്തി';

  @override
  String get trendingNewsToday => 'ഇന്നത്തെ വാർത്ത';

  @override
  String get trendingSportsHighlights => 'കായിക ഹൈലൈറ്റുകൾ';

  @override
  String get languageEnglish => 'ഇംഗ്ലീഷ്';

  @override
  String get languageHindi => 'ഹിന്ദി';

  @override
  String get languagePunjabi => 'പഞ്ചാബി';

  @override
  String get languageHaryanvi => 'ഹരിയാൻവി';

  @override
  String get languageMarathi => 'മറാത്തി';

  @override
  String get languageGujarati => 'ഗുജറാത്തി';

  @override
  String get languageBengali => 'ബംഗാളി';

  @override
  String get languageTamil => 'തമിഴ്';

  @override
  String get languageTelugu => 'തെലുങ്ക്';

  @override
  String get languageKannada => 'കന്നഡ';

  @override
  String get languageMalayalam => 'മലയാളം';

  @override
  String get languageUrdu => 'ഉറുദു';

  @override
  String get pressBackToExit => 'പുറത്തുപോകാൻ വീണ്ടും പിന്നോട്ട് അമർത്തുക';

  @override
  String get exitDialogTitle => 'ആപ്പ് അടയ്ക്കണോ?';

  @override
  String get exitDialogBody => 'ശരിക്കും ആപ്പ് അടയ്ക്കാൻ ആഗ്രഹിക്കുന്നുണ്ടോ?';

  @override
  String get exitDialogConfirm => 'അടയ്ക്കുക';

  @override
  String get exitDialogCancel => 'റദ്ദാക്കുക';

  @override
  String get profileShareApp => 'Share App';

  @override
  String get profileShareAppMessage =>
      'Check out WebroFM - your go-to app for streaming shows and podcasts!';
}
