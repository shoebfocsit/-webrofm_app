import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/l10n/app_localizations.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;

    return Scaffold(
      body: GradientMeshBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text(
                  AppLocalizations.of(context)!.downloadsTitle,
                  style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: _buildEmptyState(context, cs)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ColorScheme cs) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cs.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.download_outlined, size: 56, color: cs.primary.withValues(alpha: 0.6)),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.downloadsEmptyTitle,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.downloadsEmptySubtitle,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(color: cs.onSurface.withValues(alpha: 0.6)),
            ),
            const SizedBox(height: 24),
            GlassButton(
              text: AppLocalizations.of(context)!.downloadsBrowseShows,
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              onPressed: () => context.go('/home'),
            ),
          ],
        ),
      ),
    );
  }
}
