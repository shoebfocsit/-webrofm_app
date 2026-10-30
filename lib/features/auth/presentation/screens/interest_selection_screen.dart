import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';

class InterestSelectionScreen extends ConsumerStatefulWidget {
  const InterestSelectionScreen({super.key});

  @override
  ConsumerState<InterestSelectionScreen> createState() => _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends ConsumerState<InterestSelectionScreen> {
  final Set<String> _selectedCategoryIds = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(homeNotifierProvider).categories.isEmpty) {
        ref.read(homeNotifierProvider.notifier).fetchCategories();
      }
    });
  }

  void _onContinue() {
    final extra = GoRouterState.of(context).extra;
    Map<String, dynamic>? profileData;
    if (extra is Map<String, dynamic>) {
      profileData = extra;
    }

    final authState = ref.read(authProvider);
    final profilePicPath = profileData?['profilePicture'] as String?;
    final profilePic = profilePicPath != null ? File(profilePicPath) : null;

    // Convert selected category IDs (strings) to int IDs for the User model
    final interestIds = _selectedCategoryIds
        .map((id) => int.tryParse(id) ?? 0)
        .where((id) => id != 0)
        .toList();

    final user = User(
      id: authState.user?.id ?? '',
      name: profileData?['name'] as String? ?? authState.user?.name ?? '',
      email: profileData?['email'] as String? ?? authState.user?.email ?? '',
      phone: authState.phone ?? authState.user?.phone ?? '',
      avatar: authState.user?.avatar,
      gender: profileData?['gender'] as String? ?? authState.user?.gender,
      dateOfBirth: profileData?['dateOfBirth'] as DateTime? ?? authState.user?.dateOfBirth,
      categories: interestIds.map((e) => e.toString()).toList(),
      createdAt: authState.user?.createdAt ?? DateTime.now(),
    );

    ref.read(authProvider.notifier).updateProfile(user, profilePicture: profilePic).then((_) {
      if (mounted) {
        context.go('/home');
      }
    });
  }

  void _onSkip() {
    _onContinue();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final authState = ref.watch(authProvider);
    final apiCategories = ref.watch(homeNotifierProvider).categories;

    const fallbackCategories = [
      ShowCategory(id: '1', name: 'Drama'),
      ShowCategory(id: '2', name: 'Comedy'),
      ShowCategory(id: '3', name: 'Romance'),
      ShowCategory(id: '4', name: 'Thriller'),
      ShowCategory(id: '5', name: 'Action'),
      ShowCategory(id: '6', name: 'Horror'),
      ShowCategory(id: '7', name: 'Sci-Fi'),
      ShowCategory(id: '8', name: 'Documentary'),
    ];
    final availableCategories = apiCategories.isNotEmpty ? apiCategories : fallbackCategories;

    return Scaffold(
      body: GradientMeshBackground(
        animate: true,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 8, right: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: cs.onSurface),
                      onPressed: () => context.pop(),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _onSkip,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: cs.primary,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 120),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pick Your Interests',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: cs.onSurface,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Select categories you enjoy to get personalised recommendations',
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
                              'Tap to select',
                              style: TextStyle(
                                fontSize: 13,
                                color: cs.onSurface.withValues(alpha: 0.5),
                                fontFamily: 'Outfit',
                              ),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: availableCategories.map((cat) {
                                final selected = _selectedCategoryIds.contains(cat.id);
                                return FilterChip(
                                  label: Text(
                                    cat.name,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                                      color: selected ? cs.primary : cs.onSurface,
                                      fontFamily: 'Outfit',
                                    ),
                                  ),
                                  selected: selected,
                                  onSelected: (v) {
                                    setState(() {
                                      if (v) {
                                        _selectedCategoryIds.add(cat.id);
                                      } else {
                                        _selectedCategoryIds.remove(cat.id);
                                      }
                                    });
                                  },
                                  selectedColor: cs.primary.withValues(alpha: 0.15),
                                  backgroundColor: context.surfaceWhite(),
                                  checkmarkColor: cs.primary,
                                  showCheckmark: true,
                                  side: BorderSide(
                                    color: selected
                                        ? cs.primary.withValues(alpha: 0.4)
                                        : context.glassBorder(),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
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
