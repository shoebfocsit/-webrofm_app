import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';

class DeleteAccountOtpScreen extends ConsumerStatefulWidget {
  const DeleteAccountOtpScreen({super.key});

  @override
  ConsumerState<DeleteAccountOtpScreen> createState() => _DeleteAccountOtpScreenState();
}

class _DeleteAccountOtpScreenState extends ConsumerState<DeleteAccountOtpScreen> {
  final _otpController = TextEditingController();
  bool _isSubmitting = false;
  String? _otpError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).startOtpTimer();
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  String _formatPhone(String? phone) {
    if (phone == null || phone.isEmpty) return 'your registered number';
    final digits = phone.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.length >= 10) {
      final country = digits.length > 10 ? '+${digits.substring(0, digits.length - 10)} ' : '';
      final last10 = digits.substring(digits.length - 10);
      return '$country******${last10.substring(6)}';
    }
    return phone;
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final authState = ref.watch(authProvider);
    final phone = authState.user?.phone ?? authState.phone;

    return Scaffold(
      body: GradientMeshBackground(
        animate: false,
        colors: [
          cs.error.withValues(alpha: 0.12),
          cs.surface,
          cs.primary.withValues(alpha: 0.08),
          cs.surface,
        ],
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context, cs),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      _buildWarningIcon(cs),
                      const SizedBox(height: 24),
                      _buildTitle(context, cs, phone),
                      const SizedBox(height: 32),
                      _buildOtpInput(context, cs),
                      if (_otpError != null && _otpError!.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Text(
                          _otpError!,
                          style: TextStyle(color: cs.error, fontSize: 13),
                        ),
                      ],
                      const SizedBox(height: 32),
                      _buildConfirmButton(context, cs, authState),
                      const SizedBox(height: 16),
                      _buildResend(context, cs, authState, phone),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningIcon(ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.error.withValues(alpha: 0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.warning_amber_rounded, size: 48, color: cs.error),
    );
  }

  Widget _buildTitle(BuildContext context, ColorScheme cs, String? phone) {
    return Column(
      children: [
        Text(
          'Verify Deletion',
          style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter the OTP sent to ${_formatPhone(phone)}',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(color: cs.onSurface.withValues(alpha: 0.6)),
        ),
      ],
    );
  }

  Widget _buildOtpInput(BuildContext context, ColorScheme cs) {
    final defaultPinTheme = PinTheme(
      width: 52,
      height: 58,
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

    return Pinput(
      controller: _otpController,
      length: 6,
      autofocus: true,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: cs.primary, width: 2),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: cs.error, width: 2),
        ),
      ),
      onChanged: (_) {
        if (_otpError != null) {
          setState(() => _otpError = null);
        }
      },
    );
  }

  Widget _buildConfirmButton(BuildContext context, ColorScheme cs, AuthState authState) {
    final isLoading = _isSubmitting || authState.isLoading;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isLoading || _otpController.text.length != 6
            ? null
            : () => _confirmDeletion(),
        icon: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            : const Icon(Icons.delete_outline),
        label: Text(isLoading ? 'Verifying...' : 'Confirm Deletion'),
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.error,
          foregroundColor: cs.onError,
          disabledBackgroundColor: cs.error.withValues(alpha: 0.4),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildResend(BuildContext context, ColorScheme cs, AuthState authState, String? phone) {
    if (authState.otpTimerSeconds > 0) {
      return Text(
        'Resend OTP in ${authState.otpTimerSeconds}s',
        style: TextStyle(color: cs.onSurface.withValues(alpha: 0.6), fontSize: 13),
      );
    }
    return TextButton(
      onPressed: () {
        if (phone != null && phone.isNotEmpty) {
          ref.read(authProvider.notifier).sendOtp(phone);
          ref.read(authProvider.notifier).startOtpTimer();
          context.showSnackBar('OTP resent successfully');
        }
      },
      child: Text(
        'Resend OTP',
        style: TextStyle(color: cs.primary),
      ),
    );
  }

  Future<void> _confirmDeletion() async {
    final otp = _otpController.text.trim();
    if (otp.length != 6) return;

    setState(() {
      _isSubmitting = true;
      _otpError = null;
    });

    await ref.read(authProvider.notifier).verifyOtp(otp);

    if (!mounted) return;

    final state = ref.read(authProvider);
    setState(() => _isSubmitting = false);

    if (state.error != null) {
      setState(() => _otpError = state.error);
      context.showSnackBar(state.error!, isError: true);
    } else {
      await ref.read(authProvider.notifier).logout();
      if (mounted) {
        context.pushReplacement('/account-deleted');
      }
    }
  }
}

