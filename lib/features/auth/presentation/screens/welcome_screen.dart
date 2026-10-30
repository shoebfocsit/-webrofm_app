import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final mq = MediaQuery.of(context);
    final logoSize = mq.size.width * 0.22;
    final isSmall = mq.size.height < 640;
    final box = GetStorage();
    final guestTimerEnd = box.read<int>('guest_timer_end');
    final hasActiveGuestAccess = guestTimerEnd != null &&
        DateTime.now().millisecondsSinceEpoch < guestTimerEnd;
    final guestUsed = !hasActiveGuestAccess &&
        (box.read('guest_used') == true ||
            (guestTimerEnd != null && DateTime.now().millisecondsSinceEpoch >= guestTimerEnd));

    return Scaffold(
      body: GradientMeshBackground(
        animate: true,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: (mq.size.width * 0.06).clamp(20, 40)),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: isSmall ? 8 : mq.size.height * 0.04),
                    Image.asset(
                      context.appLogoPath,
                      width: logoSize,
                      height: logoSize,
                    ),
                    SizedBox(height: mq.size.height * 0.025),
                    Text(
                      'Welcome to WebroFM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: mq.size.width * 0.065,
                        fontWeight: FontWeight.bold,
                        color: cs.onSurface,
                        fontFamily: 'Outfit',
                      ),
                    ),
                    SizedBox(height: mq.size.height * 0.015),
                    Text(
                      'Discover stories that move you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: mq.size.width * 0.038,
                        color: cs.onSurface.withValues(alpha: 0.7),
                        fontFamily: 'Outfit',
                      ),
                    ),
                    SizedBox(height: mq.size.height * 0.04),
                    GlassButton(
                      text: 'Get Started',
                      backgroundColor: cs.primary,
                      foregroundColor: cs.onPrimary,
                      onPressed: () => context.go('/login'),
                    ),
                    SizedBox(height: mq.size.height * 0.02),
                    TextButton(
                      onPressed: guestUsed
                          ? null
                          : () {
                              final box = GetStorage();
                              box.write('guest_used', true);
                              if (box.read<int>('guest_timer_end') == null) {
                                final end = DateTime.now().millisecondsSinceEpoch + 135000;
                                box.write('guest_timer_end', end);
                              }
                              context.go('/home', extra: {'guest_timer': true});
                            },
                      child: Text(
                        'Continue as Guest',
                        style: TextStyle(
                          fontSize: mq.size.width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: guestUsed
                              ? cs.onSurface.withValues(alpha: 0.35)
                              : cs.primary,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                    if (guestUsed)
                      Padding(
                        padding: EdgeInsets.only(top: mq.size.height * 0.01),
                        child: Text(
                          'You used the free usage of 24 hours',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: mq.size.width * 0.032,
                            color: cs.onSurface.withValues(alpha: 0.5),
                            fontFamily: 'Outfit',
                          ),
                        ),
                      ),
                    SizedBox(height: isSmall ? 8 : mq.size.height * 0.04),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
