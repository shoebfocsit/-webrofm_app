import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/features/auth/presentation/screens/login_screen.dart';
import 'package:webrofm/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:webrofm/features/auth/presentation/screens/registration_screen.dart';
import 'package:webrofm/features/auth/presentation/screens/splash_screen.dart';
import 'package:webrofm/features/auth/presentation/screens/welcome_screen.dart';
import 'package:webrofm/features/auth/presentation/screens/complete_profile_screen.dart';
import 'package:webrofm/features/auth/presentation/screens/interest_selection_screen.dart';
import 'package:webrofm/features/categories/presentation/screens/categories_screen.dart';
import 'package:webrofm/features/categories/presentation/screens/category_detail_screen.dart';
import 'package:webrofm/features/downloads/presentation/screens/downloads_screen.dart';
import 'package:webrofm/features/home/presentation/screens/home_screen.dart';
import 'package:webrofm/features/my_list/presentation/screens/my_list_screen.dart';
import 'package:webrofm/features/premium/presentation/screens/premium_screen.dart';
import 'package:webrofm/features/settings/presentation/screens/account_deleted_screen.dart';
import 'package:webrofm/features/settings/presentation/screens/delete_account_otp_screen.dart';
import 'package:webrofm/features/settings/presentation/screens/delete_account_screen.dart';
import 'package:webrofm/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:webrofm/features/profile/presentation/screens/profile_screen.dart';
import 'package:webrofm/features/search/presentation/screens/search_screen.dart';
import 'package:webrofm/features/settings/presentation/screens/contact_us_screen.dart';
import 'package:webrofm/features/settings/presentation/screens/help_faq_screen.dart';
import 'package:webrofm/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:webrofm/features/settings/presentation/screens/settings_screen.dart';
import 'package:webrofm/features/settings/presentation/screens/terms_of_use_screen.dart';
import 'package:webrofm/features/home/presentation/screens/show_detail_screen.dart';
import 'package:webrofm/features/home/presentation/screens/video_player_screen.dart';
import 'package:webrofm/features/show_detail/presentation/screens/new_arrivals_screen.dart';
import 'package:webrofm/features/show_detail/presentation/screens/trending_screen.dart';
import 'package:webrofm/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:webrofm/features/collab/presentation/screens/collaboration_screen.dart';
import 'package:webrofm/features/languages/presentation/screens/languages_screen.dart';

import 'package:webrofm/shared/widgets/bottom_nav_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/otp-verification',
        name: 'otpVerification',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final phone = state.extra as String?;
          return OtpVerificationScreen(phone: phone);
        },
      ),
      GoRoute(
        path: '/registration',
        name: 'registration',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const RegistrationScreen(),
      ),
      GoRoute(
        path: '/complete-profile',
        name: 'completeProfile',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CompleteProfileScreen(),
      ),
      GoRoute(
        path: '/interests',
        name: 'interests',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const InterestSelectionScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => BottomNavShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/search',
            name: 'search',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const SearchScreen(),
            ),
          ),
          GoRoute(
            path: '/categories',
            name: 'categories',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const CategoriesScreen(),
            ),
          ),
          GoRoute(
            path: '/my-list',
            name: 'myList',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const MyListScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/show/:id',
        name: 'showDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ShowDetailScreen(showId: id);
        },
      ),
      GoRoute(
        path: '/video-player/:id',
        name: 'videoPlayer',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final extra = state.extra;
          return VideoPlayerScreen(
            showId: id,
            episodeData: extra,
          );
        },
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/edit-profile',
        name: 'editProfile',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: '/privacy-policy',
        name: 'privacyPolicy',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: '/terms-of-use',
        name: 'termsOfUse',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const TermsOfUseScreen(),
      ),
      GoRoute(
        path: '/help-faq',
        name: 'helpFaq',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const HelpFaqScreen(),
      ),
      GoRoute(
        path: '/contact-us',
        name: 'contactUs',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: '/delete-account',
        name: 'deleteAccount',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const DeleteAccountScreen(),
      ),
      GoRoute(
        path: '/delete-account-otp',
        name: 'deleteAccountOtp',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const DeleteAccountOtpScreen(),
      ),
      GoRoute(
        path: '/account-deleted',
        name: 'accountDeleted',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AccountDeletedScreen(),
      ),
      GoRoute(
        path: '/premium',
        name: 'premium',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PremiumScreen(),
      ),
      GoRoute(
        path: '/downloads',
        name: 'downloads',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const DownloadsScreen(),
      ),
      GoRoute(
        path: '/trending',
        name: 'trending',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const TrendingScreen(),
      ),
      GoRoute(
        path: '/new-arrivals',
        name: 'newArrivals',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const NewArrivalsScreen(),
      ),
      GoRoute(
        path: '/category/:category',
        name: 'categoryDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final category = state.pathParameters['category']!;
          return CategoryDetailScreen(category: category);
        },
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/languages',
        name: 'languages',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => LanguagesScreen(type: state.extra as String?),
      ),
      GoRoute(
        path: '/collaboration',
        name: 'collaboration',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CollaborationScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text(
              'Page Not Found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you\'re looking for doesn\'t exist.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}


