import 'package:flutter/material.dart';
import 'package:webrofm/l10n/app_localizations.dart';

class ContentDisclaimer extends StatelessWidget {
  final bool onDark;

  const ContentDisclaimer({super.key, this.onDark = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final textColor = onDark
        ? Colors.white.withValues(alpha: 0.75)
        : cs.onSurface.withValues(alpha: 0.7);
    final bgColor = onDark
        ? Colors.white.withValues(alpha: 0.08)
        : cs.surfaceContainerHighest;
    final borderColor = onDark
        ? Colors.white.withValues(alpha: 0.15)
        : cs.outline.withValues(alpha: 0.3);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Icon(
              Icons.info_outline_rounded,
              size: 16,
              color: textColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              l10n.contentDisclaimer,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: textColor,
                    height: 1.4,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
