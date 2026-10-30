import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';

class DeleteAccountScreen extends ConsumerStatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  ConsumerState<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends ConsumerState<DeleteAccountScreen> {
  String? _selectedReason;

  static const _reasons = [
    'I don\'t use the app anymore',
    'Too expensive',
    'Privacy concerns',
    'Technical issues',
    'Found a better alternative',
    'Other',
  ];

  static const _dataLossItems = [
    {'icon': Icons.person_outline, 'title': 'Profile & Settings', 'desc': 'Your profile information, preferences, and app settings will be permanently deleted.'},
    {'icon': Icons.history, 'title': 'Listening History', 'desc': 'Your listening history, search history, and activity logs will be erased.'},
    {'icon': Icons.bookmark_outline, 'title': 'Saved Items', 'desc': 'All your playlists, favorites, and saved content will be removed.'},
    {'icon': Icons.subscriptions_outlined, 'title': 'Subscriptions', 'desc': 'Any active subscriptions will be cancelled and premium access will end.'},
  ];

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;

    return Scaffold(
      body: GradientMeshBackground(
        animate: false,
        colors: [
          cs.error.withValues(alpha: 0.15),
          cs.error.withValues(alpha: 0.05),
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
                      const SizedBox(height: 20),
                      _buildWarningSection(context, cs),
                      const SizedBox(height: 20),
                      _buildDataLossSection(context, cs),
                      const SizedBox(height: 20),
                      _buildReasonDropdown(context, cs),
                      const SizedBox(height: 24),
                      _buildActions(context, cs),
                      const SizedBox(height: 24),
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
          const SizedBox(width: 8),
          Text(
            'Delete Account',
            style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningSection(BuildContext context, ColorScheme cs) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cs.error.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.warning_amber_rounded, size: 48, color: cs.error),
        ),
        const SizedBox(height: 16),
        Text(
          'Delete My Account',
          style: context.textTheme.headlineSmall?.copyWith(
            color: cs.error,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'This action cannot be undone. All your data will be permanently removed.',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: cs.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildDataLossSection(BuildContext context, ColorScheme cs) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The following data will be lost:',
            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          ..._dataLossItems.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: cs.error.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(item['icon'] as IconData, size: 20, color: cs.error),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] as String,
                            style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item['desc'] as String,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: cs.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildReasonDropdown(BuildContext context, ColorScheme cs) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: DropdownButtonFormField<String>(
        initialValue: _selectedReason,
        hint: const Text('Select a reason'),
        decoration: const InputDecoration(
          labelText: 'Reason for deletion',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8),
        ),
        items: _reasons.map((r) => DropdownMenuItem(value: r, child: Text(r, style: const TextStyle(fontSize: 14)))).toList(),
        onChanged: (v) => setState(() => _selectedReason = v),
      ),
    );
  }

  Widget _buildActions(BuildContext context, ColorScheme cs) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _selectedReason == null
                ? null
                : () {
                    final authState = ref.read(authProvider);
                    final userPhone = authState.user?.phone ?? authState.phone;
                    if (userPhone != null && userPhone.isNotEmpty) {
                      ref.read(authProvider.notifier).sendOtp(userPhone);
                    }
                    context.push('/delete-account-otp');
                  },
            icon: const Icon(Icons.delete_outline),
            label: const Text('Delete My Account'),
            style: OutlinedButton.styleFrom(
              foregroundColor: cs.error,
              side: BorderSide(color: cs.error.withValues(alpha: 0.5)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              disabledForegroundColor: cs.onSurface.withValues(alpha: 0.3),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
        ),
      ],
    );
  }
}

