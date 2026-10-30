import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/core/utils/profile_utils.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  final Set<String> _selectedCategories = {};

  static const _allCategories = [
    'Drama',
    'Comedy',
    'Podcasts',
    'Music',
    'Kids',
    'Devotional',
    'News',
    'Sports',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now.subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1950),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFFae3115),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _onContinue() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter your name'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }

    final homeCategories = ref.read(homeNotifierProvider).categories;
    final interestIds = categoryNamesToIds(_selectedCategories.toList(), homeCategories);

    final user = User(
      id: '',
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: ref.read(authProvider).phone ?? '',
      dateOfBirth: _selectedDate,
      categories: interestIds.map((e) => e.toString()).toList(),
      createdAt: DateTime.now(),
    );

    ref.read(authProvider.notifier).updateProfile(user).then((_) {
      final state = ref.read(authProvider);
      if (state.error == null && mounted) {
        context.go('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: GradientMeshBackground(
        animate: true,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: cs.onSurface),
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 120),
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tell us about yourself',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: cs.onSurface,
                            fontFamily: 'Outfit',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Help us personalize your experience',
                          style: TextStyle(
                            fontSize: 14,
                            color: cs.onSurface.withValues(alpha: 0.6),
                            fontFamily: 'Outfit',
                          ),
                        ),
                        const SizedBox(height: 28),
                        GlassCard(
                          borderRadius: BorderRadius.circular(20),
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Personal Information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: cs.onSurface,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              const SizedBox(height: 20),
                              GlassInput(
                                controller: _nameController,
                                label: 'Full Name',
                                hint: 'John Doe',
                                textCapitalization: TextCapitalization.words,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: 20,
                                  color: cs.onSurface.withValues(alpha: 0.5),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GlassInput(
                                controller: _emailController,
                                label: 'Email Address',
                                hint: 'john@example.com',
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  size: 20,
                                  color: cs.onSurface.withValues(alpha: 0.5),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GlassInput(
                                label: 'Date of Birth',
                                hint: _selectedDate != null
                                    ? DateFormat('MMM dd, yyyy')
                                        .format(_selectedDate!)
                                    : 'Select your date of birth',
                                readOnly: true,
                                prefixIcon: Icon(
                                  Icons.calendar_today_outlined,
                                  size: 20,
                                  color: cs.onSurface.withValues(alpha: 0.5),
                                ),
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20,
                                  color: cs.onSurface.withValues(alpha: 0.5),
                                ),
                                onTap: _pickDate,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        GlassCard(
                          borderRadius: BorderRadius.circular(20),
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Choose Your Interests',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: cs.onSurface,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Select categories you enjoy',
                                style: TextStyle(
                                  fontSize: 13,
                                  color:
                                      cs.onSurface.withValues(alpha: 0.5),
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: _allCategories.map((cat) {
                                  final selected =
                                      _selectedCategories.contains(cat);
                                  return FilterChip(
                                    label: Text(
                                      cat,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: selected
                                            ? FontWeight.w600
                                            : FontWeight.w500,
                                        color: selected
                                            ? cs.primary
                                            : cs.onSurface,
                                        fontFamily: 'Outfit',
                                      ),
                                    ),
                                    selected: selected,
                                    onSelected: (v) {
                                      setState(() {
                                        if (v) {
                                          _selectedCategories.add(cat);
                                        } else {
                                          _selectedCategories.remove(cat);
                                        }
                                      });
                                    },
                                    selectedColor:
                                        cs.primary.withValues(alpha: 0.15),
                                    backgroundColor:
                                        context.surfaceWhite(),
                                    checkmarkColor: cs.primary,
                                    showCheckmark: true,
                                    side: BorderSide(
                                      color: selected
                                          ? cs.primary.withValues(alpha: 0.4)
                                          : context.glassBorder(),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: GlassButton(
          text: 'Continue to WebroFM',
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          isLoading: authState.isLoading,
          onPressed: _onContinue,
        ),
      ),
    );
  }
}
