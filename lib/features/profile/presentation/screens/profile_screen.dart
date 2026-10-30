import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/core/utils/profile_utils.dart';
import 'package:webrofm/core/utils/share_utils.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/features/profile/presentation/providers/profile_provider.dart';
import 'package:webrofm/l10n/app_localizations.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(profileProvider.notifier).fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final authState = ref.watch(authProvider);
    final profileState = ref.watch(profileProvider);
    final isLoggedIn = authState.isLoggedIn;
    final user = profileState.user ?? authState.user;

    return Scaffold(
      body: GradientMeshBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context, cs),
              Expanded(
                child: isLoggedIn && user != null
                    ? _buildProfileContent(context, cs, ref, user)
                    : _buildLoginPrompt(context, cs, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Text(
        AppLocalizations.of(context)!.profileTitle,
        style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, ColorScheme cs, WidgetRef ref, User user) {
    final homeState = ref.watch(homeNotifierProvider);
    final interestNames = categoryIdsToNames(user.categories, homeState.categories);
    final apiCategories = homeState.categories.map((c) => c.name).toList();
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        children: [
          GlassCard(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: cs.primary.withValues(alpha: 0.12),
                      backgroundImage: avatarImageProvider(user.avatar, gender: user.gender, seed: user.id),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  user.name.isNotEmpty ? user.name : l10n.profileUser,
                  style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_outlined, size: 13, color: cs.onSurface.withValues(alpha: 0.4)),
                    const SizedBox(width: 4),
                    Text(
                      user.phone.isNotEmpty ? user.phone : l10n.profileNoPhone,
                      style: context.textTheme.bodySmall?.copyWith(color: cs.onSurface.withValues(alpha: 0.4)),
                    ),
                  ],
                ),
                if (user.email.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    user.email,
                    style: context.textTheme.bodySmall?.copyWith(color: cs.onSurface.withValues(alpha: 0.4)),
                  ),
                ],
                if (user.gender != null && user.gender!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    user.gender!.titleCase,
                    style: context.textTheme.bodySmall?.copyWith(color: cs.onSurface.withValues(alpha: 0.4)),
                  ),
                ],
                if (user.dateOfBirth != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    '${l10n.profileDobLabel}: ${user.dateOfBirth!.day}/${user.dateOfBirth!.month}/${user.dateOfBirth!.year}',
                    style: context.textTheme.bodySmall?.copyWith(color: cs.onSurface.withValues(alpha: 0.4)),
                  ),
                ],
                const SizedBox(height: 16),
                GlassButton(
                  text: l10n.profileEditProfile,
                  icon: Icons.edit_outlined,
                  onPressed: () => context.push('/edit-profile'),
                  height: 52,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          GlassCard(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.interests_outlined, size: 20, color: cs.primary),
                    const SizedBox(width: 8),
                    Text(
                      l10n.profileYourInterests,
                      style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (interestNames.isEmpty)
                  Text(
                    l10n.profileNoCategories,
                    style: context.textTheme.bodySmall?.copyWith(color: cs.onSurface.withValues(alpha: 0.4)),
                  )
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: interestNames.map((cat) {
                      final isFromApi = apiCategories.contains(cat);
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: isFromApi
                              ? cs.primary.withValues(alpha: 0.1)
                              : cs.onSurface.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isFromApi
                                ? cs.primary.withValues(alpha: 0.25)
                                : cs.onSurface.withValues(alpha: 0.12),
                          ),
                        ),
                        child: Text(
                          cat,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isFromApi ? cs.primary : cs.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildSettingsList(context, cs, ref),
        ],
      ),
    );
  }

  Widget _buildLoginPrompt(BuildContext context, ColorScheme cs, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GlassCard(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cs.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person_outline, size: 48, color: cs.primary),
              ),
              const SizedBox(height: 20),
              Text(
                l10n.profileNotLoggedIn,
                style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.profileNotLoggedInSubtitle,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(color: cs.onSurface.withValues(alpha: 0.6)),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.push('/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: cs.primary,
                  foregroundColor: cs.onPrimary,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(l10n.profileLogin),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context, ColorScheme cs, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        _buildSettingsRow(context, cs, Icons.handshake_outlined, l10n.profileCollaboration, () => context.push('/collaboration')),
        _buildSettingsRow(context, cs, Icons.settings_outlined, l10n.profileSettings, () => context.push('/settings')),
        _buildSettingsRow(context, cs, Icons.description_outlined, l10n.profileTermsOfUse, () => context.push('/terms-of-use')),
        _buildSettingsRow(context, cs, Icons.shield_outlined, l10n.profilePrivacyPolicy, () => context.push('/privacy-policy')),
        _buildSettingsRow(context, cs, Icons.help_outline, l10n.profileHelpFaq, () => context.push('/help-faq')),
        _buildSettingsRow(context, cs, Icons.mail_outline, l10n.profileContactUs, () => context.push('/contact-us')),
        _buildSettingsRow(context, cs, Icons.share_outlined, l10n.profileShareApp, _shareApp),
        const SizedBox(height: 8),
        _buildLogoutRow(context, cs, ref),
        const SizedBox(height: 24),
      ],
    );
  }

  void _shareApp() {
    ShareUtils.shareApp();
  }

  Widget _buildSettingsRow(BuildContext context, ColorScheme cs, IconData icon, String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
              Icon(icon, size: 22, color: cs.onSurface.withValues(alpha: 0.7)),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              Icon(Icons.chevron_right, size: 22, color: cs.onSurface.withValues(alpha: 0.3)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutRow(BuildContext context, ColorScheme cs, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        backgroundColor: cs.error.withValues(alpha: 0.1),
        borderOpacity: 0.2,
        child: InkWell(
          onTap: () => _showLogoutDialog(context, ref),
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
              Icon(Icons.logout, size: 22, color: cs.error),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  l10n.profileLogout,
                  style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, color: cs.error),
                ),
              ),
              Icon(Icons.chevron_right, size: 22, color: cs.error.withValues(alpha: 0.5)),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(l10n.profileLogoutTitle),
        content: Text(l10n.profileLogoutConfirm),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(l10n.profileCancel)),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ref.read(authProvider.notifier).logout();
              context.go('/welcome');
            },
            child: Text(l10n.profileLogout),
          ),
        ],
      ),
    );
  }
}
