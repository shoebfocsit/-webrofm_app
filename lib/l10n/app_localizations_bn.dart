// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'ওয়েবরোএফএম';

  @override
  String get splashLoading => 'লোড হচ্ছে...';

  @override
  String get welcomeTitle => 'WebroFM-এ স্বাগতম';

  @override
  String get welcomeSubtitle => 'আপনাকে নাড়া দেয় এমন গল্প আবিষ্কার করুন';

  @override
  String get welcomeGetStarted => 'শুরু করুন';

  @override
  String get welcomeContinueAsGuest => 'অতিথি হিসেবে চালিয়ে যান';

  @override
  String get loginSearchCountries => 'দেশ অনুসন্ধান করুন';

  @override
  String get loginInvalidPhone => 'একটি বৈধ ফোন নম্বর লিখুন';

  @override
  String get loginRateLimitTitle => 'রেট লিমিট পূর্ণ হয়েছে';

  @override
  String get loginRateLimitContent =>
      'অনেক বেশি OTP চেষ্টা। অনুগ্রহ করে 1 ঘন্টা পরে আবার চেষ্টা করুন।';

  @override
  String get loginOk => 'ঠিক আছে';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'এই ঘন্টায় শুধুমাত্র $remainingটি চেষ্টা বাকি';
  }

  @override
  String get loginTitle => 'চালিয়ে যেতে লগইন করুন';

  @override
  String get loginSubtitle => 'শুরু করতে আপনার ফোন নম্বর লিখুন';

  @override
  String get loginPhoneHint => '(৫৫৫) ০০০-০০০০';

  @override
  String get loginIAgreeTo => 'আমি সম্মত ';

  @override
  String get loginTermsOfUse => 'ব্যবহারের শর্তাবলী';

  @override
  String get loginAnd => ' এবং ';

  @override
  String get loginPrivacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get loginSendOtp => 'OTP পাঠান';

  @override
  String get loginContinueAsGuest => 'অতিথি হিসেবে চালিয়ে যান';

  @override
  String get otpEnterCompleteCode => 'অনুগ্রহ করে সম্পূর্ণ 6-অঙ্কের কোড লিখুন';

  @override
  String get otpTitle => 'আপনার নম্বর যাচাই করুন';

  @override
  String get otpSubtitle => 'এতে পাঠানো কোড লিখুন';

  @override
  String get otpVerifyAndContinue => 'যাচাই করুন এবং চালিয়ে যান';

  @override
  String get otpDidntReceive => 'কোড পাননি? ';

  @override
  String get otpResend => 'OTP পুনরায় পাঠান';

  @override
  String get completeProfileTitle => 'আপনার প্রোফাইল সম্পূর্ণ করুন';

  @override
  String get completeProfileSubtitle =>
      'আপনার অভিজ্ঞতা ব্যক্তিগতকৃত করতে আমাদের সাহায্য করুন';

  @override
  String get completeProfileBasicInfo => 'মৌলিক তথ্য';

  @override
  String get completeProfileFullName => 'পুরো নাম *';

  @override
  String get completeProfileNameHint => 'জন ডো';

  @override
  String get completeProfileEmail => 'ইমেইল ঠিকানা';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'লিঙ্গ *';

  @override
  String get completeProfileDateOfBirth => 'জন্ম তারিখ';

  @override
  String get completeProfileDobHint => 'আপনার জন্ম তারিখ নির্বাচন করুন';

  @override
  String get completeProfileMale => 'পুরুষ';

  @override
  String get completeProfileFemale => 'নারী';

  @override
  String get completeProfileOther => 'অন্যান্য';

  @override
  String get completeProfileError =>
      'অনুগ্রহ করে আপনার নাম এবং লিঙ্গ নির্বাচন করুন';

  @override
  String get completeProfileSkip => 'এড়িয়ে যান';

  @override
  String get completeProfileContinue => 'চালিয়ে যান';

  @override
  String get interestTitle => 'আপনার আগ্রহ নির্বাচন করুন';

  @override
  String get interestSubtitle =>
      'ব্যক্তিগতকৃত সুপারিশের জন্য আপনি পছন্দ করেন এমন বিভাগ নির্বাচন করুন';

  @override
  String get interestSectionHeader => 'আপনার আগ্রহ নির্বাচন করুন';

  @override
  String get interestTapToSelect => 'নির্বাচন করতে ট্যাপ করুন';

  @override
  String get interestContinue => 'WebroFM-এ চালিয়ে যান';

  @override
  String get interestSkip => 'এড়িয়ে যান';

  @override
  String get registrationTitle => 'আপনার সম্পর্কে আমাদের বলুন';

  @override
  String get registrationSubtitle =>
      'আপনার অভিজ্ঞতা ব্যক্তিগতকৃত করতে সাহায্য করুন';

  @override
  String get registrationPersonalInfo => 'ব্যক্তিগত তথ্য';

  @override
  String get registrationFullName => 'পুরো নাম';

  @override
  String get registrationNameHint => 'জন ডো';

  @override
  String get registrationEmail => 'ইমেইল ঠিকানা';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'জন্ম তারিখ';

  @override
  String get registrationDobHint => 'আপনার জন্ম তারিখ নির্বাচন করুন';

  @override
  String get registrationInterestsHeader => 'আপনার আগ্রহ নির্বাচন করুন';

  @override
  String get registrationInterestsSubtitle =>
      'আপনি পছন্দ করেন এমন বিভাগ নির্বাচন করুন';

  @override
  String get registrationContinue => 'WebroFM-এ চালিয়ে যান';

  @override
  String get registrationNameError => 'অনুগ্রহ করে আপনার নাম লিখুন';

  @override
  String get homeContinueWatching => 'দেখা চালিয়ে যান';

  @override
  String get homeContinueListening => 'শোনা চালিয়ে যান';

  @override
  String get homeResume => 'পুনরায় শুরু করুন';

  @override
  String get homeNewArrivals => 'নতুন আগমন';

  @override
  String get homeSeeAll => 'সব দেখুন';

  @override
  String get homePopularNow => 'এখন জনপ্রিয়';

  @override
  String get homeNoShows => 'কোনো শো উপলব্ধ নেই';

  @override
  String get showDetailFailed => 'লোড করতে ব্যর্থ';

  @override
  String get showDetailNotFound => 'শো পাওয়া যায়নি';

  @override
  String showDetailShareText(Object title) {
    return 'WebroFM-এ $title দেখুন!';
  }

  @override
  String get showDetailDownloadStarted => 'ডাউনলোড শুরু হয়েছে';

  @override
  String get showDetailNoDescription => 'কোনো বিবরণ উপলব্ধ নেই।';

  @override
  String get showDetailReadLess => 'কম পড়ুন';

  @override
  String get showDetailReadMore => 'আরও পড়ুন';

  @override
  String get showDetailPlayLatest => 'সর্বশেষ পর্ব চালান';

  @override
  String get showDetailEpisodes => 'পর্ব';

  @override
  String get showDetailNoEpisodes => 'কোনো পর্ব উপলব্ধ নেই';

  @override
  String get showDetailMoreLikeThis => 'এটির মতো আরও';

  @override
  String get videoPlayerNoAudio => 'এই পর্বের জন্য কোনো অডিও উপলব্ধ নেই';

  @override
  String get videoPlayerLoading => 'ভিডিও লোড হচ্ছে...';

  @override
  String get videoPlayerNowPlaying => 'এখন চলছে';

  @override
  String get videoPlayerPaused => 'বিরাম দেওয়া হয়েছে';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'প্লেব্যাক ত্রুটি: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'ভিডিও প্লেয়ার';

  @override
  String get videoPlayerNext => 'পরবর্তী';

  @override
  String get videoPlayerAudio => 'অডিও';

  @override
  String get videoPlayerVideo => 'ভিডিও';

  @override
  String get showCardNew => 'নতুন';

  @override
  String get searchHint => 'শো, পর্ব অনুসন্ধান করুন...';

  @override
  String get searchTrending => 'ট্রেন্ডিং অনুসন্ধান';

  @override
  String get searchSuggested => 'আপনার জন্য সুপারিশকৃত';

  @override
  String get searchError => 'কিছু ভুল হয়েছে';

  @override
  String get searchNoResults => 'কোনো ফলাফল পাওয়া যায়নি';

  @override
  String get searchNoResultsSubtitle =>
      'আপনার অনুসন্ধান শব্দ সামঞ্জস্য করার চেষ্টা করুন';

  @override
  String get categoriesTitle => 'বিভাগ অন্বেষণ করুন';

  @override
  String categoriesShowCount(Object count) {
    return '$countটি শো';
  }

  @override
  String get categoryDetailFailed => 'লোড করতে ব্যর্থ';

  @override
  String get categoryDetailLoadMore => 'আরও লোড করুন';

  @override
  String get categoryDetailSortBy => 'সাজান';

  @override
  String get categoryDetailPopular => 'জনপ্রিয়';

  @override
  String get categoryDetailNewest => 'সর্বশেষ';

  @override
  String get categoryDetailTopRated => 'সর্বোচ্চ রেটেড';

  @override
  String get myListTitle => 'আমার তালিকা';

  @override
  String get myListSaved => 'সংরক্ষিত';

  @override
  String get myListWatchHistory => 'দেখার ইতিহাস';

  @override
  String get myListError => 'কিছু ভুল হয়েছে';

  @override
  String get myListNoSaved => 'এখনও কোনো সংরক্ষিত আইটেম নেই';

  @override
  String get myListNoHistory => 'এখনো কোনো দেখার ইতিহাস নেই';

  @override
  String get myListNoSavedSubtitle =>
      'অন্বেষণ শুরু করুন এবং আপনার পছন্দেরগুলি সংরক্ষণ করুন';

  @override
  String get myListNoHistorySubtitle =>
      'আপনার সাম্প্রতিক দেখা শোগুলি এখানে প্রদর্শিত হবে';

  @override
  String get myListExploreShows => 'শো অন্বেষণ করুন';

  @override
  String get myListRemoved => 'আমার তালিকা থেকে সরানো হয়েছে';

  @override
  String get myListLoginTitle => 'আপনার সংরক্ষিত শো দেখতে লগইন করুন';

  @override
  String get myListLoginSubtitle =>
      'আপনার প্রিয় শো সংরক্ষণ করুন এবং যেকোনো সময় অ্যাক্সেস করুন';

  @override
  String get profileTitle => 'প্রোফাইল';

  @override
  String get profileUser => 'ব্যবহারকারী';

  @override
  String get profileNoPhone => 'কোনো ফোন নেই';

  @override
  String get profileEditProfile => 'প্রোফাইল সম্পাদনা করুন';

  @override
  String get profileYourInterests => 'আপনার আগ্রহ';

  @override
  String get profileNoCategories => 'কোনো বিভাগ নির্বাচন করা হয়নি';

  @override
  String get profileDobLabel => 'জন্ম তারিখ';

  @override
  String get profileNotLoggedIn => 'আপনি লগইন করেননি';

  @override
  String get profileNotLoggedInSubtitle =>
      'আপনার প্রোফাইল, ডাউনলোড এবং ব্যক্তিগতকৃত সুপারিশ অ্যাক্সেস করতে সাইন ইন করুন।';

  @override
  String get profileLogin => 'লগইন';

  @override
  String get profileCollaboration => 'সহযোগিতা';

  @override
  String get profileSettings => 'সেটিংস ও পছন্দসমূহ';

  @override
  String get profileMyDownloads => 'আমার ডাউনলোড';

  @override
  String get profileTermsOfUse => 'ব্যবহারের শর্তাবলী';

  @override
  String get profilePrivacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get profileHelpFaq => 'সহায়তা ও FAQ';

  @override
  String get profileContactUs => 'আমাদের সাথে যোগাযোগ করুন';

  @override
  String get profileLogout => 'লগআউট';

  @override
  String get profileLogoutTitle => 'লগআউট';

  @override
  String get profileLogoutConfirm => 'আপনি কি নিশ্চিতভাবে লগআউট করতে চান?';

  @override
  String get profileCancel => 'বাতিল করুন';

  @override
  String get editProfileTitle => 'প্রোফাইল সম্পাদনা করুন';

  @override
  String get editProfileTapToChangePhoto => 'ছবি পরিবর্তন করতে ট্যাপ করুন';

  @override
  String get editProfileFullName => 'পুরো নাম';

  @override
  String get editProfileNameRequired => 'নাম প্রয়োজন';

  @override
  String get editProfileEmail => 'ইমেইল';

  @override
  String get editProfileEmailRequired => 'ইমেইল প্রয়োজন';

  @override
  String get editProfileInvalidEmail => 'অবৈধ ইমেইল';

  @override
  String get editProfileDob => 'জন্ম তারিখ';

  @override
  String get editProfilePhone => 'ফোন';

  @override
  String get editProfileCategoryPreferences => 'বিভাগ পছন্দসমূহ';

  @override
  String get editProfileAddMore => 'আরও যোগ করুন';

  @override
  String get editProfileAddCategory => 'বিভাগ যোগ করুন';

  @override
  String get editProfileSaveChanges => 'পরিবর্তন সংরক্ষণ করুন';

  @override
  String get editProfileUserDataNotAvailable => 'ব্যবহারকারী ডেটা উপলব্ধ নেই';

  @override
  String get editProfileUpdatedSuccess => 'প্রোফাইল সফলভাবে আপডেট হয়েছে';

  @override
  String get editProfileCancel => 'বাতিল করুন';

  @override
  String get editProfileSubmit => 'জমা দিন';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get settingsGeneral => 'সাধারণ';

  @override
  String get settingsAppLanguage => 'অ্যাপ ভাষা';

  @override
  String get settingsSubtitleLanguage => 'সাবটাইটেল ভাষা';

  @override
  String get settingsAppearancePlayback => 'চেহারা ও প্লেব্যাক';

  @override
  String get settingsColorTheme => 'রঙ থিম';

  @override
  String get settingsLight => 'হালকা';

  @override
  String get settingsDark => 'গাঢ়';

  @override
  String get settingsSystem => 'সিস্টেম';

  @override
  String get settingsAutoplayNext => 'পরবর্তী পর্ব অটোপ্লে';

  @override
  String get settingsDownloadQuality => 'ডাউনলোড মান';

  @override
  String get settingsLow => 'নিম্ন';

  @override
  String get settingsMedium => 'মাঝারি';

  @override
  String get settingsHigh => 'উচ্চ';

  @override
  String get settingsVeryHigh => 'অতি উচ্চ';

  @override
  String get settingsAccountPrivacy => 'অ্যাকাউন্ট ও গোপনীয়তা';

  @override
  String get settingsAgeRestriction => 'বয়স/বিষয়বস্তু সীমাবদ্ধতা';

  @override
  String get settingsNotifications => 'বিজ্ঞপ্তি';

  @override
  String get settingsDangerZone => 'বিপদ অঞ্চল';

  @override
  String get settingsDeleteAccount => 'আমার অ্যাকাউন্ট মুছুন';

  @override
  String get deleteAccountTitle => 'অ্যাকাউন্ট মুছুন';

  @override
  String get deleteAccountHeader => 'আমার অ্যাকাউন্ট মুছুন';

  @override
  String get deleteAccountWarning =>
      'এই কাজটি পূর্বাবস্থায় ফেরানো যাবে না। আপনার সমস্ত ডেটা স্থায়ীভাবে মুছে ফেলা হবে।';

  @override
  String get deleteAccountDataLoss => 'নিম্নলিখিত ডেটা হারিয়ে যাবে:';

  @override
  String get deleteAccountReason => 'মুছে ফেলার কারণ';

  @override
  String get deleteAccountSelectReason => 'একটি কারণ নির্বাচন করুন';

  @override
  String get deleteAccountNotUsing => 'আমি আর অ্যাপ ব্যবহার করি না';

  @override
  String get deleteAccountTooExpensive => 'খুব ব্যয়বহুল';

  @override
  String get deleteAccountPrivacy => 'গোপনীয়তা উদ্বেগ';

  @override
  String get deleteAccountTechnicalIssues => 'কারিগরি সমস্যা';

  @override
  String get deleteAccountFoundAlternative => 'একটি ভাল বিকল্প খুঁজে পেয়েছি';

  @override
  String get deleteAccountOther => 'অন্যান্য';

  @override
  String get deleteAccountProfileSettings => 'প্রোফাইল ও সেটিংস';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'আপনার প্রোফাইল তথ্য, পছন্দ এবং অ্যাপ সেটিংস স্থায়ীভাবে মুছে ফেলা হবে।';

  @override
  String get deleteAccountListeningHistory => 'শোনার ইতিহাস';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'আপনার শোনার ইতিহাস, অনুসন্ধানের ইতিহাস এবং কার্যকলাপ লগ মুছে ফেলা হবে।';

  @override
  String get deleteAccountSavedItems => 'সংরক্ষিত আইটেম';

  @override
  String get deleteAccountSavedItemsDesc =>
      'আপনার সমস্ত প্লেলিস্ট, পছন্দ এবং সংরক্ষিত বিষয়বস্তু সরিয়ে ফেলা হবে।';

  @override
  String get deleteAccountSubscriptions => 'সাবস্ক্রিপশন';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'যেকোনো সক্রিয় সাবস্ক্রিপশন বাতিল করা হবে এবং প্রিমিয়াম অ্যাক্সেস শেষ হবে।';

  @override
  String get deleteAccountDelete => 'আমার অ্যাকাউন্ট মুছুন';

  @override
  String get deleteAccountCancel => 'বাতিল করুন';

  @override
  String get deleteAccountOtpTitle => 'মুছে ফেলা যাচাই করুন';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return '$phone-এ পাঠানো OTP লিখুন';
  }

  @override
  String get deleteAccountOtpConfirm => 'মুছে ফেলা নিশ্চিত করুন';

  @override
  String get deleteAccountOtpResend => 'OTP পুনরায় পাঠান';

  @override
  String get deleteAccountOtpResent => 'OTP সফলভাবে পুনরায় পাঠানো হয়েছে';

  @override
  String get accountDeletedTitle => 'অ্যাকাউন্ট মুছে ফেলা হয়েছে';

  @override
  String get accountDeletedMessage =>
      'আপনার অ্যাকাউন্ট স্থায়ীভাবে মুছে ফেলা হয়েছে।\nআপনাকে হারিয়ে আমরা দুঃখিত।';

  @override
  String get accountDeletedBackToHome => 'হোমে ফিরে যান';

  @override
  String get contactUsTitle => 'আমাদের সাথে যোগাযোগ করুন';

  @override
  String get contactUsSubtitle => 'আমরা আপনার কাছ থেকে শুনতে চাই';

  @override
  String get contactUsSubject => 'বিষয়';

  @override
  String get contactUsMessageLabel => 'বার্তা';

  @override
  String get contactUsMessageHint => 'আপনার সমস্যা বা প্রশ্ন বর্ণনা করুন...';

  @override
  String get contactUsAddAttachment => 'সংযুক্তি যোগ করুন';

  @override
  String get contactUsQuickContact => 'দ্রুত যোগাযোগ';

  @override
  String get contactUsEmail => 'ইমেইল';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'কল';

  @override
  String get contactUsCallValue => '+১ (৫৫৫) ১২৩-৪৫৬৭';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'আমাদের সাথে চ্যাট করুন';

  @override
  String get contactUsSend => 'বার্তা পাঠান';

  @override
  String get contactUsSending => 'পাঠানো হচ্ছে...';

  @override
  String get contactUsNoMessage => 'অনুগ্রহ করে একটি বার্তা লিখুন';

  @override
  String get contactUsSent => 'বার্তা সফলভাবে পাঠানো হয়েছে!';

  @override
  String get contactUsGeneralInquiry => 'সাধারণ জিজ্ঞাসা';

  @override
  String get contactUsTechnicalSupport => 'কারিগরি সহায়তা';

  @override
  String get contactUsAccountIssue => 'অ্যাকাউন্ট সমস্যা';

  @override
  String get contactUsBillingQuestion => 'বিলিং প্রশ্ন';

  @override
  String get contactUsFeatureRequest => 'ফিচার অনুরোধ';

  @override
  String get contactUsBugReport => 'বাগ রিপোর্ট';

  @override
  String get helpFaqTitle => 'সহায়তা ও FAQ';

  @override
  String get helpFaqSearchHint => 'FAQ অনুসন্ধান করুন...';

  @override
  String get helpFaqNoResults => 'কোনো ফলাফল পাওয়া যায়নি';

  @override
  String get helpFaqStillNeedHelp => 'এখনও সাহায্য প্রয়োজন?';

  @override
  String get helpFaqContactUs => 'আমাদের সাথে যোগাযোগ করুন';

  @override
  String get helpFaqAll => 'সব';

  @override
  String get helpFaqAccount => 'অ্যাকাউন্ট';

  @override
  String get helpFaqPlayback => 'প্লেব্যাক';

  @override
  String get helpFaqBilling => 'বিলিং';

  @override
  String get helpFaqOther => 'অন্যান্য';

  @override
  String get helpFaq1Q => 'আমি কীভাবে আমার পাসওয়ার্ড রিসেট করব?';

  @override
  String get helpFaq1A =>
      'আপনি লগইন স্ক্রিন থেকে \'পাসওয়ার্ড ভুলে গেছেন\' ট্যাপ করে আপনার পাসওয়ার্ড রিসেট করতে পারেন। আপনার নিবন্ধিত ইমেইল বা ফোনে পাঠানো নির্দেশাবলী অনুসরণ করুন।';

  @override
  String get helpFaq2Q =>
      'আমি কি আমার সাবস্ক্রিপশন পরিকল্পনা পরিবর্তন করতে পারি?';

  @override
  String get helpFaq2A =>
      'হ্যাঁ, আপনার বর্তমান পরিকল্পনা দেখতে এবং পরিবর্তন করতে সেটিংস > সাবস্ক্রিপশনে যান। পরিবর্তনগুলি পরবর্তী বিলিং চক্র থেকে কার্যকর হবে।';

  @override
  String get helpFaq3Q => 'আমি কীভাবে আমার অ্যাকাউন্ট মুছব?';

  @override
  String get helpFaq3A =>
      'সেটিংস > বিপদ অঞ্চল > আমার অ্যাকাউন্ট মুছুন-এ যান। আপনার অ্যাকাউন্ট স্থায়ীভাবে মুছতে যাচাইকরণ ধাপগুলি অনুসরণ করুন।';

  @override
  String get helpFaq4Q => 'আমার ডাউনলোড করা ফাইলগুলি কোথায়?';

  @override
  String get helpFaq4A =>
      'ডাউনলোড করা পর্বগুলি অ্যাপের মধ্যে আমার ডাউনলোডের অধীনে সংরক্ষিত হয়। এগুলি অফলাইনে যেকোনো সময় শোনার জন্য উপলব্ধ।';

  @override
  String get helpFaq5Q => 'আমি কীভাবে আমার প্রোফাইল তথ্য আপডেট করব?';

  @override
  String get helpFaq5A =>
      'আপনার নাম, ইমেইল, জন্ম তারিখ এবং প্রোফাইল ছবি আপডেট করতে প্রোফাইল > প্রোফাইল সম্পাদনা করুন-এ যান।';

  @override
  String get helpFaq6Q => 'কেন আমার অডিও বাজছে না?';

  @override
  String get helpFaq6A =>
      'আপনার ইন্টারনেট সংযোগ পরীক্ষা করুন এবং অ্যাপ পুনরায় চালু করার চেষ্টা করুন। যদি সমস্যা থেকে যায়, সেটিংস থেকে অ্যাপ ক্যাশে সাফ করার চেষ্টা করুন।';

  @override
  String get helpFaq7Q => 'আমি কীভাবে রিফান্ড পাব?';

  @override
  String get helpFaq7A =>
      'আপনার লেনদেনের বিবরণ সহ support@webrofm.com-এ আমাদের সহায়তা দলের সাথে যোগাযোগ করুন। আমরা ৫-৭ কার্যদিবসের মধ্যে আপনার রিফান্ড প্রক্রিয়া করব।';

  @override
  String get helpFaq8Q => 'আমি কীভাবে একটি বাগ রিপোর্ট করব?';

  @override
  String get helpFaq8A =>
      'আপনি সেটিংসে আমাদের সাথে যোগাযোগ করুন বিভাগের মাধ্যমে বাগ রিপোর্ট করতে পারেন। অনুগ্রহ করে সমস্যাটি পুনরায় তৈরি করার ধাপ এবং আপনার ডিভাইসের তথ্য অন্তর্ভুক্ত করুন।';

  @override
  String get privacyPolicyTitle => 'গোপনীয়তা নীতি';

  @override
  String get privacyPolicyLastUpdated => 'সর্বশেষ আপডেট: ২২ জুলাই ২০২৬';

  @override
  String get privacyPolicyCollection => 'সংগ্রহ';

  @override
  String get privacyPolicyCollectionTitle => 'আমরা কী তথ্য সংগ্রহ করি';

  @override
  String get privacyPolicyCollectionText =>
      'আমরা আপনি সরাসরি প্রদান করেন এমন তথ্য সংগ্রহ করি, যেমন আপনার নাম, ইমেইল ঠিকানা, ফোন নম্বর এবং প্রোফাইল ছবি। আপনি যখন আমাদের পরিষেবাগুলি ব্যবহার করেন তখন আমরা ডিভাইস তথ্য, ব্যবহারের ডেটা এবং শোনার পছন্দ সহ কিছু তথ্য স্বয়ংক্রিয়ভাবে সংগ্রহ করি।';

  @override
  String get privacyPolicyUsage => 'ব্যবহার';

  @override
  String get privacyPolicyUsageTitle => 'আমরা কীভাবে আপনার তথ্য ব্যবহার করি';

  @override
  String get privacyPolicyUsageText =>
      'আমরা আমাদের স্ট্রিমিং পরিষেবা প্রদান, বজায় রাখা এবং উন্নত করতে, আপনার অভিজ্ঞতা ব্যক্তিগতকৃত করতে, আপনাকে আপডেট এবং প্রচারমূলক সামগ্রী পাঠাতে এবং আমাদের প্ল্যাটফর্মের সুরক্ষা নিশ্চিত করতে সংগৃহীত তথ্য ব্যবহার করি।';

  @override
  String get privacyPolicySharing => 'শেয়ারিং';

  @override
  String get privacyPolicySharingTitle => 'তথ্য শেয়ারিং';

  @override
  String get privacyPolicySharingText =>
      'আমরা আপনার ব্যক্তিগত তথ্য বিক্রি করি না। আমরা আপনার ডেটা বিশ্বস্ত পরিষেবা প্রদানকারীদের সাথে শেয়ার করতে পারি যারা আমাদের প্ল্যাটফর্ম পরিচালনায় সহায়তা করে, কঠোর গোপনীয়তা চুক্তির সাপেক্ষে।';

  @override
  String get privacyPolicySecurity => 'নিরাপত্তা';

  @override
  String get privacyPolicySecurityTitle => 'ডেটা নিরাপত্তা';

  @override
  String get privacyPolicySecurityText =>
      'আমরা আপনার ব্যক্তিগত তথ্য সুরক্ষিত করতে শিল্প-মানক নিরাপত্তা ব্যবস্থা প্রয়োগ করি, যার মধ্যে ট্রানজিট এবং রেস্টে এনক্রিপশন, নিয়মিত নিরাপত্তা অডিট এবং অ্যাক্সেস নিয়ন্ত্রণ অন্তর্ভুক্ত।';

  @override
  String get privacyPolicyRights => 'অধিকার';

  @override
  String get privacyPolicyRightsTitle => 'আপনার অধিকার এবং পছন্দ';

  @override
  String get privacyPolicyRightsText =>
      'আপনার অ্যাকাউন্ট সেটিংসের মাধ্যমে যেকোনো সময় আপনার ব্যক্তিগত তথ্য অ্যাক্সেস, আপডেট বা মুছে ফেলার অধিকার আপনার আছে। আপনি যেকোনো গোপনীয়তা-সম্পর্কিত অনুরোধের জন্য সরাসরি আমাদের সাথে যোগাযোগ করতে পারেন।';

  @override
  String get termsOfUseTitle => 'ব্যবহারের শর্তাবলী';

  @override
  String get termsOfUseUsage => 'ব্যবহার';

  @override
  String get termsOfUseUsageTitle => 'ব্যবহার নির্দেশিকা';

  @override
  String get termsOfUseUsageText =>
      'WebroFM ব্যবহার করে, আপনি শুধুমাত্র আইনি উদ্দেশ্যে পরিষেবা ব্যবহার করতে সম্মত হন। আপনি আমাদের প্ল্যাটফর্ম থেকে কোনো বিষয়বস্তু পূর্ব লিখিত সম্মতি ছাড়া পরিবর্তন, বিতরণ বা পুনরুত্পাদন করতে পারবেন না। এই শর্তাবলী লঙ্ঘনের জন্য অ্যাক্সেস স্থগিত বা বন্ধ করার অধিকার আমরা সংরক্ষণ করি।';

  @override
  String get termsOfUseAccounts => 'অ্যাকাউন্ট';

  @override
  String get termsOfUseAccountsTitle => 'ব্যবহারকারী অ্যাকাউন্ট';

  @override
  String get termsOfUseAccountsText =>
      'আপনার অ্যাকাউন্টের পরিচয়পত্রের গোপনীয়তা বজায় রাখার জন্য আপনি দায়ী। অ্যাকাউন্ট তৈরি করার সময় আপনাকে সঠিক এবং সম্পূর্ণ তথ্য প্রদান করতে হবে। আপনার অ্যাকাউন্টের কোনো অননুমোদিত ব্যবহার সম্পর্কে আমাদের অবিলম্বে জানাতে হবে।';

  @override
  String get termsOfUseContent => 'বিষয়বস্তু';

  @override
  String get termsOfUseContentTitle => 'বিষয়বস্তু ও বৌদ্ধিক সম্পত্তি';

  @override
  String get termsOfUseContentText =>
      'WebroFM-এ উপলব্ধ সমস্ত বিষয়বস্তু, অডিও স্ট্রিম, ভিডিও এবং আর্টওয়ার্ক সহ, কপিরাইট এবং বৌদ্ধিক সম্পত্তি আইন দ্বারা সুরক্ষিত। ব্যবহারকারীরা স্পষ্ট অনুমতি ছাড়া বিষয়বস্তু ডাউনলোড, রেকর্ড বা পুনর্বিতরণ করতে পারবেন না।';

  @override
  String get termsOfUseLiability => 'দায়';

  @override
  String get termsOfUseLiabilityTitle => 'দায়বদ্ধতার সীমাবদ্ধতা';

  @override
  String get termsOfUseLiabilityText =>
      'আপনার পরিষেবা ব্যবহার থেকে উদ্ভূত কোনো পরোক্ষ, আনুষঙ্গিক বা ফলস্বরূপ ক্ষতির জন্য WebroFM দায়ী থাকবে না। আমাদের মোট দায় গত ১২ মাসে আপনি পরিষেবার জন্য প্রদত্ত পরিমাণের বেশি হবে না।';

  @override
  String get notificationsTitle => 'বিজ্ঞপ্তি';

  @override
  String get notificationsEmptyTitle => 'কোনো বিজ্ঞপ্তি নেই';

  @override
  String get notificationsEmptySubtitle =>
      'আপনি সম্পূর্ণ আপডেট! আপডেটের জন্য পরে আবার চেক করুন।';

  @override
  String get downloadsTitle => 'আমার ডাউনলোড';

  @override
  String get downloadsEmptyTitle => 'এখনও কোনো ডাউনলোড নেই';

  @override
  String get downloadsEmptySubtitle =>
      'আপনার ডাউনলোড করা পর্বগুলি এখানে প্রদর্শিত হবে যাতে আপনি যেকোনো সময় অফলাইনে শুনতে পারেন।';

  @override
  String get downloadsBrowseShows => 'শো ব্রাউজ করুন';

  @override
  String get premiumTitle => 'প্রিমিয়াম';

  @override
  String get collabTitle => 'সহযোগিতা';

  @override
  String get collabMyStories => 'আমার গল্প';

  @override
  String get collabMySponsorships => 'আমার স্পনসরশিপ';

  @override
  String get collabNoStories => 'এখনও কোনো গল্প জমা দেওয়া হয়নি।';

  @override
  String get collabNoSponsorships => 'এখনও কোনো স্পনসরশিপ জমা দেওয়া হয়নি।';

  @override
  String get collabApproved => 'অনুমোদিত';

  @override
  String get collabRejected => 'প্রত্যাখ্যাত';

  @override
  String get collabReviewing => 'পর্যালোচনা করা হচ্ছে';

  @override
  String get collabPending => 'মুলতুবি';

  @override
  String get collabShareYourStory => 'আপনার গল্প শেয়ার করুন';

  @override
  String get collabShareYourStorySubtitle =>
      'ফিচার হওয়ার সুযোগের জন্য আপনার মূল গল্প জমা দিন।';

  @override
  String get collabSubmitStory => 'গল্প জমা দিন';

  @override
  String get collabSponsorshipAd => 'স্পনসরশিপ / বিজ্ঞাপন';

  @override
  String get collabSponsorshipSubtitle =>
      'স্পনসরশিপের জন্য আপনার ব্র্যান্ড বা ব্যবসা জমা দিন।';

  @override
  String get collabSubmitAd => 'বিজ্ঞাপন জমা দিন';

  @override
  String get collabDialogStoryTitle => 'আপনার গল্প জমা দিন';

  @override
  String get collabStoryTitle => 'গল্পের শিরোনাম';

  @override
  String get collabStoryTitleHint => 'আপনার গল্পের শিরোনাম লিখুন';

  @override
  String get collabStoryContent => 'গল্পের বিষয়বস্তু';

  @override
  String get collabStoryContentHint => 'এখানে আপনার গল্প লিখুন...';

  @override
  String get collabCancel => 'বাতিল করুন';

  @override
  String get collabSubmit => 'জমা দিন';

  @override
  String get collabDialogAdTitle => 'বিজ্ঞাপন জমা দিন';

  @override
  String get collabBrandName => 'ব্র্যান্ড নাম';

  @override
  String get collabBrandNameHint => 'আপনার ব্র্যান্ড/ব্যবসার নাম';

  @override
  String get collabDescription => 'বিবরণ';

  @override
  String get collabDescriptionHint => 'আপনার বিজ্ঞাপন বর্ণনা করুন';

  @override
  String get collabTargetUrl => 'লক্ষ্য URL (ঐচ্ছিক)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'ছবি নির্বাচিত';

  @override
  String get collabUploadAdVisual => 'বিজ্ঞাপন ভিজ্যুয়াল আপলোড করুন';

  @override
  String get collabStatusRunning => 'চলমান';

  @override
  String get collabStatusExpired => 'মেয়াদোত্তীর্ণ';

  @override
  String get languagesAppLanguage => 'অ্যাপ ভাষা';

  @override
  String get languagesSubtitleLanguage => 'সাবটাইটেল ভাষা';

  @override
  String get bottomNavHome => 'হোম';

  @override
  String get bottomNavSearch => 'অনুসন্ধান';

  @override
  String get bottomNavCategories => 'বিভাগ';

  @override
  String get bottomNavMyList => 'আমার তালিকা';

  @override
  String get bottomNavProfile => 'প্রোফাইল';

  @override
  String get networkOffline => 'অফলাইন মোড';

  @override
  String get networkDownload => 'ডাউনলোড মোড';

  @override
  String get networkOfflineSnackbar =>
      'অফলাইন মোড চালু\nডাউনলোড কন্টেন্ট অন্বেষণ শুরু করুন';

  @override
  String get networkDismiss => 'খারিজ করুন';

  @override
  String get loadingPleaseWait => 'অনুগ্রহ করে অপেক্ষা করুন...';

  @override
  String get commonRetry => 'আবার চেষ্টা করুন';

  @override
  String get guestTimerTitle => 'ফ্রি সময় শেষ!';

  @override
  String get guestTimerBody =>
      'সমস্ত সামগ্রী অ্যাক্সেস করতে লগইন করুন।\nএটি আপনার জন্য ফ্রি!';

  @override
  String get freeLimitTitle => 'ফ্রি সীমা পূরণ হয়েছে';

  @override
  String get freeLimitBody =>
      'আপনি আপনার 1 মিনিটের ফ্রি শোনার সীমা ব্যবহার করেছেন। সম্পূর্ণ এপিসোড শুনতে চালিয়ে যেতে অনুগ্রহ করে লগইন বা সাইন আপ করুন।';

  @override
  String get guestTimerLater => 'পরে';

  @override
  String get guestTimerLogin => 'লগইন / সাইন আপ';

  @override
  String get errorDataError =>
      'একটি ডেটা ত্রুটি হয়েছে। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get errorInvalidData => 'অবৈধ ডেটা ফর্ম্যাট প্রাপ্ত হয়েছে।';

  @override
  String get errorUnexpected => 'একটি অপ্রত্যাশিত ত্রুটি ঘটেছে।';

  @override
  String get errorTimeout =>
      'সংযোগের সময় শেষ। অনুগ্রহ করে আপনার ইন্টারনেট সংযোগ পরীক্ষা করুন।';

  @override
  String get errorNoInternet =>
      'ইন্টারনেট সংযোগ নেই। অনুগ্রহ করে আপনার নেটওয়ার্ক সেটিংস পরীক্ষা করুন।';

  @override
  String get errorCancelled => 'অনুরোধ বাতিল করা হয়েছে।';

  @override
  String get errorSecurity =>
      'সংযোগ নিরাপত্তা ত্রুটি। অনুগ্রহ করে আপনার অ্যাপ আপডেট করুন।';

  @override
  String get errorNetwork => 'একটি অপ্রত্যাশিত নেটওয়ার্ক ত্রুটি ঘটেছে।';

  @override
  String get errorInvalidRequest =>
      'অবৈধ অনুরোধ। অনুগ্রহ করে আপনার ইনপুট যাচাই করুন।';

  @override
  String get errorSessionExpired =>
      'সেশন শেষ হয়েছে। অনুগ্রহ করে পুনরায় সাইন ইন করুন।';

  @override
  String get errorPermissionDenied => 'এই কাজটি করার জন্য আপনার অনুমতি নেই।';

  @override
  String get errorNotFound => 'অনুরোধকৃত সম্পদ পাওয়া যায়নি।';

  @override
  String get errorConflict =>
      'দ্বন্দ্ব সনাক্ত করা হয়েছে। সম্পদটি আপডেট করা হতে পারে।';

  @override
  String get errorValidationFailed =>
      'বৈধকরণ ব্যর্থ হয়েছে। অনুগ্রহ করে আপনার ইনপুট পরীক্ষা করুন।';

  @override
  String get errorTooManyRequests =>
      'অনেক বেশি অনুরোধ। অনুগ্রহ করে পরে আবার চেষ্টা করুন।';

  @override
  String get errorServer => 'সার্ভার ত্রুটি। অনুগ্রহ করে পরে আবার চেষ্টা করুন।';

  @override
  String get errorServiceUnavailable =>
      'পরিষেবা সাময়িকভাবে অনুপলব্ধ। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get errorUnderMaintenance =>
      'পরিষেবা রক্ষণাবেক্ষণের অধীনে রয়েছে। অনুগ্রহ করে পরে আবার চেষ্টা করুন।';

  @override
  String errorGeneric(Object code) {
    return 'কিছু ভুল হয়েছে। (ত্রুটি $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'সংযোগের সময় শেষ। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get errorNoConnection => 'ইন্টারনেট সংযোগ নেই।';

  @override
  String errorServerWithCode(Object code) {
    return 'সার্ভার ত্রুটি ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'কিছু ভুল হয়েছে। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get pageNotFound => 'পৃষ্ঠা পাওয়া যায়নি';

  @override
  String get pageNotFoundMessage => 'আপনি যে পৃষ্ঠাটি খুঁজছেন তা বিদ্যমান নেই।';

  @override
  String get goHome => 'হোমে যান';

  @override
  String get relativeTimeJustNow => 'এইমাত্র';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '$minutes মি আগে';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '$hours ঘ ago';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '$days দি আগে';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '$weeks সপ আগে';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '$months মা আগে';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '$years ব আগে';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return '$minutes মি মধ্যে';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return '$hours ঘ মধ্যে';
  }

  @override
  String relativeTimeInDay(Object days) {
    return '$days দি মধ্যে';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '$hours ঘ $minutes মি';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '$minutes মি $seconds সে';
  }

  @override
  String fileSizeBytes(Object size) {
    return '$size বা';
  }

  @override
  String fileSizeKB(Object size) {
    return '$size কেবি';
  }

  @override
  String fileSizeMB(Object size) {
    return '$size এমবি';
  }

  @override
  String fileSizeGB(Object size) {
    return '$size জিবি';
  }

  @override
  String countViewsM(Object count) {
    return '$count মি';
  }

  @override
  String countViewsK(Object count) {
    return '$count হা';
  }

  @override
  String episodeCount(Object count) {
    return '$count এপি';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'S$season E$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'সিজন $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return 'No episodes available in $language';
  }

  @override
  String get contentDisclaimer =>
      'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.';

  @override
  String get categoryDrama => 'নাটক';

  @override
  String get categoryComedy => 'কমেডি';

  @override
  String get categoryPodcasts => 'পডকাস্ট';

  @override
  String get categoryMusic => 'সংগীত';

  @override
  String get categoryKids => 'শিশু';

  @override
  String get categoryDevotional => 'ভক্তিমূলক';

  @override
  String get categoryNews => 'সংবাদ';

  @override
  String get categorySports => 'খেলাধুলা';

  @override
  String get categoryTechnology => 'প্রযুক্তি';

  @override
  String get categoryEducation => 'শিক্ষা';

  @override
  String get categoryBusiness => 'ব্যবসা';

  @override
  String get categoryHealth => 'স্বাস্থ্য';

  @override
  String get categoryScience => 'বিজ্ঞান';

  @override
  String get categoryArts => 'শিল্প';

  @override
  String get trendingDramaSeries => 'নাটক ধারাবাহিক';

  @override
  String get trendingComedyShows => 'কমেডি শো';

  @override
  String get trendingPodcasts => 'পডকাস্ট';

  @override
  String get trendingMusicAlbums => 'সংগীত অ্যালবাম';

  @override
  String get trendingKidsStories => 'শিশুদের গল্প';

  @override
  String get trendingDevotional => 'ভক্তিমূলক';

  @override
  String get trendingNewsToday => 'আজকের খবর';

  @override
  String get trendingSportsHighlights => 'ক্রীড়া হাইলাইটস';

  @override
  String get languageEnglish => 'ইংরেজি';

  @override
  String get languageHindi => 'হিন্দি';

  @override
  String get languagePunjabi => 'পাঞ্জাবি';

  @override
  String get languageHaryanvi => 'হরিয়ানভি';

  @override
  String get languageMarathi => 'মারাঠি';

  @override
  String get languageGujarati => 'গুজরাটি';

  @override
  String get languageBengali => 'বাংলা';

  @override
  String get languageTamil => 'তামিল';

  @override
  String get languageTelugu => 'তেলেগু';

  @override
  String get languageKannada => 'কন্নড়';

  @override
  String get languageMalayalam => 'মালয়ালম';

  @override
  String get languageUrdu => 'উর্দু';

  @override
  String get pressBackToExit => 'বাইরে যেতে আবার ব্যাক চাপুন';

  @override
  String get exitDialogTitle => 'অ্যাপ বন্ধ করবেন?';

  @override
  String get exitDialogBody => 'আপনি কি নিশ্চিত অ্যাপ বন্ধ করতে চান?';

  @override
  String get exitDialogConfirm => 'বন্ধ করুন';

  @override
  String get exitDialogCancel => 'বাতিল করুন';

  @override
  String get profileShareApp => 'Share App';

  @override
  String get profileShareAppMessage =>
      'Check out WebroFM - your go-to app for streaming shows and podcasts!';
}
