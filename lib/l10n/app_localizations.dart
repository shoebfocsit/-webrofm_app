import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('pa'),
    Locale('mr'),
    Locale('gu'),
    Locale('bn'),
    Locale('ta'),
    Locale('te'),
    Locale('kn'),
    Locale('ml'),
    Locale('ur'),
  ];

  /// App title
  ///
  /// In en, this message translates to:
  /// **'WebroFM'**
  String get appTitle;

  /// No description provided for @splashLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get splashLoading;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to WebroFM'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover stories that move you'**
  String get welcomeSubtitle;

  /// No description provided for @welcomeGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get welcomeGetStarted;

  /// No description provided for @welcomeContinueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get welcomeContinueAsGuest;

  /// No description provided for @loginSearchCountries.
  ///
  /// In en, this message translates to:
  /// **'Search countries'**
  String get loginSearchCountries;

  /// No description provided for @loginInvalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get loginInvalidPhone;

  /// No description provided for @loginRateLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'Rate Limit Reached'**
  String get loginRateLimitTitle;

  /// No description provided for @loginRateLimitContent.
  ///
  /// In en, this message translates to:
  /// **'Too many OTP attempts. Please try again after 1 hour.'**
  String get loginRateLimitContent;

  /// No description provided for @loginOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get loginOk;

  /// No description provided for @loginAttemptRemaining.
  ///
  /// In en, this message translates to:
  /// **'Only {remaining} attempt remaining this hour'**
  String loginAttemptRemaining(Object remaining);

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login to Continue'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to get started'**
  String get loginSubtitle;

  /// No description provided for @loginPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'(555) 000-0000'**
  String get loginPhoneHint;

  /// No description provided for @loginIAgreeTo.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get loginIAgreeTo;

  /// No description provided for @loginTermsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get loginTermsOfUse;

  /// No description provided for @loginAnd.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get loginAnd;

  /// No description provided for @loginPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get loginPrivacyPolicy;

  /// No description provided for @loginSendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get loginSendOtp;

  /// No description provided for @loginContinueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get loginContinueAsGuest;

  /// No description provided for @otpEnterCompleteCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter the complete 6-digit code'**
  String get otpEnterCompleteCode;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Number'**
  String get otpTitle;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to'**
  String get otpSubtitle;

  /// No description provided for @otpVerifyAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Verify & Continue'**
  String get otpVerifyAndContinue;

  /// No description provided for @otpDidntReceive.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code? '**
  String get otpDidntReceive;

  /// No description provided for @otpResend.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get otpResend;

  /// No description provided for @completeProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete Your Profile'**
  String get completeProfileTitle;

  /// No description provided for @completeProfileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help us personalise your experience'**
  String get completeProfileSubtitle;

  /// No description provided for @completeProfileBasicInfo.
  ///
  /// In en, this message translates to:
  /// **'Basic Info'**
  String get completeProfileBasicInfo;

  /// No description provided for @completeProfileFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name *'**
  String get completeProfileFullName;

  /// No description provided for @completeProfileNameHint.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get completeProfileNameHint;

  /// No description provided for @completeProfileEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get completeProfileEmail;

  /// No description provided for @completeProfileEmailHint.
  ///
  /// In en, this message translates to:
  /// **'john@example.com'**
  String get completeProfileEmailHint;

  /// No description provided for @completeProfileGender.
  ///
  /// In en, this message translates to:
  /// **'Gender *'**
  String get completeProfileGender;

  /// No description provided for @completeProfileDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get completeProfileDateOfBirth;

  /// No description provided for @completeProfileDobHint.
  ///
  /// In en, this message translates to:
  /// **'Select your date of birth'**
  String get completeProfileDobHint;

  /// No description provided for @completeProfileMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get completeProfileMale;

  /// No description provided for @completeProfileFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get completeProfileFemale;

  /// No description provided for @completeProfileOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get completeProfileOther;

  /// No description provided for @completeProfileError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name and select gender'**
  String get completeProfileError;

  /// No description provided for @completeProfileSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get completeProfileSkip;

  /// No description provided for @completeProfileContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get completeProfileContinue;

  /// No description provided for @interestTitle.
  ///
  /// In en, this message translates to:
  /// **'Pick Your Interests'**
  String get interestTitle;

  /// No description provided for @interestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select categories you enjoy to get personalised recommendations'**
  String get interestSubtitle;

  /// No description provided for @interestSectionHeader.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Interests'**
  String get interestSectionHeader;

  /// No description provided for @interestTapToSelect.
  ///
  /// In en, this message translates to:
  /// **'Tap to select'**
  String get interestTapToSelect;

  /// No description provided for @interestContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue to WebroFM'**
  String get interestContinue;

  /// No description provided for @interestSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get interestSkip;

  /// No description provided for @registrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself'**
  String get registrationTitle;

  /// No description provided for @registrationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help us personalize your experience'**
  String get registrationSubtitle;

  /// No description provided for @registrationPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get registrationPersonalInfo;

  /// No description provided for @registrationFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get registrationFullName;

  /// No description provided for @registrationNameHint.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get registrationNameHint;

  /// No description provided for @registrationEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get registrationEmail;

  /// No description provided for @registrationEmailHint.
  ///
  /// In en, this message translates to:
  /// **'john@example.com'**
  String get registrationEmailHint;

  /// No description provided for @registrationDob.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get registrationDob;

  /// No description provided for @registrationDobHint.
  ///
  /// In en, this message translates to:
  /// **'Select your date of birth'**
  String get registrationDobHint;

  /// No description provided for @registrationInterestsHeader.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Interests'**
  String get registrationInterestsHeader;

  /// No description provided for @registrationInterestsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select categories you enjoy'**
  String get registrationInterestsSubtitle;

  /// No description provided for @registrationContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue to WebroFM'**
  String get registrationContinue;

  /// No description provided for @registrationNameError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get registrationNameError;

  /// No description provided for @homeContinueWatching.
  ///
  /// In en, this message translates to:
  /// **'Continue Watching'**
  String get homeContinueWatching;

  /// No description provided for @homeContinueListening.
  ///
  /// In en, this message translates to:
  /// **'Continue Listening'**
  String get homeContinueListening;

  /// No description provided for @homeResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get homeResume;

  /// No description provided for @homeNewArrivals.
  ///
  /// In en, this message translates to:
  /// **'New Arrivals'**
  String get homeNewArrivals;

  /// No description provided for @homeSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get homeSeeAll;

  /// No description provided for @homePopularNow.
  ///
  /// In en, this message translates to:
  /// **'Popular Now'**
  String get homePopularNow;

  /// No description provided for @homeNoShows.
  ///
  /// In en, this message translates to:
  /// **'No shows available'**
  String get homeNoShows;

  /// No description provided for @showDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get showDetailFailed;

  /// No description provided for @showDetailNotFound.
  ///
  /// In en, this message translates to:
  /// **'Show not found'**
  String get showDetailNotFound;

  /// No description provided for @showDetailShareText.
  ///
  /// In en, this message translates to:
  /// **'Check out {title} on WebroFM!'**
  String showDetailShareText(Object title);

  /// No description provided for @showDetailDownloadStarted.
  ///
  /// In en, this message translates to:
  /// **'Download started'**
  String get showDetailDownloadStarted;

  /// No description provided for @showDetailNoDescription.
  ///
  /// In en, this message translates to:
  /// **'No description available.'**
  String get showDetailNoDescription;

  /// No description provided for @showDetailReadLess.
  ///
  /// In en, this message translates to:
  /// **'Read less'**
  String get showDetailReadLess;

  /// No description provided for @showDetailReadMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get showDetailReadMore;

  /// No description provided for @showDetailPlayLatest.
  ///
  /// In en, this message translates to:
  /// **'Play Latest Episode'**
  String get showDetailPlayLatest;

  /// No description provided for @showDetailEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get showDetailEpisodes;

  /// No description provided for @showDetailNoEpisodes.
  ///
  /// In en, this message translates to:
  /// **'No episodes available'**
  String get showDetailNoEpisodes;

  /// No description provided for @showDetailMoreLikeThis.
  ///
  /// In en, this message translates to:
  /// **'More Like This'**
  String get showDetailMoreLikeThis;

  /// No description provided for @videoPlayerNoAudio.
  ///
  /// In en, this message translates to:
  /// **'No audio available for this episode'**
  String get videoPlayerNoAudio;

  /// No description provided for @videoPlayerLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading video...'**
  String get videoPlayerLoading;

  /// No description provided for @videoPlayerNowPlaying.
  ///
  /// In en, this message translates to:
  /// **'Now Playing'**
  String get videoPlayerNowPlaying;

  /// No description provided for @videoPlayerPaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get videoPlayerPaused;

  /// No description provided for @videoPlayerPlaybackError.
  ///
  /// In en, this message translates to:
  /// **'Playback error: {message}'**
  String videoPlayerPlaybackError(Object message);

  /// No description provided for @videoPlayerVideoPlayer.
  ///
  /// In en, this message translates to:
  /// **'Video Player'**
  String get videoPlayerVideoPlayer;

  /// No description provided for @videoPlayerNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get videoPlayerNext;

  /// No description provided for @videoPlayerAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get videoPlayerAudio;

  /// No description provided for @videoPlayerVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get videoPlayerVideo;

  /// No description provided for @showCardNew.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get showCardNew;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search shows, episodes...'**
  String get searchHint;

  /// No description provided for @searchTrending.
  ///
  /// In en, this message translates to:
  /// **'Trending Searches'**
  String get searchTrending;

  /// No description provided for @searchSuggested.
  ///
  /// In en, this message translates to:
  /// **'Suggested for You'**
  String get searchSuggested;

  /// No description provided for @searchError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get searchError;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get searchNoResults;

  /// No description provided for @searchNoResultsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search terms'**
  String get searchNoResultsSubtitle;

  /// No description provided for @categoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore Categories'**
  String get categoriesTitle;

  /// No description provided for @categoriesShowCount.
  ///
  /// In en, this message translates to:
  /// **'{count} shows'**
  String categoriesShowCount(Object count);

  /// No description provided for @categoryDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get categoryDetailFailed;

  /// No description provided for @categoryDetailLoadMore.
  ///
  /// In en, this message translates to:
  /// **'Load More'**
  String get categoryDetailLoadMore;

  /// No description provided for @categoryDetailSortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get categoryDetailSortBy;

  /// No description provided for @categoryDetailPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get categoryDetailPopular;

  /// No description provided for @categoryDetailNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get categoryDetailNewest;

  /// No description provided for @categoryDetailTopRated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get categoryDetailTopRated;

  /// No description provided for @myListTitle.
  ///
  /// In en, this message translates to:
  /// **'My List'**
  String get myListTitle;

  /// No description provided for @myListSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get myListSaved;

  /// No description provided for @myListWatchHistory.
  ///
  /// In en, this message translates to:
  /// **'Watch History'**
  String get myListWatchHistory;

  /// No description provided for @myListError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get myListError;

  /// No description provided for @myListNoSaved.
  ///
  /// In en, this message translates to:
  /// **'No saved items yet'**
  String get myListNoSaved;

  /// No description provided for @myListNoHistory.
  ///
  /// In en, this message translates to:
  /// **'No watch history yet'**
  String get myListNoHistory;

  /// No description provided for @myListNoSavedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start exploring and save your favorites'**
  String get myListNoSavedSubtitle;

  /// No description provided for @myListNoHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your recently watched shows will appear here'**
  String get myListNoHistorySubtitle;

  /// No description provided for @myListExploreShows.
  ///
  /// In en, this message translates to:
  /// **'Explore Shows'**
  String get myListExploreShows;

  /// No description provided for @myListRemoved.
  ///
  /// In en, this message translates to:
  /// **'Removed from My List'**
  String get myListRemoved;

  /// No description provided for @myListLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login to see your saved shows'**
  String get myListLoginTitle;

  /// No description provided for @myListLoginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Save your favorite shows and access them anytime'**
  String get myListLoginSubtitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileUser.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get profileUser;

  /// No description provided for @profileNoPhone.
  ///
  /// In en, this message translates to:
  /// **'No phone'**
  String get profileNoPhone;

  /// No description provided for @profileEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEditProfile;

  /// No description provided for @profileYourInterests.
  ///
  /// In en, this message translates to:
  /// **'Your Interests'**
  String get profileYourInterests;

  /// No description provided for @profileNoCategories.
  ///
  /// In en, this message translates to:
  /// **'No categories selected'**
  String get profileNoCategories;

  /// No description provided for @profileDobLabel.
  ///
  /// In en, this message translates to:
  /// **'DOB'**
  String get profileDobLabel;

  /// No description provided for @profileNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'You\'re not logged in'**
  String get profileNotLoggedIn;

  /// No description provided for @profileNotLoggedInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to access your profile, downloads, and personalized recommendations.'**
  String get profileNotLoggedInSubtitle;

  /// No description provided for @profileLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get profileLogin;

  /// No description provided for @profileCollaboration.
  ///
  /// In en, this message translates to:
  /// **'Collaboration'**
  String get profileCollaboration;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings & Preferences'**
  String get profileSettings;

  /// No description provided for @profileMyDownloads.
  ///
  /// In en, this message translates to:
  /// **'My Downloads'**
  String get profileMyDownloads;

  /// No description provided for @profileTermsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get profileTermsOfUse;

  /// No description provided for @profilePrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get profilePrivacyPolicy;

  /// No description provided for @profileHelpFaq.
  ///
  /// In en, this message translates to:
  /// **'Help & FAQ'**
  String get profileHelpFaq;

  /// No description provided for @profileContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get profileContactUs;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogout;

  /// No description provided for @profileLogoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogoutTitle;

  /// No description provided for @profileLogoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get profileLogoutConfirm;

  /// No description provided for @profileCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileCancel;

  /// No description provided for @editProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfileTitle;

  /// No description provided for @editProfileTapToChangePhoto.
  ///
  /// In en, this message translates to:
  /// **'Tap to change photo'**
  String get editProfileTapToChangePhoto;

  /// No description provided for @editProfileFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get editProfileFullName;

  /// No description provided for @editProfileNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get editProfileNameRequired;

  /// No description provided for @editProfileEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get editProfileEmail;

  /// No description provided for @editProfileEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get editProfileEmailRequired;

  /// No description provided for @editProfileInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get editProfileInvalidEmail;

  /// No description provided for @editProfileDob.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get editProfileDob;

  /// No description provided for @editProfilePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get editProfilePhone;

  /// No description provided for @editProfileCategoryPreferences.
  ///
  /// In en, this message translates to:
  /// **'Category Preferences'**
  String get editProfileCategoryPreferences;

  /// No description provided for @editProfileAddMore.
  ///
  /// In en, this message translates to:
  /// **'Add More'**
  String get editProfileAddMore;

  /// No description provided for @editProfileAddCategory.
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get editProfileAddCategory;

  /// No description provided for @editProfileSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get editProfileSaveChanges;

  /// No description provided for @editProfileUserDataNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'User data not available'**
  String get editProfileUserDataNotAvailable;

  /// No description provided for @editProfileUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get editProfileUpdatedSuccess;

  /// No description provided for @editProfileCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get editProfileCancel;

  /// No description provided for @editProfileSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get editProfileSubmit;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneral;

  /// No description provided for @settingsAppLanguage.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get settingsAppLanguage;

  /// No description provided for @settingsSubtitleLanguage.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Language'**
  String get settingsSubtitleLanguage;

  /// No description provided for @settingsAppearancePlayback.
  ///
  /// In en, this message translates to:
  /// **'Appearance & Playback'**
  String get settingsAppearancePlayback;

  /// No description provided for @settingsColorTheme.
  ///
  /// In en, this message translates to:
  /// **'Color Theme'**
  String get settingsColorTheme;

  /// No description provided for @settingsLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsLight;

  /// No description provided for @settingsDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsDark;

  /// No description provided for @settingsSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsSystem;

  /// No description provided for @settingsAutoplayNext.
  ///
  /// In en, this message translates to:
  /// **'Autoplay Next Episode'**
  String get settingsAutoplayNext;

  /// No description provided for @settingsDownloadQuality.
  ///
  /// In en, this message translates to:
  /// **'Download Quality'**
  String get settingsDownloadQuality;

  /// No description provided for @settingsLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get settingsLow;

  /// No description provided for @settingsMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get settingsMedium;

  /// No description provided for @settingsHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get settingsHigh;

  /// No description provided for @settingsVeryHigh.
  ///
  /// In en, this message translates to:
  /// **'Very High'**
  String get settingsVeryHigh;

  /// No description provided for @settingsAccountPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Account & Privacy'**
  String get settingsAccountPrivacy;

  /// No description provided for @settingsAgeRestriction.
  ///
  /// In en, this message translates to:
  /// **'Age/Content Restriction'**
  String get settingsAgeRestriction;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsDangerZone.
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get settingsDangerZone;

  /// No description provided for @settingsDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get settingsDeleteAccount;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountHeader.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get deleteAccountHeader;

  /// No description provided for @deleteAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. All your data will be permanently removed.'**
  String get deleteAccountWarning;

  /// No description provided for @deleteAccountDataLoss.
  ///
  /// In en, this message translates to:
  /// **'The following data will be lost:'**
  String get deleteAccountDataLoss;

  /// No description provided for @deleteAccountReason.
  ///
  /// In en, this message translates to:
  /// **'Reason for deletion'**
  String get deleteAccountReason;

  /// No description provided for @deleteAccountSelectReason.
  ///
  /// In en, this message translates to:
  /// **'Select a reason'**
  String get deleteAccountSelectReason;

  /// No description provided for @deleteAccountNotUsing.
  ///
  /// In en, this message translates to:
  /// **'I don\'t use the app anymore'**
  String get deleteAccountNotUsing;

  /// No description provided for @deleteAccountTooExpensive.
  ///
  /// In en, this message translates to:
  /// **'Too expensive'**
  String get deleteAccountTooExpensive;

  /// No description provided for @deleteAccountPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy concerns'**
  String get deleteAccountPrivacy;

  /// No description provided for @deleteAccountTechnicalIssues.
  ///
  /// In en, this message translates to:
  /// **'Technical issues'**
  String get deleteAccountTechnicalIssues;

  /// No description provided for @deleteAccountFoundAlternative.
  ///
  /// In en, this message translates to:
  /// **'Found a better alternative'**
  String get deleteAccountFoundAlternative;

  /// No description provided for @deleteAccountOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get deleteAccountOther;

  /// No description provided for @deleteAccountProfileSettings.
  ///
  /// In en, this message translates to:
  /// **'Profile & Settings'**
  String get deleteAccountProfileSettings;

  /// No description provided for @deleteAccountProfileSettingsDesc.
  ///
  /// In en, this message translates to:
  /// **'Your profile information, preferences, and app settings will be permanently deleted.'**
  String get deleteAccountProfileSettingsDesc;

  /// No description provided for @deleteAccountListeningHistory.
  ///
  /// In en, this message translates to:
  /// **'Listening History'**
  String get deleteAccountListeningHistory;

  /// No description provided for @deleteAccountListeningHistoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Your listening history, search history, and activity logs will be erased.'**
  String get deleteAccountListeningHistoryDesc;

  /// No description provided for @deleteAccountSavedItems.
  ///
  /// In en, this message translates to:
  /// **'Saved Items'**
  String get deleteAccountSavedItems;

  /// No description provided for @deleteAccountSavedItemsDesc.
  ///
  /// In en, this message translates to:
  /// **'All your playlists, favorites, and saved content will be removed.'**
  String get deleteAccountSavedItemsDesc;

  /// No description provided for @deleteAccountSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get deleteAccountSubscriptions;

  /// No description provided for @deleteAccountSubscriptionsDesc.
  ///
  /// In en, this message translates to:
  /// **'Any active subscriptions will be cancelled and premium access will end.'**
  String get deleteAccountSubscriptionsDesc;

  /// No description provided for @deleteAccountDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get deleteAccountDelete;

  /// No description provided for @deleteAccountCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get deleteAccountCancel;

  /// No description provided for @deleteAccountOtpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Deletion'**
  String get deleteAccountOtpTitle;

  /// No description provided for @deleteAccountOtpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP sent to {phone}'**
  String deleteAccountOtpSubtitle(Object phone);

  /// No description provided for @deleteAccountOtpConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get deleteAccountOtpConfirm;

  /// No description provided for @deleteAccountOtpResend.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get deleteAccountOtpResend;

  /// No description provided for @deleteAccountOtpResent.
  ///
  /// In en, this message translates to:
  /// **'OTP resent successfully'**
  String get deleteAccountOtpResent;

  /// No description provided for @accountDeletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Deleted'**
  String get accountDeletedTitle;

  /// No description provided for @accountDeletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account has been permanently deleted.\nWe\'re sorry to see you go.'**
  String get accountDeletedMessage;

  /// No description provided for @accountDeletedBackToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get accountDeletedBackToHome;

  /// No description provided for @contactUsTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUsTitle;

  /// No description provided for @contactUsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'d love to hear from you'**
  String get contactUsSubtitle;

  /// No description provided for @contactUsSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get contactUsSubject;

  /// No description provided for @contactUsMessageLabel.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get contactUsMessageLabel;

  /// No description provided for @contactUsMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Describe your issue or question...'**
  String get contactUsMessageHint;

  /// No description provided for @contactUsAddAttachment.
  ///
  /// In en, this message translates to:
  /// **'Add Attachment'**
  String get contactUsAddAttachment;

  /// No description provided for @contactUsQuickContact.
  ///
  /// In en, this message translates to:
  /// **'Quick Contact'**
  String get contactUsQuickContact;

  /// No description provided for @contactUsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactUsEmail;

  /// No description provided for @contactUsEmailValue.
  ///
  /// In en, this message translates to:
  /// **'support@webrofm.com'**
  String get contactUsEmailValue;

  /// No description provided for @contactUsCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get contactUsCall;

  /// No description provided for @contactUsCallValue.
  ///
  /// In en, this message translates to:
  /// **'+1 (555) 123-4567'**
  String get contactUsCallValue;

  /// No description provided for @contactUsWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get contactUsWhatsApp;

  /// No description provided for @contactUsWhatsAppValue.
  ///
  /// In en, this message translates to:
  /// **'Chat with us'**
  String get contactUsWhatsAppValue;

  /// No description provided for @contactUsSend.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get contactUsSend;

  /// No description provided for @contactUsSending.
  ///
  /// In en, this message translates to:
  /// **'Sending...'**
  String get contactUsSending;

  /// No description provided for @contactUsNoMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a message'**
  String get contactUsNoMessage;

  /// No description provided for @contactUsSent.
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully!'**
  String get contactUsSent;

  /// No description provided for @contactUsGeneralInquiry.
  ///
  /// In en, this message translates to:
  /// **'General Inquiry'**
  String get contactUsGeneralInquiry;

  /// No description provided for @contactUsTechnicalSupport.
  ///
  /// In en, this message translates to:
  /// **'Technical Support'**
  String get contactUsTechnicalSupport;

  /// No description provided for @contactUsAccountIssue.
  ///
  /// In en, this message translates to:
  /// **'Account Issue'**
  String get contactUsAccountIssue;

  /// No description provided for @contactUsBillingQuestion.
  ///
  /// In en, this message translates to:
  /// **'Billing Question'**
  String get contactUsBillingQuestion;

  /// No description provided for @contactUsFeatureRequest.
  ///
  /// In en, this message translates to:
  /// **'Feature Request'**
  String get contactUsFeatureRequest;

  /// No description provided for @contactUsBugReport.
  ///
  /// In en, this message translates to:
  /// **'Bug Report'**
  String get contactUsBugReport;

  /// No description provided for @helpFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & FAQ'**
  String get helpFaqTitle;

  /// No description provided for @helpFaqSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search FAQs...'**
  String get helpFaqSearchHint;

  /// No description provided for @helpFaqNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get helpFaqNoResults;

  /// No description provided for @helpFaqStillNeedHelp.
  ///
  /// In en, this message translates to:
  /// **'Still need help?'**
  String get helpFaqStillNeedHelp;

  /// No description provided for @helpFaqContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get helpFaqContactUs;

  /// No description provided for @helpFaqAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get helpFaqAll;

  /// No description provided for @helpFaqAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get helpFaqAccount;

  /// No description provided for @helpFaqPlayback.
  ///
  /// In en, this message translates to:
  /// **'Playback'**
  String get helpFaqPlayback;

  /// No description provided for @helpFaqBilling.
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get helpFaqBilling;

  /// No description provided for @helpFaqOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get helpFaqOther;

  /// No description provided for @helpFaq1Q.
  ///
  /// In en, this message translates to:
  /// **'How do I reset my password?'**
  String get helpFaq1Q;

  /// No description provided for @helpFaq1A.
  ///
  /// In en, this message translates to:
  /// **'You can reset your password from the login screen by tapping \'Forgot Password\'. Follow the instructions sent to your registered email or phone.'**
  String get helpFaq1A;

  /// No description provided for @helpFaq2Q.
  ///
  /// In en, this message translates to:
  /// **'Can I change my subscription plan?'**
  String get helpFaq2Q;

  /// No description provided for @helpFaq2A.
  ///
  /// In en, this message translates to:
  /// **'Yes, go to Settings > Subscription to view and change your current plan. Changes will take effect from the next billing cycle.'**
  String get helpFaq2A;

  /// No description provided for @helpFaq3Q.
  ///
  /// In en, this message translates to:
  /// **'How do I delete my account?'**
  String get helpFaq3Q;

  /// No description provided for @helpFaq3A.
  ///
  /// In en, this message translates to:
  /// **'Go to Settings > Danger Zone > Delete My Account. Follow the verification steps to permanently delete your account.'**
  String get helpFaq3A;

  /// No description provided for @helpFaq4Q.
  ///
  /// In en, this message translates to:
  /// **'Where are my downloaded files?'**
  String get helpFaq4Q;

  /// No description provided for @helpFaq4A.
  ///
  /// In en, this message translates to:
  /// **'Downloaded episodes are stored within the app under My Downloads. They are available offline for listening anytime.'**
  String get helpFaq4A;

  /// No description provided for @helpFaq5Q.
  ///
  /// In en, this message translates to:
  /// **'How do I update my profile information?'**
  String get helpFaq5Q;

  /// No description provided for @helpFaq5A.
  ///
  /// In en, this message translates to:
  /// **'Go to Profile > Edit Profile to update your name, email, date of birth, and profile picture.'**
  String get helpFaq5A;

  /// No description provided for @helpFaq6Q.
  ///
  /// In en, this message translates to:
  /// **'Why is my audio not playing?'**
  String get helpFaq6Q;

  /// No description provided for @helpFaq6A.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection and try restarting the app. If the issue persists, try clearing the app cache from Settings.'**
  String get helpFaq6A;

  /// No description provided for @helpFaq7Q.
  ///
  /// In en, this message translates to:
  /// **'How do I get a refund?'**
  String get helpFaq7Q;

  /// No description provided for @helpFaq7A.
  ///
  /// In en, this message translates to:
  /// **'Contact our support team at support@webrofm.com with your transaction details. We\'ll process your refund within 5-7 business days.'**
  String get helpFaq7A;

  /// No description provided for @helpFaq8Q.
  ///
  /// In en, this message translates to:
  /// **'How do I report a bug?'**
  String get helpFaq8Q;

  /// No description provided for @helpFaq8A.
  ///
  /// In en, this message translates to:
  /// **'You can report bugs through the Contact Us section in Settings. Please include steps to reproduce the issue and your device information.'**
  String get helpFaq8A;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: July 22, 2026'**
  String get privacyPolicyLastUpdated;

  /// No description provided for @privacyPolicyCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get privacyPolicyCollection;

  /// No description provided for @privacyPolicyCollectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Information We Collect'**
  String get privacyPolicyCollectionTitle;

  /// No description provided for @privacyPolicyCollectionText.
  ///
  /// In en, this message translates to:
  /// **'We collect information you provide directly, such as your name, email address, phone number, and profile picture. We also automatically collect certain information when you use our services, including device information, usage data, and listening preferences.'**
  String get privacyPolicyCollectionText;

  /// No description provided for @privacyPolicyUsage.
  ///
  /// In en, this message translates to:
  /// **'Usage'**
  String get privacyPolicyUsage;

  /// No description provided for @privacyPolicyUsageTitle.
  ///
  /// In en, this message translates to:
  /// **'How We Use Your Information'**
  String get privacyPolicyUsageTitle;

  /// No description provided for @privacyPolicyUsageText.
  ///
  /// In en, this message translates to:
  /// **'We use the information we collect to provide, maintain, and improve our streaming services, personalize your experience, send you updates and promotional materials, and ensure the security of our platform.'**
  String get privacyPolicyUsageText;

  /// No description provided for @privacyPolicySharing.
  ///
  /// In en, this message translates to:
  /// **'Sharing'**
  String get privacyPolicySharing;

  /// No description provided for @privacyPolicySharingTitle.
  ///
  /// In en, this message translates to:
  /// **'Information Sharing'**
  String get privacyPolicySharingTitle;

  /// No description provided for @privacyPolicySharingText.
  ///
  /// In en, this message translates to:
  /// **'We do not sell your personal information. We may share your data with trusted service providers who assist us in operating our platform, subject to strict confidentiality agreements.'**
  String get privacyPolicySharingText;

  /// No description provided for @privacyPolicySecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get privacyPolicySecurity;

  /// No description provided for @privacyPolicySecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get privacyPolicySecurityTitle;

  /// No description provided for @privacyPolicySecurityText.
  ///
  /// In en, this message translates to:
  /// **'We implement industry-standard security measures to protect your personal information, including encryption in transit and at rest, regular security audits, and access controls.'**
  String get privacyPolicySecurityText;

  /// No description provided for @privacyPolicyRights.
  ///
  /// In en, this message translates to:
  /// **'Rights'**
  String get privacyPolicyRights;

  /// No description provided for @privacyPolicyRightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Rights & Choices'**
  String get privacyPolicyRightsTitle;

  /// No description provided for @privacyPolicyRightsText.
  ///
  /// In en, this message translates to:
  /// **'You have the right to access, update, or delete your personal information at any time through your account settings. You can also contact us directly for any privacy-related requests.'**
  String get privacyPolicyRightsText;

  /// No description provided for @termsOfUseTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUseTitle;

  /// No description provided for @termsOfUseUsage.
  ///
  /// In en, this message translates to:
  /// **'Usage'**
  String get termsOfUseUsage;

  /// No description provided for @termsOfUseUsageTitle.
  ///
  /// In en, this message translates to:
  /// **'Usage Guidelines'**
  String get termsOfUseUsageTitle;

  /// No description provided for @termsOfUseUsageText.
  ///
  /// In en, this message translates to:
  /// **'By using WebroFM, you agree to use the service for lawful purposes only. You may not modify, distribute, or reproduce any content from our platform without prior written consent. We reserve the right to suspend or terminate access for violations of these terms.'**
  String get termsOfUseUsageText;

  /// No description provided for @termsOfUseAccounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get termsOfUseAccounts;

  /// No description provided for @termsOfUseAccountsTitle.
  ///
  /// In en, this message translates to:
  /// **'User Accounts'**
  String get termsOfUseAccountsTitle;

  /// No description provided for @termsOfUseAccountsText.
  ///
  /// In en, this message translates to:
  /// **'You are responsible for maintaining the confidentiality of your account credentials. You must provide accurate and complete information when creating an account. You must notify us immediately of any unauthorized use of your account.'**
  String get termsOfUseAccountsText;

  /// No description provided for @termsOfUseContent.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get termsOfUseContent;

  /// No description provided for @termsOfUseContentTitle.
  ///
  /// In en, this message translates to:
  /// **'Content & Intellectual Property'**
  String get termsOfUseContentTitle;

  /// No description provided for @termsOfUseContentText.
  ///
  /// In en, this message translates to:
  /// **'All content available on WebroFM, including audio streams, videos, and artwork, is protected by copyright and intellectual property laws. Users may not download, record, or redistribute content without explicit permission.'**
  String get termsOfUseContentText;

  /// No description provided for @termsOfUseLiability.
  ///
  /// In en, this message translates to:
  /// **'Liability'**
  String get termsOfUseLiability;

  /// No description provided for @termsOfUseLiabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Limitation of Liability'**
  String get termsOfUseLiabilityTitle;

  /// No description provided for @termsOfUseLiabilityText.
  ///
  /// In en, this message translates to:
  /// **'WebroFM shall not be liable for any indirect, incidental, or consequential damages arising from your use of the service. Our total liability shall not exceed the amount paid by you for the service in the past 12 months.'**
  String get termsOfUseLiabilityText;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No Notifications'**
  String get notificationsEmptyTitle;

  /// No description provided for @notificationsEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up! Check back later for updates.'**
  String get notificationsEmptySubtitle;

  /// No description provided for @downloadsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Downloads'**
  String get downloadsTitle;

  /// No description provided for @downloadsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No Downloads Yet'**
  String get downloadsEmptyTitle;

  /// No description provided for @downloadsEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your downloaded episodes will appear here so you can listen offline anytime.'**
  String get downloadsEmptySubtitle;

  /// No description provided for @downloadsBrowseShows.
  ///
  /// In en, this message translates to:
  /// **'Browse Shows'**
  String get downloadsBrowseShows;

  /// No description provided for @premiumTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumTitle;

  /// No description provided for @collabTitle.
  ///
  /// In en, this message translates to:
  /// **'Collaboration'**
  String get collabTitle;

  /// No description provided for @collabMyStories.
  ///
  /// In en, this message translates to:
  /// **'My Stories'**
  String get collabMyStories;

  /// No description provided for @collabMySponsorships.
  ///
  /// In en, this message translates to:
  /// **'My Sponsorships'**
  String get collabMySponsorships;

  /// No description provided for @collabNoStories.
  ///
  /// In en, this message translates to:
  /// **'No stories submitted yet.'**
  String get collabNoStories;

  /// No description provided for @collabNoSponsorships.
  ///
  /// In en, this message translates to:
  /// **'No sponsorships submitted yet.'**
  String get collabNoSponsorships;

  /// No description provided for @collabApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get collabApproved;

  /// No description provided for @collabRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get collabRejected;

  /// No description provided for @collabReviewing.
  ///
  /// In en, this message translates to:
  /// **'Reviewing'**
  String get collabReviewing;

  /// No description provided for @collabPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get collabPending;

  /// No description provided for @collabShareYourStory.
  ///
  /// In en, this message translates to:
  /// **'Share Your Story'**
  String get collabShareYourStory;

  /// No description provided for @collabShareYourStorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Submit your original story for a chance to be featured.'**
  String get collabShareYourStorySubtitle;

  /// No description provided for @collabSubmitStory.
  ///
  /// In en, this message translates to:
  /// **'Submit Story'**
  String get collabSubmitStory;

  /// No description provided for @collabSponsorshipAd.
  ///
  /// In en, this message translates to:
  /// **'Sponsorship / Ad'**
  String get collabSponsorshipAd;

  /// No description provided for @collabSponsorshipSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Submit your brand or business for sponsorship.'**
  String get collabSponsorshipSubtitle;

  /// No description provided for @collabSubmitAd.
  ///
  /// In en, this message translates to:
  /// **'Submit Ad'**
  String get collabSubmitAd;

  /// No description provided for @collabDialogStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Submit Your Story'**
  String get collabDialogStoryTitle;

  /// No description provided for @collabStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Story Title'**
  String get collabStoryTitle;

  /// No description provided for @collabStoryTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your story title'**
  String get collabStoryTitleHint;

  /// No description provided for @collabStoryContent.
  ///
  /// In en, this message translates to:
  /// **'Story Content'**
  String get collabStoryContent;

  /// No description provided for @collabStoryContentHint.
  ///
  /// In en, this message translates to:
  /// **'Write your story here...'**
  String get collabStoryContentHint;

  /// No description provided for @collabCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get collabCancel;

  /// No description provided for @collabSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get collabSubmit;

  /// No description provided for @collabDialogAdTitle.
  ///
  /// In en, this message translates to:
  /// **'Submit Ad'**
  String get collabDialogAdTitle;

  /// No description provided for @collabBrandName.
  ///
  /// In en, this message translates to:
  /// **'Brand Name'**
  String get collabBrandName;

  /// No description provided for @collabBrandNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your brand/business name'**
  String get collabBrandNameHint;

  /// No description provided for @collabDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get collabDescription;

  /// No description provided for @collabDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe your ad'**
  String get collabDescriptionHint;

  /// No description provided for @collabTargetUrl.
  ///
  /// In en, this message translates to:
  /// **'Target URL (optional)'**
  String get collabTargetUrl;

  /// No description provided for @collabTargetUrlHint.
  ///
  /// In en, this message translates to:
  /// **'https://example.com'**
  String get collabTargetUrlHint;

  /// No description provided for @collabImageSelected.
  ///
  /// In en, this message translates to:
  /// **'Image selected'**
  String get collabImageSelected;

  /// No description provided for @collabUploadAdVisual.
  ///
  /// In en, this message translates to:
  /// **'Upload Ad Visual'**
  String get collabUploadAdVisual;

  /// No description provided for @collabStatusRunning.
  ///
  /// In en, this message translates to:
  /// **'Running'**
  String get collabStatusRunning;

  /// No description provided for @collabStatusExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get collabStatusExpired;

  /// No description provided for @languagesAppLanguage.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get languagesAppLanguage;

  /// No description provided for @languagesSubtitleLanguage.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Language'**
  String get languagesSubtitleLanguage;

  /// No description provided for @bottomNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavHome;

  /// No description provided for @bottomNavSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get bottomNavSearch;

  /// No description provided for @bottomNavCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get bottomNavCategories;

  /// No description provided for @bottomNavMyList.
  ///
  /// In en, this message translates to:
  /// **'My List'**
  String get bottomNavMyList;

  /// No description provided for @bottomNavProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get bottomNavProfile;

  /// No description provided for @networkOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline Mode'**
  String get networkOffline;

  /// No description provided for @networkDownload.
  ///
  /// In en, this message translates to:
  /// **'Download Mode'**
  String get networkDownload;

  /// No description provided for @networkOfflineSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Offline Mode On\nStart exploring download content'**
  String get networkOfflineSnackbar;

  /// No description provided for @networkDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get networkDismiss;

  /// No description provided for @loadingPleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get loadingPleaseWait;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @guestTimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Free Time Over!'**
  String get guestTimerTitle;

  /// No description provided for @guestTimerBody.
  ///
  /// In en, this message translates to:
  /// **'Now login to access all content.\nIt\'s free for you!'**
  String get guestTimerBody;

  /// No description provided for @freeLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'Free Limit Reached'**
  String get freeLimitTitle;

  /// No description provided for @freeLimitBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ve used your 1-minute free listening. Please login or sign up to continue listening to the full episode.'**
  String get freeLimitBody;

  /// No description provided for @guestTimerLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get guestTimerLater;

  /// No description provided for @guestTimerLogin.
  ///
  /// In en, this message translates to:
  /// **'Login / Sign Up'**
  String get guestTimerLogin;

  /// No description provided for @errorDataError.
  ///
  /// In en, this message translates to:
  /// **'A data error occurred. Please try again.'**
  String get errorDataError;

  /// No description provided for @errorInvalidData.
  ///
  /// In en, this message translates to:
  /// **'Invalid data format received.'**
  String get errorInvalidData;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get errorUnexpected;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out. Please check your internet connection.'**
  String get errorTimeout;

  /// No description provided for @errorNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please check your network settings.'**
  String get errorNoInternet;

  /// No description provided for @errorCancelled.
  ///
  /// In en, this message translates to:
  /// **'Request was cancelled.'**
  String get errorCancelled;

  /// No description provided for @errorSecurity.
  ///
  /// In en, this message translates to:
  /// **'Connection security error. Please update your app.'**
  String get errorSecurity;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'An unexpected network error occurred.'**
  String get errorNetwork;

  /// No description provided for @errorInvalidRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid request. Please verify your input.'**
  String get errorInvalidRequest;

  /// No description provided for @errorSessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Session expired. Please sign in again.'**
  String get errorSessionExpired;

  /// No description provided for @errorPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to perform this action.'**
  String get errorPermissionDenied;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested resource was not found.'**
  String get errorNotFound;

  /// No description provided for @errorConflict.
  ///
  /// In en, this message translates to:
  /// **'Conflict detected. The resource may have been updated.'**
  String get errorConflict;

  /// No description provided for @errorValidationFailed.
  ///
  /// In en, this message translates to:
  /// **'Validation failed. Please check your input.'**
  String get errorValidationFailed;

  /// No description provided for @errorTooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again later.'**
  String get errorTooManyRequests;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get errorServer;

  /// No description provided for @errorServiceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Service temporarily unavailable. Please try again.'**
  String get errorServiceUnavailable;

  /// No description provided for @errorUnderMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Service is under maintenance. Please try again later.'**
  String get errorUnderMaintenance;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. (Error {code})'**
  String errorGeneric(Object code);

  /// No description provided for @errorConnectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out. Please try again.'**
  String get errorConnectionTimeout;

  /// No description provided for @errorNoConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get errorNoConnection;

  /// No description provided for @errorServerWithCode.
  ///
  /// In en, this message translates to:
  /// **'Server error ({code})'**
  String errorServerWithCode(Object code);

  /// No description provided for @errorSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorSomethingWentWrong;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get pageNotFound;

  /// No description provided for @pageNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'The page you\'re looking for doesn\'t exist.'**
  String get pageNotFoundMessage;

  /// No description provided for @goHome.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get goHome;

  /// No description provided for @relativeTimeJustNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get relativeTimeJustNow;

  /// No description provided for @relativeTimeMinAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m ago'**
  String relativeTimeMinAgo(Object minutes);

  /// No description provided for @relativeTimeHourAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String relativeTimeHourAgo(Object hours);

  /// No description provided for @relativeTimeDayAgo.
  ///
  /// In en, this message translates to:
  /// **'{days}d ago'**
  String relativeTimeDayAgo(Object days);

  /// No description provided for @relativeTimeWeekAgo.
  ///
  /// In en, this message translates to:
  /// **'{weeks}w ago'**
  String relativeTimeWeekAgo(Object weeks);

  /// No description provided for @relativeTimeMonthAgo.
  ///
  /// In en, this message translates to:
  /// **'{months}mo ago'**
  String relativeTimeMonthAgo(Object months);

  /// No description provided for @relativeTimeYearAgo.
  ///
  /// In en, this message translates to:
  /// **'{years}y ago'**
  String relativeTimeYearAgo(Object years);

  /// No description provided for @relativeTimeInMin.
  ///
  /// In en, this message translates to:
  /// **'in {minutes}m'**
  String relativeTimeInMin(Object minutes);

  /// No description provided for @relativeTimeInHour.
  ///
  /// In en, this message translates to:
  /// **'in {hours}h'**
  String relativeTimeInHour(Object hours);

  /// No description provided for @relativeTimeInDay.
  ///
  /// In en, this message translates to:
  /// **'in {days}d'**
  String relativeTimeInDay(Object days);

  /// No description provided for @durationFormatHours.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String durationFormatHours(Object hours, Object minutes);

  /// No description provided for @durationFormatMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m {seconds}s'**
  String durationFormatMinutes(Object minutes, Object seconds);

  /// No description provided for @fileSizeBytes.
  ///
  /// In en, this message translates to:
  /// **'{size} B'**
  String fileSizeBytes(Object size);

  /// No description provided for @fileSizeKB.
  ///
  /// In en, this message translates to:
  /// **'{size} KB'**
  String fileSizeKB(Object size);

  /// No description provided for @fileSizeMB.
  ///
  /// In en, this message translates to:
  /// **'{size} MB'**
  String fileSizeMB(Object size);

  /// No description provided for @fileSizeGB.
  ///
  /// In en, this message translates to:
  /// **'{size} GB'**
  String fileSizeGB(Object size);

  /// No description provided for @countViewsM.
  ///
  /// In en, this message translates to:
  /// **'{count}M'**
  String countViewsM(Object count);

  /// No description provided for @countViewsK.
  ///
  /// In en, this message translates to:
  /// **'{count}K'**
  String countViewsK(Object count);

  /// No description provided for @episodeCount.
  ///
  /// In en, this message translates to:
  /// **'{count} ep'**
  String episodeCount(Object count);

  /// No description provided for @seasonEpisodeFormat.
  ///
  /// In en, this message translates to:
  /// **'S{season} E{episode}'**
  String seasonEpisodeFormat(Object season, Object episode);

  /// No description provided for @seasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Season {season}'**
  String seasonLabel(Object season);

  /// No description provided for @episodeNotAvailableInLanguage.
  ///
  /// In en, this message translates to:
  /// **'No episodes available in {language}'**
  String episodeNotAvailableInLanguage(Object language);

  /// No description provided for @contentDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.'**
  String get contentDisclaimer;

  /// No description provided for @categoryDrama.
  ///
  /// In en, this message translates to:
  /// **'Drama'**
  String get categoryDrama;

  /// No description provided for @categoryComedy.
  ///
  /// In en, this message translates to:
  /// **'Comedy'**
  String get categoryComedy;

  /// No description provided for @categoryPodcasts.
  ///
  /// In en, this message translates to:
  /// **'Podcasts'**
  String get categoryPodcasts;

  /// No description provided for @categoryMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get categoryMusic;

  /// No description provided for @categoryKids.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get categoryKids;

  /// No description provided for @categoryDevotional.
  ///
  /// In en, this message translates to:
  /// **'Devotional'**
  String get categoryDevotional;

  /// No description provided for @categoryNews.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get categoryNews;

  /// No description provided for @categorySports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get categorySports;

  /// No description provided for @categoryTechnology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get categoryTechnology;

  /// No description provided for @categoryEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get categoryEducation;

  /// No description provided for @categoryBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get categoryBusiness;

  /// No description provided for @categoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get categoryHealth;

  /// No description provided for @categoryScience.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get categoryScience;

  /// No description provided for @categoryArts.
  ///
  /// In en, this message translates to:
  /// **'Arts'**
  String get categoryArts;

  /// No description provided for @trendingDramaSeries.
  ///
  /// In en, this message translates to:
  /// **'Drama Series'**
  String get trendingDramaSeries;

  /// No description provided for @trendingComedyShows.
  ///
  /// In en, this message translates to:
  /// **'Comedy Shows'**
  String get trendingComedyShows;

  /// No description provided for @trendingPodcasts.
  ///
  /// In en, this message translates to:
  /// **'Podcasts'**
  String get trendingPodcasts;

  /// No description provided for @trendingMusicAlbums.
  ///
  /// In en, this message translates to:
  /// **'Music Albums'**
  String get trendingMusicAlbums;

  /// No description provided for @trendingKidsStories.
  ///
  /// In en, this message translates to:
  /// **'Kids Stories'**
  String get trendingKidsStories;

  /// No description provided for @trendingDevotional.
  ///
  /// In en, this message translates to:
  /// **'Devotional'**
  String get trendingDevotional;

  /// No description provided for @trendingNewsToday.
  ///
  /// In en, this message translates to:
  /// **'News Today'**
  String get trendingNewsToday;

  /// No description provided for @trendingSportsHighlights.
  ///
  /// In en, this message translates to:
  /// **'Sports Highlights'**
  String get trendingSportsHighlights;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageHindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get languageHindi;

  /// No description provided for @languagePunjabi.
  ///
  /// In en, this message translates to:
  /// **'Punjabi'**
  String get languagePunjabi;

  /// No description provided for @languageHaryanvi.
  ///
  /// In en, this message translates to:
  /// **'Haryanvi'**
  String get languageHaryanvi;

  /// No description provided for @languageMarathi.
  ///
  /// In en, this message translates to:
  /// **'Marathi'**
  String get languageMarathi;

  /// No description provided for @languageGujarati.
  ///
  /// In en, this message translates to:
  /// **'Gujarati'**
  String get languageGujarati;

  /// No description provided for @languageBengali.
  ///
  /// In en, this message translates to:
  /// **'Bengali'**
  String get languageBengali;

  /// No description provided for @languageTamil.
  ///
  /// In en, this message translates to:
  /// **'Tamil'**
  String get languageTamil;

  /// No description provided for @languageTelugu.
  ///
  /// In en, this message translates to:
  /// **'Telugu'**
  String get languageTelugu;

  /// No description provided for @languageKannada.
  ///
  /// In en, this message translates to:
  /// **'Kannada'**
  String get languageKannada;

  /// No description provided for @languageMalayalam.
  ///
  /// In en, this message translates to:
  /// **'Malayalam'**
  String get languageMalayalam;

  /// No description provided for @languageUrdu.
  ///
  /// In en, this message translates to:
  /// **'Urdu'**
  String get languageUrdu;

  /// No description provided for @pressBackToExit.
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit'**
  String get pressBackToExit;

  /// No description provided for @exitDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Exit App?'**
  String get exitDialogTitle;

  /// No description provided for @exitDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit?'**
  String get exitDialogBody;

  /// No description provided for @exitDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exitDialogConfirm;

  /// No description provided for @exitDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get exitDialogCancel;

  /// No description provided for @profileShareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get profileShareApp;

  /// No description provided for @profileShareAppMessage.
  ///
  /// In en, this message translates to:
  /// **'Check out WebroFM - your go-to app for streaming shows and podcasts!'**
  String get profileShareAppMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'bn',
    'en',
    'gu',
    'hi',
    'kn',
    'ml',
    'mr',
    'pa',
    'ta',
    'te',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'kn':
      return AppLocalizationsKn();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'pa':
      return AppLocalizationsPa();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
