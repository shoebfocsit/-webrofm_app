import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/services/language_provider.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/l10n/app_localizations.dart';

class LanguagesScreen extends ConsumerStatefulWidget {
  final String? type;
  const LanguagesScreen({super.key, this.type});

  @override
  ConsumerState<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends ConsumerState<LanguagesScreen> {
  final List<Map<String, dynamic>> _languages = [
    {'name': 'English', 'native': 'English', 'code': 'en'},
    {'name': 'Hindi', 'native': 'हिन्दी', 'code': 'hi'},
    {'name': 'Punjabi', 'native': 'ਪੰਜਾਬੀ', 'code': 'pa'},
    {'name': 'Marathi', 'native': 'मराठी', 'code': 'mr'},
    {'name': 'Gujarati', 'native': 'ગુજરાતી', 'code': 'gu'},
    {'name': 'Bengali', 'native': 'বাংলা', 'code': 'bn'},
    {'name': 'Tamil', 'native': 'தமிழ்', 'code': 'ta'},
    {'name': 'Telugu', 'native': 'తెలుగు', 'code': 'te'},
    {'name': 'Kannada', 'native': 'ಕನ್ನಡ', 'code': 'kn'},
    {'name': 'Malayalam', 'native': 'മലയാളം', 'code': 'ml'},
    {'name': 'Urdu', 'native': 'اردو', 'code': 'ur'},
  ];

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final selectedCode = ref.watch(languageProvider).languageCode;
    final title = widget.type == 'subtitle'
        ? l10n.languagesSubtitleLanguage
        : l10n.languagesAppLanguage;
    return Scaffold(
      body: GradientMeshBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context, cs, title),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  children: _languages.map((lang) => _buildLangTile(cs, lang, selectedCode)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, ColorScheme cs, String title) {
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
            title,
            style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildLangTile(ColorScheme cs, Map<String, dynamic> lang, String selectedCode) {
    final code = lang['code'] as String;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Material(
          color: Colors.transparent,
          child: RadioListTile<String>(
            value: code,
            groupValue: selectedCode,
            onChanged: (v) {
              if (v == null) return;
              ref.read(languageProvider.notifier).setLanguage(v);
              context.pop();
            },
            title: Text(lang['name'], style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
            subtitle: Text(lang['native'], style: TextStyle(color: cs.onSurface.withValues(alpha: 0.5))),
            activeColor: cs.primary,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
