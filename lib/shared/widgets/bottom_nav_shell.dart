import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/services/audio_player_service.dart';
import 'package:webrofm/core/services/player_provider.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';
import 'package:webrofm/l10n/app_localizations.dart';
import 'package:webrofm/shared/widgets/guest_timer.dart';
import 'package:webrofm/shared/widgets/mini_player_widget.dart';

class BottomNavShell extends ConsumerStatefulWidget {
  final Widget child;

  const BottomNavShell({super.key, required this.child});

  @override
  ConsumerState<BottomNavShell> createState() => _BottomNavShellState();
}

class _BottomNavShellState extends ConsumerState<BottomNavShell> {
  int _currentIndex = 0;
  final List<int> _tabHistory = [];
  DateTime? _lastBackPressed;
  static const List<String> _tabPaths = ['/home', '/search', '/categories', '/my-list', '/profile'];

  Timer? _freeTimer;
  int _freeRemaining = 60;
  bool _freePopupShown = false;
  bool _guestTimerActive = false;
  final _guestTimerKey = GlobalKey();

  static const double _navHeight = 64.0;
  static const double _navBottomMargin = 12.0;

  static const _navIcons = [
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.explore_outlined,
    Icons.bookmark_outline,
    Icons.person_outline,
  ];

  static const _navActiveIcons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.explore_rounded,
    Icons.bookmark_rounded,
    Icons.person_rounded,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _freeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final navMarginBottom = bottomPadding > 0 ? bottomPadding : _navBottomMargin;
    final navTotalHeight = _navHeight + navMarginBottom;
    final nowPlaying = ref.watch(nowPlayingProvider);
    final hasPlayer = nowPlaying.episode != null && !nowPlaying.isMiniPlayerDismissed;
    final authState = ref.watch(authProvider);
    final isLoggedIn = authState.isLoggedIn;
    final l10n = AppLocalizations.of(context)!;

    final navLabels = [
      l10n.bottomNavHome,
      l10n.bottomNavSearch,
      l10n.bottomNavCategories,
      l10n.bottomNavMyList,
      l10n.bottomNavProfile,
    ];

    // Manage free listening timer
    if (hasPlayer && !isLoggedIn && _freeTimer == null && !_freePopupShown) {
      _freeRemaining = 60;
      _freeTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) return;
        setState(() {
          _freeRemaining--;
          if (_freeRemaining <= 0) {
            _freeTimer?.cancel();
            _freeTimer = null;
            _onFreeLimitReached();
          }
        });
      });
    } else if (!hasPlayer || isLoggedIn) {
      _freeTimer?.cancel();
      _freeTimer = null;
      if (isLoggedIn) _freePopupShown = false;
    }

    final extra = GoRouterState.of(context).extra;
    final showGuestTimer = extra is Map && extra['guest_timer'] == true && !authState.isLoggedIn;

    if (showGuestTimer && !_guestTimerActive) {
      _guestTimerActive = true;
    }

    final currentPath = GoRouter.of(context).routerDelegate.currentConfiguration.uri.path;
    final currentTabIndex = _tabPaths.indexOf(currentPath);

    Widget buildScaffold() => PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (currentTabIndex > 0) {
          _goBackTab();
        } else {
          _handleExitPress();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: widget.child,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MiniPlayerWidget(),
            GlassBottomNav(
              currentIndex: _currentIndex,
              height: _navHeight,
              margin: EdgeInsets.fromLTRB(16, 0, 16, navMarginBottom),
              onTap: (index) {
                if (index == _currentIndex) return;
                _tabHistory.add(_currentIndex);
                setState(() => _currentIndex = index);
                _onItemTapped(index);
              },
              items: List.generate(5, (i) {
                return GlassBottomNavItem(
                  icon: _navIcons[i],
                  activeIcon: _navActiveIcons[i],
                  label: navLabels[i],
                );
              }),
            ),
          ],
        ),
      ),
    );

    if (_guestTimerActive && !authState.isLoggedIn) {
      final timerEnd = GetStorage().read<int>('guest_timer_end');
      final remaining = timerEnd != null
          ? ((timerEnd - DateTime.now().millisecondsSinceEpoch) / 1000).ceil().clamp(1, 9999)
          : 135;
      return GuestTimerWidget(
        key: _guestTimerKey,
        initialRemaining: remaining,
        onTimeUp: () {
          _guestTimerActive = false;
          _showFreeTimeOverDialog();
        },
        child: buildScaffold(),
      );
    }

    return buildScaffold();
  }

  void _handleExitPress() {
    if (!mounted) return;
    final now = DateTime.now();
    if (_lastBackPressed != null &&
        now.difference(_lastBackPressed!) < const Duration(seconds: 2)) {
      _lastBackPressed = null;
      SystemNavigator.pop();
      return;
    }
    _lastBackPressed = now;
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(l10n.pressBackToExit),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void _showFreeTimeOverDialog() {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    ref.read(audioPlayerServiceProvider).stop();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        Future.delayed(const Duration(seconds: 4), () {
          if (ctx.mounted) {
            Navigator.of(ctx).pop();
            if (mounted) context.go('/welcome');
          }
        });
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.access_time_filled, size: 56, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 16),
                Text(
                  l10n.guestTimerTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Outfit',
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.guestTimerBody,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onFreeLimitReached() {
    _freePopupShown = true;
    final l10n = AppLocalizations.of(context)!;
    final service = ref.read(audioPlayerServiceProvider);
    service.pause();
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(l10n.freeLimitTitle),
          content: Text(l10n.freeLimitBody),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text(l10n.guestTimerLater),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                context.push('/login');
              },
              child: Text(l10n.guestTimerLogin),
            ),
          ],
        ),
      );
    }
  }



  void _onItemTapped(int index) {
    context.go(_tabPaths[index]);
  }

  void _goBackTab() {
    if (!mounted) return;
    final index = _tabHistory.isNotEmpty ? _tabHistory.removeLast() : 0;
    setState(() => _currentIndex = index);
    context.go(_tabPaths[index]);
  }
}
