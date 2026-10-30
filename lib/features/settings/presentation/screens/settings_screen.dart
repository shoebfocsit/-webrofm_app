import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/services/language_provider.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/settings/presentation/providers/theme_provider.dart';
import 'package:webrofm/l10n/app_localizations.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _autoplay = true;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final themeMode = ref.watch(themeProvider);
    final l10n = AppLocalizations.of(context)!;
    final langCode = ref.watch(languageProvider).languageCode;

    return Scaffold(
      body: GradientMeshBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context, cs),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildSectionHeader(context, cs, l10n.settingsGeneral),
                    _buildLanguageRow(context, cs, l10n.settingsAppLanguage, _languageDisplayName(l10n, langCode), () => context.push('/languages', extra: 'app')),
                    const SizedBox(height: 20),
                    _buildSectionHeader(context, cs, l10n.settingsAppearancePlayback),
                    _buildThemeRow(context, cs, themeMode),
                    _buildToggleRow(context, cs, l10n.settingsAutoplayNext, _autoplay, (v) => setState(() => _autoplay = v)),
                    const SizedBox(height: 20),
                    _buildSectionHeader(context, cs, l10n.settingsAccountPrivacy),
                    _buildToggleRow(context, cs, l10n.settingsNotifications, _notifications, (v) => setState(() => _notifications = v)),
                    const SizedBox(height: 20),
                    _buildDangerZone(context, cs),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _languageDisplayName(AppLocalizations l10n, String code) {
    switch (code) {
      case 'hi':
        return l10n.languageHindi;
      case 'pa':
        return l10n.languagePunjabi;
      case 'mr':
        return l10n.languageMarathi;
      case 'gu':
        return l10n.languageGujarati;
      case 'bn':
        return l10n.languageBengali;
      case 'ta':
        return l10n.languageTamil;
      case 'te':
        return l10n.languageTelugu;
      case 'kn':
        return l10n.languageKannada;
      case 'ml':
        return l10n.languageMalayalam;
      case 'ur':
        return l10n.languageUrdu;
      default:
        return l10n.languageEnglish;
    }
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
          const SizedBox(width: 8),
          Text(
            AppLocalizations.of(context)!.settingsTitle,
            style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, ColorScheme cs, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 4),
      child: Text(
        title,
        style: context.textTheme.titleSmall?.copyWith(
          color: cs.primary,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildLanguageRow(BuildContext context, ColorScheme cs, String label, String value, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
              Expanded(
                child: Text(label, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
              ),
              Text(value, style: context.textTheme.bodyMedium?.copyWith(color: cs.onSurface.withValues(alpha: 0.5))),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, size: 20, color: cs.onSurface.withValues(alpha: 0.3)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeRow(BuildContext context, ColorScheme cs, ThemeMode themeMode) {
    final l10n = AppLocalizations.of(context)!;
    final options = [l10n.settingsLight, l10n.settingsDark, l10n.settingsSystem];
    int selectedIndex;
    switch (themeMode) {
      case ThemeMode.light:
        selectedIndex = 0;
      case ThemeMode.dark:
        selectedIndex = 1;
      default:
        selectedIndex = 2;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.settingsColorTheme, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Row(
              children: List.generate(options.length, (i) {
                final isSelected = i == selectedIndex;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => ref.read(themeProvider.notifier).setThemeMode(
                      i == 0 ? ThemeMode.light : (i == 1 ? ThemeMode.dark : ThemeMode.system),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.only(left: i > 0 ? 6 : 0, right: i < options.length - 1 ? 6 : 0),
                      decoration: BoxDecoration(
                        color: isSelected ? cs.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? cs.primary : cs.onSurface.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        options[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isSelected ? cs.onPrimary : cs.onSurface,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleRow(BuildContext context, ColorScheme cs, String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: Text(label, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
            ),
            Switch(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
}

  Widget _buildDangerZone(BuildContext context, ColorScheme cs) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      backgroundColor: cs.error.withValues(alpha: 0.08),
      borderOpacity: 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, size: 20, color: cs.error),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)!.settingsDangerZone,
                style: context.textTheme.titleSmall?.copyWith(color: cs.error, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => context.push('/delete-account'),
              icon: const Icon(Icons.delete_outline),
              label: Text(AppLocalizations.of(context)!.settingsDeleteAccount),
              style: OutlinedButton.styleFrom(
                foregroundColor: cs.error,
                side: BorderSide(color: cs.error.withValues(alpha: 0.5)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
