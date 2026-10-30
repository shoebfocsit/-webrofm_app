// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'WebroFM';

  @override
  String get splashLoading => 'Loading...';

  @override
  String get welcomeTitle => 'Welcome to WebroFM';

  @override
  String get welcomeSubtitle => 'Discover stories that move you';

  @override
  String get welcomeGetStarted => 'Get Started';

  @override
  String get welcomeContinueAsGuest => 'Continue as Guest';

  @override
  String get loginSearchCountries => 'Search countries';

  @override
  String get loginInvalidPhone => 'Please enter a valid phone number';

  @override
  String get loginRateLimitTitle => 'Rate Limit Reached';

  @override
  String get loginRateLimitContent =>
      'Too many OTP attempts. Please try again after 1 hour.';

  @override
  String get loginOk => 'OK';

  @override
  String loginAttemptRemaining(Object remaining) {
    return 'Only $remaining attempt remaining this hour';
  }

  @override
  String get loginTitle => 'Login to Continue';

  @override
  String get loginSubtitle => 'Enter your phone number to get started';

  @override
  String get loginPhoneHint => '(555) 000-0000';

  @override
  String get loginIAgreeTo => 'I agree to the ';

  @override
  String get loginTermsOfUse => 'Terms of Use';

  @override
  String get loginAnd => ' and ';

  @override
  String get loginPrivacyPolicy => 'Privacy Policy';

  @override
  String get loginSendOtp => 'Send OTP';

  @override
  String get loginContinueAsGuest => 'Continue as Guest';

  @override
  String get otpEnterCompleteCode => 'Please enter the complete 6-digit code';

  @override
  String get otpTitle => 'Verify Your Number';

  @override
  String get otpSubtitle => 'Enter the code sent to';

  @override
  String get otpVerifyAndContinue => 'Verify & Continue';

  @override
  String get otpDidntReceive => 'Didn\'t receive the code? ';

  @override
  String get otpResend => 'Resend OTP';

  @override
  String get completeProfileTitle => 'Complete Your Profile';

  @override
  String get completeProfileSubtitle => 'Help us personalise your experience';

  @override
  String get completeProfileBasicInfo => 'Basic Info';

  @override
  String get completeProfileFullName => 'Full Name *';

  @override
  String get completeProfileNameHint => 'John Doe';

  @override
  String get completeProfileEmail => 'Email Address';

  @override
  String get completeProfileEmailHint => 'john@example.com';

  @override
  String get completeProfileGender => 'Gender *';

  @override
  String get completeProfileDateOfBirth => 'Date of Birth';

  @override
  String get completeProfileDobHint => 'Select your date of birth';

  @override
  String get completeProfileMale => 'Male';

  @override
  String get completeProfileFemale => 'Female';

  @override
  String get completeProfileOther => 'Other';

  @override
  String get completeProfileError => 'Please enter your name and select gender';

  @override
  String get completeProfileSkip => 'Skip';

  @override
  String get completeProfileContinue => 'Continue';

  @override
  String get interestTitle => 'Pick Your Interests';

  @override
  String get interestSubtitle =>
      'Select categories you enjoy to get personalised recommendations';

  @override
  String get interestSectionHeader => 'Choose Your Interests';

  @override
  String get interestTapToSelect => 'Tap to select';

  @override
  String get interestContinue => 'Continue to WebroFM';

  @override
  String get interestSkip => 'Skip';

  @override
  String get registrationTitle => 'Tell us about yourself';

  @override
  String get registrationSubtitle => 'Help us personalize your experience';

  @override
  String get registrationPersonalInfo => 'Personal Information';

  @override
  String get registrationFullName => 'Full Name';

  @override
  String get registrationNameHint => 'John Doe';

  @override
  String get registrationEmail => 'Email Address';

  @override
  String get registrationEmailHint => 'john@example.com';

  @override
  String get registrationDob => 'Date of Birth';

  @override
  String get registrationDobHint => 'Select your date of birth';

  @override
  String get registrationInterestsHeader => 'Choose Your Interests';

  @override
  String get registrationInterestsSubtitle => 'Select categories you enjoy';

  @override
  String get registrationContinue => 'Continue to WebroFM';

  @override
  String get registrationNameError => 'Please enter your name';

  @override
  String get homeContinueWatching => 'Continue Watching';

  @override
  String get homeContinueListening => 'Continue Listening';

  @override
  String get homeResume => 'Resume';

  @override
  String get homeNewArrivals => 'New Arrivals';

  @override
  String get homeSeeAll => 'See All';

  @override
  String get homePopularNow => 'Popular Now';

  @override
  String get homeNoShows => 'No shows available';

  @override
  String get showDetailFailed => 'Failed to load';

  @override
  String get showDetailNotFound => 'Show not found';

  @override
  String showDetailShareText(Object title) {
    return 'Check out $title on WebroFM!';
  }

  @override
  String get showDetailDownloadStarted => 'Download started';

  @override
  String get showDetailNoDescription => 'No description available.';

  @override
  String get showDetailReadLess => 'Read less';

  @override
  String get showDetailReadMore => 'Read more';

  @override
  String get showDetailPlayLatest => 'Play Latest Episode';

  @override
  String get showDetailEpisodes => 'Episodes';

  @override
  String get showDetailNoEpisodes => 'No episodes available';

  @override
  String get showDetailMoreLikeThis => 'More Like This';

  @override
  String get videoPlayerNoAudio => 'No audio available for this episode';

  @override
  String get videoPlayerLoading => 'Loading video...';

  @override
  String get videoPlayerNowPlaying => 'Now Playing';

  @override
  String get videoPlayerPaused => 'Paused';

  @override
  String videoPlayerPlaybackError(Object message) {
    return 'Playback error: $message';
  }

  @override
  String get videoPlayerVideoPlayer => 'Video Player';

  @override
  String get videoPlayerNext => 'Next';

  @override
  String get videoPlayerAudio => 'Audio';

  @override
  String get videoPlayerVideo => 'Video';

  @override
  String get showCardNew => 'NEW';

  @override
  String get searchHint => 'Search shows, episodes...';

  @override
  String get searchTrending => 'Trending Searches';

  @override
  String get searchSuggested => 'Suggested for You';

  @override
  String get searchError => 'Something went wrong';

  @override
  String get searchNoResults => 'No results found';

  @override
  String get searchNoResultsSubtitle => 'Try adjusting your search terms';

  @override
  String get categoriesTitle => 'Explore Categories';

  @override
  String categoriesShowCount(Object count) {
    return '$count shows';
  }

  @override
  String get categoryDetailFailed => 'Failed to load';

  @override
  String get categoryDetailLoadMore => 'Load More';

  @override
  String get categoryDetailSortBy => 'Sort By';

  @override
  String get categoryDetailPopular => 'Popular';

  @override
  String get categoryDetailNewest => 'Newest';

  @override
  String get categoryDetailTopRated => 'Top Rated';

  @override
  String get myListTitle => 'My List';

  @override
  String get myListSaved => 'Saved';

  @override
  String get myListWatchHistory => 'Watch History';

  @override
  String get myListError => 'Something went wrong';

  @override
  String get myListNoSaved => 'No saved items yet';

  @override
  String get myListNoHistory => 'No watch history yet';

  @override
  String get myListNoSavedSubtitle => 'Start exploring and save your favorites';

  @override
  String get myListNoHistorySubtitle =>
      'Your recently watched shows will appear here';

  @override
  String get myListExploreShows => 'Explore Shows';

  @override
  String get myListRemoved => 'Removed from My List';

  @override
  String get myListLoginTitle => 'Login to see your saved shows';

  @override
  String get myListLoginSubtitle =>
      'Save your favorite shows and access them anytime';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileUser => 'User';

  @override
  String get profileNoPhone => 'No phone';

  @override
  String get profileEditProfile => 'Edit Profile';

  @override
  String get profileYourInterests => 'Your Interests';

  @override
  String get profileNoCategories => 'No categories selected';

  @override
  String get profileDobLabel => 'DOB';

  @override
  String get profileNotLoggedIn => 'You\'re not logged in';

  @override
  String get profileNotLoggedInSubtitle =>
      'Sign in to access your profile, downloads, and personalized recommendations.';

  @override
  String get profileLogin => 'Login';

  @override
  String get profileCollaboration => 'Collaboration';

  @override
  String get profileSettings => 'Settings & Preferences';

  @override
  String get profileMyDownloads => 'My Downloads';

  @override
  String get profileTermsOfUse => 'Terms of Use';

  @override
  String get profilePrivacyPolicy => 'Privacy Policy';

  @override
  String get profileHelpFaq => 'Help & FAQ';

  @override
  String get profileContactUs => 'Contact Us';

  @override
  String get profileLogout => 'Logout';

  @override
  String get profileLogoutTitle => 'Logout';

  @override
  String get profileLogoutConfirm => 'Are you sure you want to logout?';

  @override
  String get profileCancel => 'Cancel';

  @override
  String get editProfileTitle => 'Edit Profile';

  @override
  String get editProfileTapToChangePhoto => 'Tap to change photo';

  @override
  String get editProfileFullName => 'Full Name';

  @override
  String get editProfileNameRequired => 'Name is required';

  @override
  String get editProfileEmail => 'Email';

  @override
  String get editProfileEmailRequired => 'Email is required';

  @override
  String get editProfileInvalidEmail => 'Invalid email';

  @override
  String get editProfileDob => 'Date of Birth';

  @override
  String get editProfilePhone => 'Phone';

  @override
  String get editProfileCategoryPreferences => 'Category Preferences';

  @override
  String get editProfileAddMore => 'Add More';

  @override
  String get editProfileAddCategory => 'Add Category';

  @override
  String get editProfileSaveChanges => 'Save Changes';

  @override
  String get editProfileUserDataNotAvailable => 'User data not available';

  @override
  String get editProfileUpdatedSuccess => 'Profile updated successfully';

  @override
  String get editProfileCancel => 'Cancel';

  @override
  String get editProfileSubmit => 'Submit';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsGeneral => 'General';

  @override
  String get settingsAppLanguage => 'App Language';

  @override
  String get settingsSubtitleLanguage => 'Subtitle Language';

  @override
  String get settingsAppearancePlayback => 'Appearance & Playback';

  @override
  String get settingsColorTheme => 'Color Theme';

  @override
  String get settingsLight => 'Light';

  @override
  String get settingsDark => 'Dark';

  @override
  String get settingsSystem => 'System';

  @override
  String get settingsAutoplayNext => 'Autoplay Next Episode';

  @override
  String get settingsDownloadQuality => 'Download Quality';

  @override
  String get settingsLow => 'Low';

  @override
  String get settingsMedium => 'Medium';

  @override
  String get settingsHigh => 'High';

  @override
  String get settingsVeryHigh => 'Very High';

  @override
  String get settingsAccountPrivacy => 'Account & Privacy';

  @override
  String get settingsAgeRestriction => 'Age/Content Restriction';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsDangerZone => 'Danger Zone';

  @override
  String get settingsDeleteAccount => 'Delete My Account';

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountHeader => 'Delete My Account';

  @override
  String get deleteAccountWarning =>
      'This action cannot be undone. All your data will be permanently removed.';

  @override
  String get deleteAccountDataLoss => 'The following data will be lost:';

  @override
  String get deleteAccountReason => 'Reason for deletion';

  @override
  String get deleteAccountSelectReason => 'Select a reason';

  @override
  String get deleteAccountNotUsing => 'I don\'t use the app anymore';

  @override
  String get deleteAccountTooExpensive => 'Too expensive';

  @override
  String get deleteAccountPrivacy => 'Privacy concerns';

  @override
  String get deleteAccountTechnicalIssues => 'Technical issues';

  @override
  String get deleteAccountFoundAlternative => 'Found a better alternative';

  @override
  String get deleteAccountOther => 'Other';

  @override
  String get deleteAccountProfileSettings => 'Profile & Settings';

  @override
  String get deleteAccountProfileSettingsDesc =>
      'Your profile information, preferences, and app settings will be permanently deleted.';

  @override
  String get deleteAccountListeningHistory => 'Listening History';

  @override
  String get deleteAccountListeningHistoryDesc =>
      'Your listening history, search history, and activity logs will be erased.';

  @override
  String get deleteAccountSavedItems => 'Saved Items';

  @override
  String get deleteAccountSavedItemsDesc =>
      'All your playlists, favorites, and saved content will be removed.';

  @override
  String get deleteAccountSubscriptions => 'Subscriptions';

  @override
  String get deleteAccountSubscriptionsDesc =>
      'Any active subscriptions will be cancelled and premium access will end.';

  @override
  String get deleteAccountDelete => 'Delete My Account';

  @override
  String get deleteAccountCancel => 'Cancel';

  @override
  String get deleteAccountOtpTitle => 'Verify Deletion';

  @override
  String deleteAccountOtpSubtitle(Object phone) {
    return 'Enter the OTP sent to $phone';
  }

  @override
  String get deleteAccountOtpConfirm => 'Confirm Deletion';

  @override
  String get deleteAccountOtpResend => 'Resend OTP';

  @override
  String get deleteAccountOtpResent => 'OTP resent successfully';

  @override
  String get accountDeletedTitle => 'Account Deleted';

  @override
  String get accountDeletedMessage =>
      'Your account has been permanently deleted.\nWe\'re sorry to see you go.';

  @override
  String get accountDeletedBackToHome => 'Back to Home';

  @override
  String get contactUsTitle => 'Contact Us';

  @override
  String get contactUsSubtitle => 'We\'d love to hear from you';

  @override
  String get contactUsSubject => 'Subject';

  @override
  String get contactUsMessageLabel => 'Message';

  @override
  String get contactUsMessageHint => 'Describe your issue or question...';

  @override
  String get contactUsAddAttachment => 'Add Attachment';

  @override
  String get contactUsQuickContact => 'Quick Contact';

  @override
  String get contactUsEmail => 'Email';

  @override
  String get contactUsEmailValue => 'support@webrofm.com';

  @override
  String get contactUsCall => 'Call';

  @override
  String get contactUsCallValue => '+1 (555) 123-4567';

  @override
  String get contactUsWhatsApp => 'WhatsApp';

  @override
  String get contactUsWhatsAppValue => 'Chat with us';

  @override
  String get contactUsSend => 'Send Message';

  @override
  String get contactUsSending => 'Sending...';

  @override
  String get contactUsNoMessage => 'Please enter a message';

  @override
  String get contactUsSent => 'Message sent successfully!';

  @override
  String get contactUsGeneralInquiry => 'General Inquiry';

  @override
  String get contactUsTechnicalSupport => 'Technical Support';

  @override
  String get contactUsAccountIssue => 'Account Issue';

  @override
  String get contactUsBillingQuestion => 'Billing Question';

  @override
  String get contactUsFeatureRequest => 'Feature Request';

  @override
  String get contactUsBugReport => 'Bug Report';

  @override
  String get helpFaqTitle => 'Help & FAQ';

  @override
  String get helpFaqSearchHint => 'Search FAQs...';

  @override
  String get helpFaqNoResults => 'No results found';

  @override
  String get helpFaqStillNeedHelp => 'Still need help?';

  @override
  String get helpFaqContactUs => 'Contact Us';

  @override
  String get helpFaqAll => 'All';

  @override
  String get helpFaqAccount => 'Account';

  @override
  String get helpFaqPlayback => 'Playback';

  @override
  String get helpFaqBilling => 'Billing';

  @override
  String get helpFaqOther => 'Other';

  @override
  String get helpFaq1Q => 'How do I reset my password?';

  @override
  String get helpFaq1A =>
      'You can reset your password from the login screen by tapping \'Forgot Password\'. Follow the instructions sent to your registered email or phone.';

  @override
  String get helpFaq2Q => 'Can I change my subscription plan?';

  @override
  String get helpFaq2A =>
      'Yes, go to Settings > Subscription to view and change your current plan. Changes will take effect from the next billing cycle.';

  @override
  String get helpFaq3Q => 'How do I delete my account?';

  @override
  String get helpFaq3A =>
      'Go to Settings > Danger Zone > Delete My Account. Follow the verification steps to permanently delete your account.';

  @override
  String get helpFaq4Q => 'Where are my downloaded files?';

  @override
  String get helpFaq4A =>
      'Downloaded episodes are stored within the app under My Downloads. They are available offline for listening anytime.';

  @override
  String get helpFaq5Q => 'How do I update my profile information?';

  @override
  String get helpFaq5A =>
      'Go to Profile > Edit Profile to update your name, email, date of birth, and profile picture.';

  @override
  String get helpFaq6Q => 'Why is my audio not playing?';

  @override
  String get helpFaq6A =>
      'Check your internet connection and try restarting the app. If the issue persists, try clearing the app cache from Settings.';

  @override
  String get helpFaq7Q => 'How do I get a refund?';

  @override
  String get helpFaq7A =>
      'Contact our support team at support@webrofm.com with your transaction details. We\'ll process your refund within 5-7 business days.';

  @override
  String get helpFaq8Q => 'How do I report a bug?';

  @override
  String get helpFaq8A =>
      'You can report bugs through the Contact Us section in Settings. Please include steps to reproduce the issue and your device information.';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyLastUpdated => 'Last updated: July 22, 2026';

  @override
  String get privacyPolicyCollection => 'Collection';

  @override
  String get privacyPolicyCollectionTitle => 'Information We Collect';

  @override
  String get privacyPolicyCollectionText =>
      'We collect information you provide directly, such as your name, email address, phone number, and profile picture. We also automatically collect certain information when you use our services, including device information, usage data, and listening preferences.';

  @override
  String get privacyPolicyUsage => 'Usage';

  @override
  String get privacyPolicyUsageTitle => 'How We Use Your Information';

  @override
  String get privacyPolicyUsageText =>
      'We use the information we collect to provide, maintain, and improve our streaming services, personalize your experience, send you updates and promotional materials, and ensure the security of our platform.';

  @override
  String get privacyPolicySharing => 'Sharing';

  @override
  String get privacyPolicySharingTitle => 'Information Sharing';

  @override
  String get privacyPolicySharingText =>
      'We do not sell your personal information. We may share your data with trusted service providers who assist us in operating our platform, subject to strict confidentiality agreements.';

  @override
  String get privacyPolicySecurity => 'Security';

  @override
  String get privacyPolicySecurityTitle => 'Data Security';

  @override
  String get privacyPolicySecurityText =>
      'We implement industry-standard security measures to protect your personal information, including encryption in transit and at rest, regular security audits, and access controls.';

  @override
  String get privacyPolicyRights => 'Rights';

  @override
  String get privacyPolicyRightsTitle => 'Your Rights & Choices';

  @override
  String get privacyPolicyRightsText =>
      'You have the right to access, update, or delete your personal information at any time through your account settings. You can also contact us directly for any privacy-related requests.';

  @override
  String get termsOfUseTitle => 'Terms of Use';

  @override
  String get termsOfUseUsage => 'Usage';

  @override
  String get termsOfUseUsageTitle => 'Usage Guidelines';

  @override
  String get termsOfUseUsageText =>
      'By using WebroFM, you agree to use the service for lawful purposes only. You may not modify, distribute, or reproduce any content from our platform without prior written consent. We reserve the right to suspend or terminate access for violations of these terms.';

  @override
  String get termsOfUseAccounts => 'Accounts';

  @override
  String get termsOfUseAccountsTitle => 'User Accounts';

  @override
  String get termsOfUseAccountsText =>
      'You are responsible for maintaining the confidentiality of your account credentials. You must provide accurate and complete information when creating an account. You must notify us immediately of any unauthorized use of your account.';

  @override
  String get termsOfUseContent => 'Content';

  @override
  String get termsOfUseContentTitle => 'Content & Intellectual Property';

  @override
  String get termsOfUseContentText =>
      'All content available on WebroFM, including audio streams, videos, and artwork, is protected by copyright and intellectual property laws. Users may not download, record, or redistribute content without explicit permission.';

  @override
  String get termsOfUseLiability => 'Liability';

  @override
  String get termsOfUseLiabilityTitle => 'Limitation of Liability';

  @override
  String get termsOfUseLiabilityText =>
      'WebroFM shall not be liable for any indirect, incidental, or consequential damages arising from your use of the service. Our total liability shall not exceed the amount paid by you for the service in the past 12 months.';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsEmptyTitle => 'No Notifications';

  @override
  String get notificationsEmptySubtitle =>
      'You\'re all caught up! Check back later for updates.';

  @override
  String get downloadsTitle => 'My Downloads';

  @override
  String get downloadsEmptyTitle => 'No Downloads Yet';

  @override
  String get downloadsEmptySubtitle =>
      'Your downloaded episodes will appear here so you can listen offline anytime.';

  @override
  String get downloadsBrowseShows => 'Browse Shows';

  @override
  String get premiumTitle => 'Premium';

  @override
  String get collabTitle => 'Collaboration';

  @override
  String get collabMyStories => 'My Stories';

  @override
  String get collabMySponsorships => 'My Sponsorships';

  @override
  String get collabNoStories => 'No stories submitted yet.';

  @override
  String get collabNoSponsorships => 'No sponsorships submitted yet.';

  @override
  String get collabApproved => 'Approved';

  @override
  String get collabRejected => 'Rejected';

  @override
  String get collabReviewing => 'Reviewing';

  @override
  String get collabPending => 'Pending';

  @override
  String get collabShareYourStory => 'Share Your Story';

  @override
  String get collabShareYourStorySubtitle =>
      'Submit your original story for a chance to be featured.';

  @override
  String get collabSubmitStory => 'Submit Story';

  @override
  String get collabSponsorshipAd => 'Sponsorship / Ad';

  @override
  String get collabSponsorshipSubtitle =>
      'Submit your brand or business for sponsorship.';

  @override
  String get collabSubmitAd => 'Submit Ad';

  @override
  String get collabDialogStoryTitle => 'Submit Your Story';

  @override
  String get collabStoryTitle => 'Story Title';

  @override
  String get collabStoryTitleHint => 'Enter your story title';

  @override
  String get collabStoryContent => 'Story Content';

  @override
  String get collabStoryContentHint => 'Write your story here...';

  @override
  String get collabCancel => 'Cancel';

  @override
  String get collabSubmit => 'Submit';

  @override
  String get collabDialogAdTitle => 'Submit Ad';

  @override
  String get collabBrandName => 'Brand Name';

  @override
  String get collabBrandNameHint => 'Your brand/business name';

  @override
  String get collabDescription => 'Description';

  @override
  String get collabDescriptionHint => 'Describe your ad';

  @override
  String get collabTargetUrl => 'Target URL (optional)';

  @override
  String get collabTargetUrlHint => 'https://example.com';

  @override
  String get collabImageSelected => 'Image selected';

  @override
  String get collabUploadAdVisual => 'Upload Ad Visual';

  @override
  String get collabStatusRunning => 'Running';

  @override
  String get collabStatusExpired => 'Expired';

  @override
  String get languagesAppLanguage => 'App Language';

  @override
  String get languagesSubtitleLanguage => 'Subtitle Language';

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavSearch => 'Search';

  @override
  String get bottomNavCategories => 'Categories';

  @override
  String get bottomNavMyList => 'My List';

  @override
  String get bottomNavProfile => 'Profile';

  @override
  String get networkOffline => 'Offline Mode';

  @override
  String get networkDownload => 'Download Mode';

  @override
  String get networkOfflineSnackbar =>
      'Offline Mode On\nStart exploring download content';

  @override
  String get networkDismiss => 'Dismiss';

  @override
  String get loadingPleaseWait => 'Please wait...';

  @override
  String get commonRetry => 'Retry';

  @override
  String get guestTimerTitle => 'Free Time Over!';

  @override
  String get guestTimerBody =>
      'Now login to access all content.\nIt\'s free for you!';

  @override
  String get freeLimitTitle => 'Free Limit Reached';

  @override
  String get freeLimitBody =>
      'You\'ve used your 1-minute free listening. Please login or sign up to continue listening to the full episode.';

  @override
  String get guestTimerLater => 'Later';

  @override
  String get guestTimerLogin => 'Login / Sign Up';

  @override
  String get errorDataError => 'A data error occurred. Please try again.';

  @override
  String get errorInvalidData => 'Invalid data format received.';

  @override
  String get errorUnexpected => 'An unexpected error occurred.';

  @override
  String get errorTimeout =>
      'Connection timed out. Please check your internet connection.';

  @override
  String get errorNoInternet =>
      'No internet connection. Please check your network settings.';

  @override
  String get errorCancelled => 'Request was cancelled.';

  @override
  String get errorSecurity =>
      'Connection security error. Please update your app.';

  @override
  String get errorNetwork => 'An unexpected network error occurred.';

  @override
  String get errorInvalidRequest =>
      'Invalid request. Please verify your input.';

  @override
  String get errorSessionExpired => 'Session expired. Please sign in again.';

  @override
  String get errorPermissionDenied =>
      'You do not have permission to perform this action.';

  @override
  String get errorNotFound => 'The requested resource was not found.';

  @override
  String get errorConflict =>
      'Conflict detected. The resource may have been updated.';

  @override
  String get errorValidationFailed =>
      'Validation failed. Please check your input.';

  @override
  String get errorTooManyRequests =>
      'Too many requests. Please try again later.';

  @override
  String get errorServer => 'Server error. Please try again later.';

  @override
  String get errorServiceUnavailable =>
      'Service temporarily unavailable. Please try again.';

  @override
  String get errorUnderMaintenance =>
      'Service is under maintenance. Please try again later.';

  @override
  String errorGeneric(Object code) {
    return 'Something went wrong. (Error $code)';
  }

  @override
  String get errorConnectionTimeout =>
      'Connection timed out. Please try again.';

  @override
  String get errorNoConnection => 'No internet connection.';

  @override
  String errorServerWithCode(Object code) {
    return 'Server error ($code)';
  }

  @override
  String get errorSomethingWentWrong =>
      'Something went wrong. Please try again.';

  @override
  String get pageNotFound => 'Page Not Found';

  @override
  String get pageNotFoundMessage =>
      'The page you\'re looking for doesn\'t exist.';

  @override
  String get goHome => 'Go Home';

  @override
  String get relativeTimeJustNow => 'just now';

  @override
  String relativeTimeMinAgo(Object minutes) {
    return '${minutes}m ago';
  }

  @override
  String relativeTimeHourAgo(Object hours) {
    return '${hours}h ago';
  }

  @override
  String relativeTimeDayAgo(Object days) {
    return '${days}d ago';
  }

  @override
  String relativeTimeWeekAgo(Object weeks) {
    return '${weeks}w ago';
  }

  @override
  String relativeTimeMonthAgo(Object months) {
    return '${months}mo ago';
  }

  @override
  String relativeTimeYearAgo(Object years) {
    return '${years}y ago';
  }

  @override
  String relativeTimeInMin(Object minutes) {
    return 'in ${minutes}m';
  }

  @override
  String relativeTimeInHour(Object hours) {
    return 'in ${hours}h';
  }

  @override
  String relativeTimeInDay(Object days) {
    return 'in ${days}d';
  }

  @override
  String durationFormatHours(Object hours, Object minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String durationFormatMinutes(Object minutes, Object seconds) {
    return '${minutes}m ${seconds}s';
  }

  @override
  String fileSizeBytes(Object size) {
    return '$size B';
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
    return '${count}M';
  }

  @override
  String countViewsK(Object count) {
    return '${count}K';
  }

  @override
  String episodeCount(Object count) {
    return '$count ep';
  }

  @override
  String seasonEpisodeFormat(Object season, Object episode) {
    return 'S$season E$episode';
  }

  @override
  String seasonLabel(Object season) {
    return 'Season $season';
  }

  @override
  String episodeNotAvailableInLanguage(Object language) {
    return 'No episodes available in $language';
  }

  @override
  String get contentDisclaimer =>
      'Disclaimer: All audio and video content is entirely fictional and created for entertainment only. It does not depict, represent, or refer to any real person, story, or event.';

  @override
  String get categoryDrama => 'Drama';

  @override
  String get categoryComedy => 'Comedy';

  @override
  String get categoryPodcasts => 'Podcasts';

  @override
  String get categoryMusic => 'Music';

  @override
  String get categoryKids => 'Kids';

  @override
  String get categoryDevotional => 'Devotional';

  @override
  String get categoryNews => 'News';

  @override
  String get categorySports => 'Sports';

  @override
  String get categoryTechnology => 'Technology';

  @override
  String get categoryEducation => 'Education';

  @override
  String get categoryBusiness => 'Business';

  @override
  String get categoryHealth => 'Health';

  @override
  String get categoryScience => 'Science';

  @override
  String get categoryArts => 'Arts';

  @override
  String get trendingDramaSeries => 'Drama Series';

  @override
  String get trendingComedyShows => 'Comedy Shows';

  @override
  String get trendingPodcasts => 'Podcasts';

  @override
  String get trendingMusicAlbums => 'Music Albums';

  @override
  String get trendingKidsStories => 'Kids Stories';

  @override
  String get trendingDevotional => 'Devotional';

  @override
  String get trendingNewsToday => 'News Today';

  @override
  String get trendingSportsHighlights => 'Sports Highlights';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageHindi => 'Hindi';

  @override
  String get languagePunjabi => 'Punjabi';

  @override
  String get languageHaryanvi => 'Haryanvi';

  @override
  String get languageMarathi => 'Marathi';

  @override
  String get languageGujarati => 'Gujarati';

  @override
  String get languageBengali => 'Bengali';

  @override
  String get languageTamil => 'Tamil';

  @override
  String get languageTelugu => 'Telugu';

  @override
  String get languageKannada => 'Kannada';

  @override
  String get languageMalayalam => 'Malayalam';

  @override
  String get languageUrdu => 'Urdu';

  @override
  String get pressBackToExit => 'Press back again to exit';

  @override
  String get exitDialogTitle => 'Exit App?';

  @override
  String get exitDialogBody => 'Are you sure you want to exit?';

  @override
  String get exitDialogConfirm => 'Exit';

  @override
  String get exitDialogCancel => 'Cancel';

  @override
  String get profileShareApp => 'Share App';

  @override
  String get profileShareAppMessage =>
      'Check out WebroFM - your go-to app for streaming shows and podcasts!';
}
