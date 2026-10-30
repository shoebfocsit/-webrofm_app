import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  VideoPlayerController? _videoController;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;
  bool _videoReady = false;
  bool _isLoggedIn = false;
  Timer? _splashTimer;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _init();
  }

  Future<void> _init() async {
    _fadeController.forward();
    try {
      await Future.wait([
        _checkAuth(),
        _initVideo(),
      ]).timeout(const Duration(seconds: 8));
    } catch (_) {
      // Navigation must never be blocked, whatever happens at startup.
    }
    if (!mounted) return;
    _splashTimer = Timer(const Duration(seconds: 6), _navigateAfterSplash);
  }

  Future<void> _checkAuth() async {
    try {
      final localSource = ref.read(authLocalSourceProvider);
      final isLoggedInLocal = localSource.isLoggedIn();
      final token = await localSource
          .getToken()
          .timeout(const Duration(seconds: 3), onTimeout: () => null);
      if (!mounted) return;
      if (token != null && token.isNotEmpty && isLoggedInLocal) {
        _isLoggedIn = true;
        // Sync fresh profile in background without blocking startup navigation on slow network
        unawaited(ref.read(authProvider.notifier).restoreSession());
      } else {
        _isLoggedIn = false;
      }
    } catch (_) {
      // A storage read failure must never block navigation to the welcome screen.
    }
  }

  Future<void> _initVideo() async {
    try {
      final ctrl = VideoPlayerController.asset('assets/video/splashvideo.mp4');
      _videoController = ctrl;
      await ctrl.initialize().timeout(const Duration(seconds: 5));
      if (!mounted) return;
      setState(() => _videoReady = true);
      _fadeController.forward(from: 0);
      ctrl.setVolume(1);
      ctrl.addListener(_onVideoUpdate);
      ctrl.play();
    } catch (_) {
      if (mounted) setState(() => _videoReady = true);
    }
  }

  void _onVideoUpdate() {
    if (_videoController?.value.isCompleted == true && mounted) {
      _navigateAfterSplash();
    }
  }

  void _navigateAfterSplash() {
    if (!mounted) return;
    _splashTimer?.cancel();
    _splashTimer = null;
    _videoController?.removeListener(_onVideoUpdate);
    if (_isLoggedIn) {
      context.go('/home');
    } else {
      context.go('/welcome');
    }
  }

  @override
  void dispose() {
    _splashTimer?.cancel();
    _videoController?.removeListener(_onVideoUpdate);
    _videoController?.pause();
    _videoController?.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (_videoReady && _videoController?.value.isInitialized == true)
            FadeTransition(
              opacity: _fadeAnim,
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoController!.value.size.width,
                    height: _videoController!.value.size.height,
                    child: VideoPlayer(_videoController!),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
