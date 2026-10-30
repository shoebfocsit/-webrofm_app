// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'ویبرو ایف ایم';

  @override
  String get splashLoading => 'لوڈ ہو رہا ہے...';

  @override
  String get welcomeTitle => 'ویبرو ایف ایم میں خوش آمدید';

  @override
  String get welcomeSubtitle => 'ایسی کہانیاں دریافت کریں جو آپ کو حرکت دیں';

  @override
  String get welcomeGetStarted => 'شروع کریں';

  @override
  String get welcomeContinueAsGuest => 'بطور مہمان جاری رکھیں';

  @override
  String get loginSearchCountries => 'ممالک تلاش کریں';

  @override
  String get loginInvalidPhone => 'براہ کرم ایک درست فون نمبر درج کریں';

  @override
  String get loginRateLimitTitle => 'شرح کی حد پہنچ گئی';

  @override
  String get loginRateLimitContent =>
      'OTP کی بہت زیادہ کوششیں۔ براہ کرم 1 گھنٹہ بعد دوبارہ کوشش کریں۔';

  @override
  String get loginOk => 'ٹھیک ہے';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'اس گھنٹے میں صرف $remaining کوشش باقی ہے';
  }

  @override
  String get loginTitle => 'جاری رکھنے کے لیے لاگ ان کریں';

  @override
  String get loginSubtitle => 'شروع کرنے کے لیے اپنا فون نمبر درج کریں';

  @override
  String get loginPhoneHint => '(555) 000-0000';

  @override
  String get loginIAgreeTo => 'میں اس سے اتفاق کرتا ہوں ';

  @override
  String get loginTermsOfUse => 'استعمال کی شرائط';

  @override
  String get loginAnd => ' اور ';

  @override
  String get loginPrivacyPolicy => 'رازداری کی پالیسی';

  @override
  String get loginSendOtp => 'OTP بھیجیں';

  @override
  String get loginContinueAsGuest => 'بطور مہمان جاری رکھیں';

  @override
  String get otpEnterCompleteCode => 'براہ کرم مکمل 6 ہندسوں کا کوڈ درج کریں';

  @override
  String get otpTitle => 'اپنا نمبر تصدیق کریں';

  @override
  String get otpSubtitle => 'اس پر بھیجا گیا کوڈ درج کریں';

  @override
  String get otpVerifyAndContinue => 'تصدیق کریں اور جاری رکھیں';

  @override
  String get otpDidntReceive => 'کوڈ موصول نہیں ہوا؟ ';

  @override
  String get otpResend => 'OTP دوبارہ بھیجیں';

  @override
  String get completeProfileTitle => 'اپنی پروفائل مکمل کریں';

  @override
  String get completeProfileSubtitle =>
      'اپنے تجربے کو ذاتی بنانے میں ہماری مدد کریں';

  @override
  String get completeProfileBasicInfo => 'بنیادی معلومات';

  @override
  String get completeProfileFullName => 'مکمل نام *';

  @override
  String get completeProfileNameHint => 'جان ڈو';

  @override
  String get completeProfileEmail => 'ای میل ایڈریس';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'جنس *';

  @override
  String get completeProfileDateOfBirth => 'تاریخ پیدائش';

  @override
  String get completeProfileDobHint => 'اپنی تاریخ پیدائش منتخب کریں';

  @override
  String get completeProfileMale => 'مرد';

  @override
  String get completeProfileFemale => 'عورت';

  @override
  String get completeProfileOther => 'دیگر';

  @override
  String get completeProfileError => 'براہ کرم اپنا نام اور جنس درج کریں';

  @override
  String get completeProfileSkip => 'چھوڑیں';

  @override
  String get completeProfileContinue => 'جاری رکھیں';

  @override
  String get interestTitle => 'اپنی دلچسپیاں منتخب کریں';

  @override
  String get interestSubtitle =>
      'ذاتی سفارشات حاصل کرنے کے لیے وہ زمرے منتخب کریں جو آپ پسند کرتے ہیں';

  @override
  String get interestSectionHeader => 'اپنی دلچسپیاں منتخب کریں';

  @override
  String get interestTapToSelect => 'منتخب کرنے کے لیے تھپتھپائیں';

  @override
  String get interestContinue => 'ویبرو ایف ایم پر جاری رکھیں';

  @override
  String get interestSkip => 'چھوڑیں';

  @override
  String get registrationTitle => 'اپنے بارے میں ہمیں بتائیں';

  @override
  String get registrationSubtitle =>
      'اپنے تجربے کو ذاتی بنانے میں ہماری مدد کریں';

  @override
  String get registrationPersonalInfo => 'ذاتی معلومات';

  @override
  String get registrationFullName => 'مکمل نام';

  @override
  String get registrationNameHint => 'جان ڈو';

  @override
  String get registrationEmail => 'ای میل ایڈریس';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'تاریخ پیدائش';

  @override
  String get registrationDobHint => 'اپنی تاریخ پیدائش منتخب کریں';

  @override
  String get registrationInterestsHeader => 'اپنی دلچسپیاں منتخب کریں';

  @override
  String get registrationInterestsSubtitle =>
      'وہ زمرے منتخب کریں جو آپ پسند کرتے ہیں';

  @override
  String get registrationContinue => 'ویبرو ایف ایم پر جاری رکھیں';

  @override
  String get registrationNameError => 'براہ کرم اپنا نام درج کریں';

  @override
  String get homeContinueWatching => 'دیکھنا جاری رکھیں';

  @override
  String get homeContinueListening => 'سننا جاری رکھیں';

  @override
  String get homeResume => 'دوبارہ شروع کریں';

  @override
  String get homeNewArrivals => 'نئی آمد';

  @override
  String get homeSeeAll => 'سب دیکھیں';

  @override
  String get homePopularNow => 'ابھی مقبول';

  @override
  String get homeNoShows => 'کوئی شو دستیاب نہیں';

  @override
  String get showDetailFailed => 'لوڈ کرنے میں ناکام';

  @override
  String get showDetailNotFound => 'شو نہیں ملا';

  @override
  String showDetailShareText(Object title) {
    return 'ویبرو ایف ایم پر $title دیکھیں!';
  }

  @override
  String get showDetailDownloadStarted => 'ڈاؤن لوڈ شروع ہو گیا';

  @override
  String get showDetailNoDescription => 'کوئی تفصیل دستیاب نہیں۔';

  @override
  String get showDetailReadLess => 'کم پڑھیں';

  @override
  String get showDetailReadMore => 'مزید پڑھیں';

  @override
  String get showDetailPlayLatest => 'تازہ ترین ایپی سوڈ چلائیں';

  @override
  String get showDetailEpisodes => 'ایپی سوڈز';

  @override
  String get showDetailNoEpisodes => 'کوئی ایپی سوڈ دستیاب نہیں';

  @override
  String get showDetailMoreLikeThis => 'اس جیسے مزید';

  @override
  String get videoPlayerNoAudio => 'اس ایپی سوڈ کے لیے آڈیو دستیاب نہیں';

  @override
  String get videoPlayerLoading => 'ویڈیو لوڈ ہو رہی ہے...';

  @override
  String get videoPlayerNowPlaying => 'اب چل رہا ہے';

  @override
  String get videoPlayerPaused => 'روکا ہوا';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'پلے بیک میں خرابی: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'ویڈیو پلیئر';

  @override
  String get videoPlayerNext => 'اگلا';

  @override
  String get videoPlayerAudio => 'آڈیو';

  @override
  String get videoPlayerVideo => 'ویڈیو';

  @override
  String get showCardNew => 'نیا';

  @override
  String get searchHint => 'شوز، ایپی سوڈز تلاش کریں...';

  @override
  String get searchTrending => 'رائج تلاشیاں';

  @override
  String get searchSuggested => 'آپ کے لیے تجویز کردہ';

  @override
  String get searchError => 'کچھ غلط ہو گیا';

  @override
  String get searchNoResults => 'کوئی نتیجہ نہیں ملا';

  @override
  String get searchNoResultsSubtitle =>
      'اپنی تلاش کے الفاظ کو ایڈجسٹ کرنے کی کوشش کریں';

  @override
  String get categoriesTitle => 'زمرے دریافت کریں';

  @override
  String categoriesShowCount(Object count) {
    return '$count شوز';
  }

  @override
  String get categoryDetailFailed => 'لوڈ کرنے میں ناکام';

  @override
  String get categoryDetailLoadMore => 'مزید لوڈ کریں';

  @override
  String get categoryDetailSortBy => 'ترتیب دیں';

  @override
  String get categoryDetailPopular => 'مقبول';

  @override
  String get categoryDetailNewest => 'تازہ ترین';

  @override
  String get categoryDetailTopRated => 'سب سے زیادہ درجہ بندی';

  @override
  String get myListTitle => 'میری فہرست';

  @override
  String get myListSaved => 'محفوظ کردہ';

  @override
  String get myListWatchHistory => 'دیکھنے کی تاریخ';

  @override
  String get myListError => 'کچھ غلط ہو گیا';

  @override
  String get myListNoSaved => 'ابھی تک کوئی آئٹم محفوظ نہیں';

  @override
  String get myListNoHistory => 'ابھی تک کوئی دیکھنے کی تاریخ نہیں';

  @override
  String get myListNoSavedSubtitle =>
      'دریافت شروع کریں اور اپنے پسندیدہ محفوظ کریں';

  @override
  String get myListNoHistorySubtitle =>
      'آپ کے حال ہی میں دیکھے گئے شوز یہاں ظاہر ہوں گے';

  @override
  String get myListExploreShows => 'شوز دریافت کریں';

  @override
  String get myListRemoved => 'میری فہرست سے ہٹا دیا گیا';

  @override
  String get myListLoginTitle =>
      'اپنے محفوظ کردہ شوز دیکھنے کے لیے لاگ ان کریں';

  @override
  String get myListLoginSubtitle =>
      'اپنے پسندیدہ شوز محفوظ کریں اور انہیں کسی بھی وقت رسائی حاصل کریں';

  @override
  String get profileTitle => 'پروفائل';

  @override
  String get profileUser => 'صارف';

  @override
  String get profileNoPhone => 'کوئی فون نہیں';

  @override
  String get profileEditProfile => 'پروفائل میں ترمیم کریں';

  @override
  String get profileYourInterests => 'آپ کی دلچسپیاں';

  @override
  String get profileNoCategories => 'کوئی زمرہ منتخب نہیں';

  @override
  String get profileDobLabel => 'تاریخ پیدائش';

  @override
  String get profileNotLoggedIn => 'آپ لاگ ان نہیں ہیں';

  @override
  String get profileNotLoggedInSubtitle =>
      'اپنی پروفائل، ڈاؤن لوڈز اور ذاتی سفارشات تک رسائی کے لیے سائن ان کریں۔';

  @override
  String get profileLogin => 'لاگ ان';

  @override
  String get profileCollaboration => 'تعاون';

  @override
  String get profileSettings => 'ترتیبات اور ترجیحات';

  @override
  String get profileMyDownloads => 'میرے ڈاؤن لوڈز';

  @override
  String get profileTermsOfUse => 'استعمال کی شرائط';

  @override
  String get profilePrivacyPolicy => 'رازداری کی پالیسی';

  @override
  String get profileHelpFaq => 'مدد اور اکثر پوچھے گئے سوالات';

  @override
  String get profileContactUs => 'ہم سے رابطہ کریں';

  @override
  String get profileLogout => 'لاگ آؤٹ';

  @override
  String get profileLogoutTitle => 'لاگ آؤٹ';

  @override
  String get profileLogoutConfirm => 'کیا آپ واقعی لاگ آؤٹ کرنا چاہتے ہیں؟';

  @override
  String get profileCancel => 'منسوخ کریں';

  @override
  String get editProfileTitle => 'پروفائل میں ترمیم کریں';

  @override
  String get editProfileTapToChangePhoto =>
      'تصویر تبدیل کرنے کے لیے تھپتھپائیں';

  @override
  String get editProfileFullName => 'مکمل نام';

  @override
  String get editProfileNameRequired => 'نام ضروری ہے';

  @override
  String get editProfileEmail => 'ای میل';

  @override
  String get editProfileEmailRequired => 'ای میل ضروری ہے';

  @override
  String get editProfileInvalidEmail => 'غلط ای میل';

  @override
  String get editProfileDob => 'تاریخ پیدائش';

  @override
  String get editProfilePhone => 'فون';

  @override
  String get editProfileCategoryPreferences => 'زمرہ کی ترجیحات';

  @override
  String get editProfileAddMore => 'مزید شامل کریں';

  @override
  String get editProfileAddCategory => 'زمرہ شامل کریں';

  @override
  String get editProfileSaveChanges => 'تبدیلیاں محفوظ کریں';

  @override
  String get editProfileUserDataNotAvailable => 'صارف کا ڈیٹا دستیاب نہیں';

  @override
  String get editProfileUpdatedSuccess => 'پروفائل کامیابی سے اپ ڈیٹ ہو گئی';

  @override
  String get editProfileCancel => 'منسوخ کریں';

  @override
  String get editProfileSubmit => 'جمع کریں';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get settingsGeneral => 'عام';

  @override
  String get settingsAppLanguage => 'ایپ کی زبان';

  @override
  String get settingsSubtitleLanguage => 'سب ٹائٹل کی زبان';

  @override
  String get settingsAppearancePlayback => 'ظاہری شکل اور پلے بیک';

  @override
  String get settingsColorTheme => 'رنگین تھیم';

  @override
  String get settingsLight => 'روشن';

  @override
  String get settingsDark => 'سیاہ';

  @override
  String get settingsSystem => 'سسٹم';

  @override
  String get settingsAutoplayNext => 'اگلا ایپی سوڈ خودکار طور پر چلائیں';

  @override
  String get settingsDownloadQuality => 'ڈاؤن لوڈ کا معیار';

  @override
  String get settingsLow => 'کم';

  @override
  String get settingsMedium => 'درمیانہ';

  @override
  String get settingsHigh => 'اعلی';

  @override
  String get settingsVeryHigh => 'بہت اعلی';

  @override
  String get settingsAccountPrivacy => 'اکاؤنٹ اور رازداری';

  @override
  String get settingsAgeRestriction => 'عمر/مواد کی پابندی';

  @override
  String get settingsNotifications => 'اطلاعات';

  @override
  String get settingsDangerZone => 'خطرناک زون';

  @override
  String get settingsDeleteAccount => 'میرا اکاؤنٹ حذف کریں';

  @override
  String get deleteAccountTitle => 'اکاؤنٹ حذف کریں';

  @override
  String get deleteAccountHeader => 'میرا اکاؤنٹ حذف کریں';

  @override
  String get deleteAccountWarning =>
      'یہ عمل واپس نہیں لیا جا سکتا۔ آپ کا تمام ڈیٹا مستقل طور پر ہٹا دیا جائے گا۔';

  @override
  String get deleteAccountDataLoss => 'درج ذیل ڈیٹا ضائع ہو جائے گا:';

  @override
  String get deleteAccountReason => 'حذف کرنے کی وجہ';

  @override
  String get deleteAccountSelectReason => 'ایک وجہ منتخب کریں';

  @override
  String get deleteAccountNotUsing => 'میں اب ایپ استعمال نہیں کرتا';

  @override
  String get deleteAccountTooExpensive => 'بہت مہنگا';

  @override
  String get deleteAccountPrivacy => 'رازداری کے خدشات';

  @override
  String get deleteAccountTechnicalIssues => 'تکنیکی مسائل';

  @override
  String get deleteAccountFoundAlternative => 'ایک بہتر متبادل مل گیا';

  @override
  String get deleteAccountOther => 'دیگر';

  @override
  String get deleteAccountProfileSettings => 'پروفائل اور ترتیبات';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'آپ کی پروفائل معلومات، ترجیحات اور ایپ کی ترتیبات مستقل طور پر حذف ہو جائیں گی۔';

  @override
  String get deleteAccountListeningHistory => 'سننے کی تاریخ';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'آپ کی سننے کی تاریخ، تلاش کی تاریخ اور سرگرمی کے لاگز مٹا دیے جائیں گے۔';

  @override
  String get deleteAccountSavedItems => 'محفوظ کردہ آئٹمز';

  @override
  String get deleteAccountSavedItemsDesc =>
      'آپ کی تمام پلے لسٹس، پسندیدہ اور محفوظ کردہ مواد ہٹا دیا جائے گا۔';

  @override
  String get deleteAccountSubscriptions => 'سبسکرپشنز';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'کوئی بھی فعال سبسکرپشن منسوخ ہو جائے گی اور پریمیم رسائی ختم ہو جائے گی۔';

  @override
  String get deleteAccountDelete => 'میرا اکاؤنٹ حذف کریں';

  @override
  String get deleteAccountCancel => 'منسوخ کریں';

  @override
  String get deleteAccountOtpTitle => 'حذف کرنے کی تصدیق';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return '$phone پر بھیجا گیا OTP درج کریں';
  }

  @override
  String get deleteAccountOtpConfirm => 'حذف کرنے کی تصدیق کریں';

  @override
  String get deleteAccountOtpResend => 'OTP دوبارہ بھیجیں';

  @override
  String get deleteAccountOtpResent => 'OTP کامیابی سے دوبارہ بھیج دیا گیا';

  @override
  String get accountDeletedTitle => 'اکاؤنٹ حذف کر دیا گیا';

  @override
  String get accountDeletedMessage =>
      'آپ کا اکاؤنٹ مستقل طور پر حذف کر دیا گیا ہے۔\nہمیں افسوس ہے کہ آپ جا رہے ہیں۔';

  @override
  String get accountDeletedBackToHome => 'ہوم پر واپس جائیں';

  @override
  String get contactUsTitle => 'ہم سے رابطہ کریں';

  @override
  String get contactUsSubtitle => 'ہمیں آپ سے سننا اچھا لگے گا';

  @override
  String get contactUsSubject => 'موضوع';

  @override
  String get contactUsMessageLabel => 'پیغام';

  @override
  String get contactUsMessageHint => 'اپنا مسئلہ یا سوال بیان کریں...';

  @override
  String get contactUsAddAttachment => 'منسلکہ شامل کریں';

  @override
  String get contactUsQuickContact => 'فوری رابطہ';

  @override
  String get contactUsEmail => 'ای میل';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'کال';

  @override
  String get contactUsCallValue => '+1 (555) 123-4567';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'ہم سے بات کریں';

  @override
  String get contactUsSend => 'پیغام بھیجیں';

  @override
  String get contactUsSending => 'بھیجا جا رہا ہے...';

  @override
  String get contactUsNoMessage => 'براہ کرم ایک پیغام درج کریں';

  @override
  String get contactUsSent => 'پیغام کامیابی سے بھیج دیا گیا!';

  @override
  String get contactUsGeneralInquiry => 'عام استفسار';

  @override
  String get contactUsTechnicalSupport => 'تکنیکی مدد';

  @override
  String get contactUsAccountIssue => 'اکاؤنٹ کا مسئلہ';

  @override
  String get contactUsBillingQuestion => 'بلنگ کا سوال';

  @override
  String get contactUsFeatureRequest => 'فیچر کی درخواست';

  @override
  String get contactUsBugReport => 'بگ رپورٹ';

  @override
  String get helpFaqTitle => 'مدد اور اکثر پوچھے گئے سوالات';

  @override
  String get helpFaqSearchHint => 'سوالات تلاش کریں...';

  @override
  String get helpFaqNoResults => 'کوئی نتیجہ نہیں ملا';

  @override
  String get helpFaqStillNeedHelp => 'ابھی بھی مدد چاہیے؟';

  @override
  String get helpFaqContactUs => 'ہم سے رابطہ کریں';

  @override
  String get helpFaqAll => 'تمام';

  @override
  String get helpFaqAccount => 'اکاؤنٹ';

  @override
  String get helpFaqPlayback => 'پلے بیک';

  @override
  String get helpFaqBilling => 'بلنگ';

  @override
  String get helpFaqOther => 'دیگر';

  @override
  String get helpFaq1Q => 'میں اپنا پاس ورڈ کیسے ری سیٹ کروں؟';

  @override
  String get helpFaq1A =>
      'آپ لاگ ان اسکرین سے \'پاس ورڈ بھول گئے\' پر تھپتھپا کر اپنا پاس ورڈ ری سیٹ کر سکتے ہیں۔ اپنے رجسٹرڈ ای میل یا فون پر بھیجی گئی ہدایات پر عمل کریں۔';

  @override
  String get helpFaq2Q => 'کیا میں اپنا سبسکرپشن پلان تبدیل کر سکتا ہوں؟';

  @override
  String get helpFaq2A =>
      'ہاں، اپنا موجودہ پلان دیکھنے اور تبدیل کرنے کے لیے ترتیبات > سبسکرپشن پر جائیں۔ تبدیلیاں اگلے بلنگ سائیکل سے مؤثر ہوں گی۔';

  @override
  String get helpFaq3Q => 'میں اپنا اکاؤنٹ کیسے حذف کروں؟';

  @override
  String get helpFaq3A =>
      'ترتیبات > خطرناک زون > میرا اکاؤنٹ حذف کریں پر جائیں۔ اپنا اکاؤنٹ مستقل طور پر حذف کرنے کے لیے تصدیقی مراحل پر عمل کریں۔';

  @override
  String get helpFaq4Q => 'میری ڈاؤن لوڈ کردہ فائلیں کہاں ہیں؟';

  @override
  String get helpFaq4A =>
      'ڈاؤن لوڈ کردہ ایپی سوڈز ایپ کے اندر میرے ڈاؤن لوڈز کے تحت محفوظ ہیں۔ یہ کسی بھی وقت آف لائن سننے کے لیے دستیاب ہیں۔';

  @override
  String get helpFaq5Q => 'میں اپنی پروفائل معلومات کیسے اپ ڈیٹ کروں؟';

  @override
  String get helpFaq5A =>
      'اپنا نام، ای میل، تاریخ پیدائش اور پروفائل تصویر اپ ڈیٹ کرنے کے لیے پروفائل > پروفائل میں ترمیم کریں پر جائیں۔';

  @override
  String get helpFaq6Q => 'میرا آڈیو کیوں نہیں چل رہا؟';

  @override
  String get helpFaq6A =>
      'اپنا انٹرنیٹ کنکشن چیک کریں اور ایپ کو دوبارہ شروع کرنے کی کوشش کریں۔ اگر مسئلہ برقرار رہے تو ترتیبات سے ایپ کیشے صاف کرنے کی کوشش کریں۔';

  @override
  String get helpFaq7Q => 'میں ریفنڈ کیسے حاصل کروں؟';

  @override
  String get helpFaq7A =>
      'اپنے لین دین کی تفصیلات کے ساتھ support@webrofm.com پر ہماری سپورٹ ٹیم سے رابطہ کریں۔ ہم 5-7 کاروباری دنوں میں آپ کا ریفنڈ پروسیس کریں گے۔';

  @override
  String get helpFaq8Q => 'میں بگ کی اطلاع کیسے دوں؟';

  @override
  String get helpFaq8A =>
      'آپ ترتیبات میں ہم سے رابطہ کریں سیکشن کے ذریعے بگز کی اطلاع دے سکتے ہیں۔ براہ کرم مسئلہ کو دوبارہ پیدا کرنے کے اقدامات اور اپنے ڈیوائس کی معلومات شامل کریں۔';

  @override
  String get privacyPolicyTitle => 'رازداری کی پالیسی';

  @override
  String get privacyPolicyLastUpdated => 'آخری بار اپ ڈیٹ: 22 جولائی 2026';

  @override
  String get privacyPolicyCollection => 'مجموعہ';

  @override
  String get privacyPolicyCollectionTitle => 'ہم کونسی معلومات جمع کرتے ہیں';

  @override
  String get privacyPolicyCollectionText =>
      'ہم وہ معلومات جمع کرتے ہیں جو آپ براہ راست فراہم کرتے ہیں، جیسے آپ کا نام، ای میل ایڈریس، فون نمبر اور پروفائل تصویر۔ جب آپ ہماری خدمات استعمال کرتے ہیں تو ہم خود بخود کچھ معلومات بھی جمع کرتے ہیں، بشمول ڈیوائس کی معلومات، استعمال کا ڈیٹا اور سننے کی ترجیحات۔';

  @override
  String get privacyPolicyUsage => 'استعمال';

  @override
  String get privacyPolicyUsageTitle =>
      'ہم آپ کی معلومات کیسے استعمال کرتے ہیں';

  @override
  String get privacyPolicyUsageText =>
      'ہم اپنی سٹریمنگ سروسز فراہم کرنے، برقرار رکھنے اور بہتر بنانے، آپ کے تجربے کو ذاتی بنانے، آپ کو اپ ڈیٹس اور پروموشنل مواد بھیجنے اور اپنے پلیٹ فارم کی حفاظت کو یقینی بنانے کے لیے جمع کردہ معلومات کا استعمال کرتے ہیں۔';

  @override
  String get privacyPolicySharing => 'شیئرنگ';

  @override
  String get privacyPolicySharingTitle => 'معلومات کی شراکت';

  @override
  String get privacyPolicySharingText =>
      'ہم آپ کی ذاتی معلومات فروخت نہیں کرتے۔ ہم آپ کا ڈیٹا قابل اعتماد سروس فراہم کنندگان کے ساتھ شیئر کر سکتے ہیں جو ہمارے پلیٹ فارم کو چلانے میں ہماری مدد کرتے ہیں، سخت رازداری کے معاہدوں کے تابع۔';

  @override
  String get privacyPolicySecurity => 'سیکیورٹی';

  @override
  String get privacyPolicySecurityTitle => 'ڈیٹا سیکیورٹی';

  @override
  String get privacyPolicySecurityText =>
      'ہم آپ کی ذاتی معلومات کی حفاظت کے لیے صنعت کے معیاری حفاظتی اقدامات نافذ کرتے ہیں، بشمول ٹرانزٹ اور ریسٹ میں انکرپشن، باقاعدہ سیکیورٹی آڈٹ اور رسائی کے کنٹرول۔';

  @override
  String get privacyPolicyRights => 'حقوق';

  @override
  String get privacyPolicyRightsTitle => 'آپ کے حقوق اور انتخاب';

  @override
  String get privacyPolicyRightsText =>
      'آپ کو اپنی اکاؤنٹ ترتیبات کے ذریعے کسی بھی وقت اپنی ذاتی معلومات تک رسائی، اپ ڈیٹ یا حذف کرنے کا حق ہے۔ آپ رازداری سے متعلق کسی بھی درخواست کے لیے ہم سے براہ راست رابطہ کر سکتے ہیں۔';

  @override
  String get termsOfUseTitle => 'استعمال کی شرائط';

  @override
  String get termsOfUseUsage => 'استعمال';

  @override
  String get termsOfUseUsageTitle => 'استعمال کے رہنما اصول';

  @override
  String get termsOfUseUsageText =>
      'ویبرو ایف ایم استعمال کرکے، آپ صرف قانونی مقاصد کے لیے سروس استعمال کرنے سے اتفاق کرتے ہیں۔ آپ ہماری پہلے سے تحریری اجازت کے بغیر ہمارے پلیٹ فارم سے کسی بھی مواد میں ترمیم، تقسیم یا تولید نہیں کر سکتے۔ ہم ان شرائط کی خلاف ورزی پر رسائی معطل یا ختم کرنے کا حق محفوظ رکھتے ہیں۔';

  @override
  String get termsOfUseAccounts => 'اکاؤنٹس';

  @override
  String get termsOfUseAccountsTitle => 'صارف اکاؤنٹس';

  @override
  String get termsOfUseAccountsText =>
      'آپ اپنے اکاؤنٹ کی اسناد کی رازداری برقرار رکھنے کے ذمہ دار ہیں۔ اکاؤنٹ بناتے وقت آپ کو درست اور مکمل معلومات فراہم کرنی ہوں گی۔ آپ کو اپنے اکاؤنٹ کے کسی بھی غیر مجاز استعمال کے بارے میں فوری طور پر ہمیں مطلع کرنا ہوگا۔';

  @override
  String get termsOfUseContent => 'مواد';

  @override
  String get termsOfUseContentTitle => 'مواد اور دانشورانہ املاک';

  @override
  String get termsOfUseContentText =>
      'ویبرو ایف ایم پر دستیاب تمام مواد، بشمول آڈیو سٹریمز، ویڈیوز اور آرٹ ورک، کاپی رائٹ اور دانشورانہ املاک کے قوانین کے ذریعے محفوظ ہے۔ صارفین واضح اجازت کے بغیر مواد ڈاؤن لوڈ، ریکارڈ یا دوبارہ تقسیم نہیں کر سکتے۔';

  @override
  String get termsOfUseLiability => 'ذمہ داری';

  @override
  String get termsOfUseLiabilityTitle => 'ذمہ داری کی حد';

  @override
  String get termsOfUseLiabilityText =>
      'ویبرو ایف ایم سروس کے آپ کے استعمال سے پیدا ہونے والے کسی بھی بالواسطہ، حادثاتی یا نتیجہ خیز نقصانات کے لیے ذمہ دار نہیں ہوگا۔ ہماری کل ذمہ داری پچھلے 12 مہینوں میں آپ کی طرف سے سروس کے لیے ادا کی گئی رقم سے تجاوز نہیں کرے گی۔';

  @override
  String get notificationsTitle => 'اطلاعات';

  @override
  String get notificationsEmptyTitle => 'کوئی اطلاع نہیں';

  @override
  String get notificationsEmptySubtitle =>
      'آپ سب دیکھ چکے ہیں! بعد میں اپ ڈیٹس کے لیے دوبارہ دیکھیں۔';

  @override
  String get downloadsTitle => 'میرے ڈاؤن لوڈز';

  @override
  String get downloadsEmptyTitle => 'ابھی تک کوئی ڈاؤن لوڈ نہیں';

  @override
  String get downloadsEmptySubtitle =>
      'آپ کے ڈاؤن لوڈ کردہ ایپی سوڈز یہاں ظاہر ہوں گے تاکہ آپ کسی بھی وقت آف لائن سن سکیں۔';

  @override
  String get downloadsBrowseShows => 'شوز براؤز کریں';

  @override
  String get premiumTitle => 'پریمیم';

  @override
  String get collabTitle => 'تعاون';

  @override
  String get collabMyStories => 'میری کہانیاں';

  @override
  String get collabMySponsorships => 'میری سپانسرشپس';

  @override
  String get collabNoStories => 'ابھی تک کوئی کہانی جمع نہیں کروائی گئی۔';

  @override
  String get collabNoSponsorships =>
      'ابھی تک کوئی سپانسرشپ جمع نہیں کروائی گئی۔';

  @override
  String get collabApproved => 'منظور شدہ';

  @override
  String get collabRejected => 'مسترد شدہ';

  @override
  String get collabReviewing => 'زیر جائزہ';

  @override
  String get collabPending => 'زیر التوا';

  @override
  String get collabShareYourStory => 'اپنی کہانی شیئر کریں';

  @override
  String get collabShareYourStorySubtitle =>
      'نمایاں ہونے کے موقع کے لیے اپنی اصلی کہانی جمع کروائیں۔';

  @override
  String get collabSubmitStory => 'کہانی جمع کروائیں';

  @override
  String get collabSponsorshipAd => 'سپانسرشپ / اشتہار';

  @override
  String get collabSponsorshipSubtitle =>
      'سپانسرشپ کے لیے اپنا برانڈ یا کاروبار جمع کروائیں۔';

  @override
  String get collabSubmitAd => 'اشتہار جمع کروائیں';

  @override
  String get collabDialogStoryTitle => 'اپنی کہانی جمع کروائیں';

  @override
  String get collabStoryTitle => 'کہانی کا عنوان';

  @override
  String get collabStoryTitleHint => 'اپنی کہانی کا عنوان درج کریں';

  @override
  String get collabStoryContent => 'کہانی کا مواد';

  @override
  String get collabStoryContentHint => 'اپنی کہانی یہاں لکھیں...';

  @override
  String get collabCancel => 'منسوخ کریں';

  @override
  String get collabSubmit => 'جمع کریں';

  @override
  String get collabDialogAdTitle => 'اشتہار جمع کروائیں';

  @override
  String get collabBrandName => 'برانڈ کا نام';

  @override
  String get collabBrandNameHint => 'آپ کا برانڈ/کاروبار کا نام';

  @override
  String get collabDescription => 'تفصیل';

  @override
  String get collabDescriptionHint => 'اپنا اشتہار بیان کریں';

  @override
  String get collabTargetUrl => 'ٹارگٹ یو آر ایل (اختیاری)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'تصویر منتخب ہو گئی';

  @override
  String get collabUploadAdVisual => 'اشتہار کا بصری اپ لوڈ کریں';

  @override
  String get collabStatusRunning => 'جاری';

  @override
  String get collabStatusExpired => 'میعاد ختم';

  @override
  String get languagesAppLanguage => 'ایپ کی زبان';

  @override
  String get languagesSubtitleLanguage => 'سب ٹائٹل کی زبان';

  @override
  String get bottomNavHome => 'ہوم';

  @override
  String get bottomNavSearch => 'تلاش';

  @override
  String get bottomNavCategories => 'زمرے';

  @override
  String get bottomNavMyList => 'میری فہرست';

  @override
  String get bottomNavProfile => 'پروفائل';

  @override
  String get networkOffline => 'آف لائن موڈ';

  @override
  String get networkDownload => 'ڈاؤن لوڈ موڈ';

  @override
  String get networkOfflineSnackbar =>
      'آف لائن موڈ آن\nڈاؤن لوڈ مواد تلاش کرنا شروع کریں';

  @override
  String get networkDismiss => 'برخاست کریں';

  @override
  String get loadingPleaseWait => 'براہ کرم انتظار کریں...';

  @override
  String get commonRetry => 'دوبارہ کوشش کریں';

  @override
  String get guestTimerTitle => 'مفت وقت ختم!';

  @override
  String get guestTimerBody =>
      'تمام مواد تک رسائی کے لیے لاگ ان کریں۔\nیہ آپ کے لیے مفت ہے!';

  @override
  String get freeLimitTitle => 'مفت حد مکمل';

  @override
  String get freeLimitBody =>
      'آپ نے اپنی 1 منٹ کی مفت سننے کی حد استعمال کر لی ہے۔ مکمل قسط سننا جاری رکھنے کے لیے براہ کرم لاگ ان یا سائن اپ کریں۔';

  @override
  String get guestTimerLater => 'بعد میں';

  @override
  String get guestTimerLogin => 'لاگ ان / سائن اپ';

  @override
  String get errorDataError => 'ڈیٹا کی خرابی ہوئی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get errorInvalidData => 'ڈیٹا کا غلط فارمیٹ موصول ہوا۔';

  @override
  String get errorUnexpected => 'ایک غیر متوقع خرابی ہوئی۔';

  @override
  String get errorTimeout =>
      'کنیکشن ٹائم آؤٹ ہو گیا۔ براہ کرم اپنا انٹرنیٹ کنکشن چیک کریں۔';

  @override
  String get errorNoInternet =>
      'انٹرنیٹ کنکشن نہیں ہے۔ براہ کرم اپنی نیٹ ورک سیٹنگز چیک کریں۔';

  @override
  String get errorCancelled => 'درخواست منسوخ کر دی گئی۔';

  @override
  String get errorSecurity =>
      'کنیکشن سیکیورٹی کی خرابی۔ براہ کرم اپنی ایپ اپ ڈیٹ کریں۔';

  @override
  String get errorNetwork => 'ایک غیر متوقع نیٹ ورک خرابی ہوئی۔';

  @override
  String get errorInvalidRequest =>
      'غلط درخواست۔ براہ کرم اپنا ان پٹ چیک کریں۔';

  @override
  String get errorSessionExpired =>
      'سیشن ختم ہو گیا۔ براہ کرم دوبارہ سائن ان کریں۔';

  @override
  String get errorPermissionDenied =>
      'آپ کو یہ کارروائی کرنے کی اجازت نہیں ہے۔';

  @override
  String get errorNotFound => 'درخواست کردہ وسائل نہیں ملے۔';

  @override
  String get errorConflict => 'تصادم کا پتہ چلا۔ وسائل اپ ڈیٹ ہو سکتا ہے۔';

  @override
  String get errorValidationFailed =>
      'توثیق ناکام ہوئی۔ براہ کرم اپنا ان پٹ چیک کریں۔';

  @override
  String get errorTooManyRequests =>
      'بہت زیادہ درخواستیں۔ براہ کرم بعد میں دوبارہ کوشش کریں۔';

  @override
  String get errorServer => 'سرور کی خرابی۔ براہ کرم بعد میں دوبارہ کوشش کریں۔';

  @override
  String get errorServiceUnavailable =>
      'سروس عارضی طور پر دستیاب نہیں۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get errorUnderMaintenance =>
      'سروس دیکھ بھال میں ہے۔ براہ کرم بعد میں دوبارہ کوشش کریں۔';

  @override
  String errorGeneric(Object code) {
    return 'کچھ غلط ہو گیا۔ (خرابی $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'کنیکشن ٹائم آؤٹ ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get errorNoConnection => 'انٹرنیٹ کنکشن نہیں ہے۔';

  @override
  String errorServerWithCode(Object code) {
    return 'سرور کی خرابی ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'کچھ غلط ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get pageNotFound => 'صفحہ نہیں ملا';

  @override
  String get pageNotFoundMessage =>
      'آپ جس صفحہ کی تلاش کر رہے ہیں وہ موجود نہیں ہے۔';

  @override
  String get goHome => 'ہوم پر جائیں';

  @override
  String get relativeTimeJustNow => 'ابھی ابھی';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '$minutes منٹ پہلے';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '$hours گھنٹے پہلے';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '$days دن پہلے';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '$weeks ہفتے پہلے';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '$months ماہ پہلے';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '$years سال پہلے';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return '$minutes منٹ میں';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return '$hours گھنٹے میں';
  }

  @override
  String relativeTimeInDay(Object days) {
    return '$days دن میں';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '$hours گھنٹے $minutes منٹ';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '$minutes منٹ $seconds سیکنڈ';
  }

  @override
  String fileSizeBytes(Object size) {
    return '$size بائٹ';
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
    return '$count ملین';
  }

  @override
  String countViewsK(Object count) {
    return '$count ہزار';
  }

  @override
  String episodeCount(Object count) {
    return '$count ایپ';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'S$season E$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'سیزن $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return 'No episodes available in $language';
  }

  @override
  String get contentDisclaimer =>
      'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.';

  @override
  String get categoryDrama => 'ڈرامہ';

  @override
  String get categoryComedy => 'کامیڈی';

  @override
  String get categoryPodcasts => 'پوڈکاسٹ';

  @override
  String get categoryMusic => 'موسیقی';

  @override
  String get categoryKids => 'بچے';

  @override
  String get categoryDevotional => 'عبادت';

  @override
  String get categoryNews => 'خبریں';

  @override
  String get categorySports => 'کھیل';

  @override
  String get categoryTechnology => 'ٹیکنالوجی';

  @override
  String get categoryEducation => 'تعلیم';

  @override
  String get categoryBusiness => 'کاروبار';

  @override
  String get categoryHealth => 'صحت';

  @override
  String get categoryScience => 'سائنس';

  @override
  String get categoryArts => 'فنون';

  @override
  String get trendingDramaSeries => 'ڈرامہ سیریز';

  @override
  String get trendingComedyShows => 'کامیڈی شوز';

  @override
  String get trendingPodcasts => 'پوڈکاسٹ';

  @override
  String get trendingMusicAlbums => 'موسیقی کے البمز';

  @override
  String get trendingKidsStories => 'بچوں کی کہانیاں';

  @override
  String get trendingDevotional => 'عبادت';

  @override
  String get trendingNewsToday => 'آج کی خبریں';

  @override
  String get trendingSportsHighlights => 'کھیلوں کی جھلکیاں';

  @override
  String get languageEnglish => 'انگریزی';

  @override
  String get languageHindi => 'ہندی';

  @override
  String get languagePunjabi => 'پنجابی';

  @override
  String get languageHaryanvi => 'ہریانوی';

  @override
  String get languageMarathi => 'مراٹھی';

  @override
  String get languageGujarati => 'گجراتی';

  @override
  String get languageBengali => 'بنگالی';

  @override
  String get languageTamil => 'تامل';

  @override
  String get languageTelugu => 'تیلگو';

  @override
  String get languageKannada => 'کنڑ';

  @override
  String get languageMalayalam => 'ملیالم';

  @override
  String get languageUrdu => 'اردو';

  @override
  String get pressBackToExit => 'باہر جانے کے لیے دوبارہ بیک دبائیں';

  @override
  String get exitDialogTitle => 'ایپ بند کریں؟';

  @override
  String get exitDialogBody => 'کیا آپ واقعی ایپ بند کرنا چاہتے ہیں؟';

  @override
  String get exitDialogConfirm => 'بند کریں';

  @override
  String get exitDialogCancel => 'منسوخ';

  @override
  String get profileShareApp => 'Share App';

  @override
  String get profileShareAppMessage =>
      'Check out WebroFM - your go-to app for streaming shows and podcasts!';
}
