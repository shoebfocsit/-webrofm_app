import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_picker/country_picker.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  Country _selectedCountry = Country.parse('IN');
  bool _termsAccepted = false;
  String _phoneError = '';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.circular(24),
        inputDecoration: InputDecoration(
          hintText: 'Search countries',
          filled: true,
          fillColor: context.surfaceWhite(opacity: 0.92),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: context.glassBorder(),
            ),
          ),
        ),
      ),
      onSelect: (country) => setState(() => _selectedCountry = country),
    );
  }

  void _onSendOtp() {
    final phone = _phoneController.text.replaceAll(RegExp(r'[^\d]'), '');
    if (phone.length < 10) {
      setState(() => _phoneError = 'Please enter a valid phone number');
      return;
    }
    setState(() => _phoneError = '');
    final fullPhone = '${_selectedCountry.phoneCode}$phone';
    ref.read(authProvider.notifier).sendOtp(fullPhone).then((_) {
      final st = ref.read(authProvider);
      if (!mounted) return;
      if (st.otpRateLimited) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Rate Limit Reached'),
            content: const Text('Too many OTP attempts. Please try again after 1 hour.'),
            actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK'))],
          ),
        );
      } else if (st.error == null) {
        if (st.remaining != null && st.remaining! <= 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Only ${st.remaining} attempt remaining this hour')),
          );
        }
        context.push('/otp-verification', extra: fullPhone);
      }
    });
  }

  String _formatPhone(String value) {
    final digits = value.replaceAll(RegExp(r'[^\d]'), '');
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i == 0) {
        buffer.write('(');
      } else if (i == 3) {
        buffer.write(') ');
      } else if (i == 6) {
        buffer.write('-');
      }
      if (i < 10) buffer.write(digits[i]);
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: Stack(
        children: [
          _PosterBackground(cs),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: GlassCard(
                    borderRadius: BorderRadius.vertical(
                      top: const Radius.circular(28),
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 48,
                              height: 4,
                              decoration: BoxDecoration(
                                color: cs.onSurface.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Login to Continue',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                              fontFamily: 'Outfit',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Enter your phone number to get started',
                            style: TextStyle(
                              fontSize: 14,
                              color: cs.onSurface.withValues(alpha: 0.6),
                              fontFamily: 'Outfit',
                            ),
                          ),
                          const SizedBox(height: 28),
                          GlassInput(
                            controller: _phoneController,
                            hint: '(555) 000-0000',
                            keyboardType: TextInputType.phone,
                            errorText:
                                _phoneError.isNotEmpty ? _phoneError : null,
                            prefixIcon: GestureDetector(
                              onTap: _onCountryPicker,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _selectedCountry.flagEmoji,
                                      style: const TextStyle(fontSize: 22),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '+${_selectedCountry.phoneCode}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: cs.onSurface,
                                        fontFamily: 'Outfit',
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 18,
                                      color: cs.onSurface
                                          .withValues(alpha: 0.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              final formatted = _formatPhone(value);
                              if (formatted != value) {
                                _phoneController.value = TextEditingValue(
                                  text: formatted,
                                  selection: TextSelection.collapsed(
                                    offset: formatted.length,
                                  ),
                                );
                              }
                              if (_phoneError.isNotEmpty) {
                                setState(() => _phoneError = '');
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  value: _termsAccepted,
                                  onChanged: (v) =>
                                      setState(() => _termsAccepted = v ?? false),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        cs.onSurface.withValues(alpha: 0.6),
                                    fontFamily: 'Outfit',
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: 'I agree to the ',
                                    ),
                                    TextSpan(
                                      text: 'Terms of Use',
                                      style: TextStyle(
                                        color: cs.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            context.push('/terms-of-use'),
                                    ),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: cs.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            context.push('/privacy-policy'),
                                    ),
                                  ],
                                ),
                              ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          GlassButton(
                            text: 'Send OTP',
                            backgroundColor: cs.primary,
                            foregroundColor: cs.onPrimary,
                            isLoading: authState.isLoading,
                            isDisabled: !_termsAccepted,
                            onPressed: _onSendOtp,
                          ),
                          const SizedBox(height: 20),
                          Builder(builder: (_) {
                            final box = GetStorage();
                            final timerEnd = box.read<int>('guest_timer_end');
                            final hasActiveGuestAccess = timerEnd != null &&
                                DateTime.now().millisecondsSinceEpoch < timerEnd;
                            final guestUsed = !hasActiveGuestAccess &&
                                (box.read('guest_used') == true ||
                                    (timerEnd != null && DateTime.now().millisecondsSinceEpoch >= timerEnd));
                            return Column(
                              children: [
                                Center(
                                  child: TextButton(
                                    onPressed: guestUsed
                                        ? null
                                        : () {
                                            final b = GetStorage();
                                            b.write('guest_used', true);
                                            if (b.read<int>('guest_timer_end') == null) {
                                              b.write('guest_timer_end', DateTime.now().millisecondsSinceEpoch + 135000);
                                            }
                                            context.go('/home', extra: {'guest_timer': true});
                                          },
                                    child: Text(
                                      'Continue as Guest',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: guestUsed
                                            ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.35)
                                            : Theme.of(context).colorScheme.primary,
                                        fontFamily: 'Outfit',
                                      ),
                                    ),
                                  ),
                                ),
                                if (guestUsed)
                                  Text(
                                    'You used the free usage of 24 hours',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                                      fontFamily: 'Outfit',
                                    ),
                                  ),
                              ],
                            );
                          }),
                          if (authState.error != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                authState.error!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: cs.error,
                                  fontSize: 13,
                                  fontFamily: 'Outfit',
                                ),
                              ),
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

class _PosterBackground extends StatelessWidget {
  final ColorScheme cs;
  const _PosterBackground(this.cs);

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
