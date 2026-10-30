import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';

class OtpVerificationScreen extends ConsumerStatefulWidget {
  final String? phone;
  const OtpVerificationScreen({super.key, this.phone});

  @override
  ConsumerState<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  final _pinController = TextEditingController();
  final _pinFocusNode = FocusNode();
  String _pinError = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).startOtpTimer();
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  void _onVerify() {
    final otp = _pinController.text.trim();
    if (otp.length < 6) {
      setState(() => _pinError = 'Please enter the complete 6-digit code');
      return;
    }
    setState(() => _pinError = '');
    ref.read(authProvider.notifier).verifyOtp(otp).then((_) {
      final state = ref.read(authProvider);
      if (state.error != null) {
        setState(() => _pinError = state.error!);
        return;
      }
      if (mounted) {
        if (state.user != null &&
            (state.user!.name.isNotEmpty && state.user!.categories.isNotEmpty ||
             GetStorage().read('profile_completed') == true)) {
          context.go('/home');
        } else {
          context.push('/complete-profile');
        }
      }
    });
  }

  void _onResend() {
    final phone = widget.phone ?? ref.read(authProvider).phone;
    if (phone != null) {
      ref.read(authProvider.notifier).sendOtp(phone);
      ref.read(authProvider.notifier).startOtpTimer();
    }
  }

  String _formatPhone(String? phone) {
    if (phone == null || phone.length < 10) return '';
    final digits = phone.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.length >= 10) {
      final last10 = digits.substring(digits.length - 10);
      return '(${last10.substring(0, 3)}) ${last10.substring(3, 6)}-${last10.substring(6)}';
    }
    return phone;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final authState = ref.watch(authProvider);
    final phone = widget.phone ?? authState.phone;

    final defaultPinTheme = PinTheme(
      width: 48,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: cs.onSurface,
        fontFamily: 'Outfit',
      ),
      decoration: BoxDecoration(
        color: context.surfaceWhite(),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.glassBorder()),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          _OtpPosterBackground(cs),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: cs.onSurface),
                        onPressed: () => context.pop(),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: GlassCard(
                    borderRadius: BorderRadius.vertical(
                      top: const Radius.circular(28),
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: 48,
                              height: 4,
                              decoration: BoxDecoration(
                                color:
                                    cs.onSurface.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Verify Your Number',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                              fontFamily: 'Outfit',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Enter the code sent to',
                            style: TextStyle(
                              fontSize: 14,
                              color: cs.onSurface.withValues(alpha: 0.6),
                              fontFamily: 'Outfit',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatPhone(phone),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: cs.onSurface,
                              fontFamily: 'Outfit',
                            ),
                          ),
                          const SizedBox(height: 32),
                          Pinput(
                            controller: _pinController,
                            focusNode: _pinFocusNode,
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                border: Border.all(color: cs.primary, width: 2),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                border:
                                    Border.all(color: cs.error, width: 1),
                              ),
                            ),
                            onChanged: (_) {
                              if (_pinError.isNotEmpty) {
                                setState(() => _pinError = '');
                              }
                            },
                            onCompleted: (_) => _onVerify(),
                          ),
                          if (_pinError.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                _pinError,
                                style: TextStyle(
                                  color: cs.error,
                                  fontSize: 13,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                            ),
                          const SizedBox(height: 24),
                          GlassButton(
                            text: 'Verify & Continue',
                            backgroundColor: cs.primary,
                            foregroundColor: cs.onPrimary,
                            isLoading: authState.isLoading,
                            onPressed: _onVerify,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Didn\'t receive the code? ',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: cs.onSurface.withValues(alpha: 0.6),
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              if (authState.otpTimerSeconds > 0)
                                Text(
                                  '${authState.otpTimerSeconds}s',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: cs.primary,
                                    fontFamily: 'Outfit',
                                  ),
                                )
                              else
                                GestureDetector(
                                  onTap: _onResend,
                                  child: Text(
                                    'Resend OTP',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: cs.primary,
                                      fontFamily: 'Outfit',
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpPosterBackground extends StatelessWidget {
  final ColorScheme cs;
  const _OtpPosterBackground(this.cs);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/welcomeimg.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
