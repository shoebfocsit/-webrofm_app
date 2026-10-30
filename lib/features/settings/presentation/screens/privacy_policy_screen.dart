import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final _scrollController = ScrollController();
  final _sectionKeys = {
    'collection': GlobalKey(),
    'usage': GlobalKey(),
    'sharing': GlobalKey(),
    'security': GlobalKey(),
    'rights': GlobalKey(),
  };

  static const _sections = [
    {'id': 'collection', 'label': 'Collection', 'title': 'Information We Collect', 'content': '''
We collect information you provide directly, including your name, email address, phone number, and profile information when you create an account.

We automatically collect certain information when you use the Service, such as your IP address, device type, operating system, browsing activity, and listening habits.

We may collect payment information if you subscribe to premium services. This data is processed securely by our payment partners.''',
    },
    {'id': 'usage', 'label': 'Usage', 'title': 'How We Use Your Information', 'content': '''
We use your information to provide, maintain, and improve our streaming services, personalize your experience, and recommend content we think you'll enjoy.

Your data helps us communicate with you about service updates, security alerts, and support messages. We may send promotional content with your consent.

We analyze usage patterns to enhance our platform, develop new features, and understand user preferences across our community.''',
    },
    {'id': 'sharing', 'label': 'Sharing', 'title': 'Information Sharing', 'content': '''
We do not sell your personal information to third parties. We may share data with trusted service providers who assist in operating our platform, subject to strict confidentiality agreements.

We may disclose information if required by law, to protect our rights, or to investigate fraud or illegal activities.

Aggregated, anonymized data may be shared for analytics and research purposes. This data cannot be used to identify you personally.''',
    },
    {'id': 'security', 'label': 'Security', 'title': 'Data Security', 'content': '''
We implement industry-standard security measures to protect your personal information, including encryption, secure servers, and access controls.

While we strive to protect your data, no method of electronic storage or transmission is 100% secure. We encourage you to use strong passwords and keep your account credentials confidential.

We regularly review and update our security practices to maintain the highest standards of data protection.''',
    },
    {'id': 'rights', 'label': 'Rights', 'title': 'Your Rights & Choices', 'content': '''
You have the right to access, update, or delete your personal information at any time through your account settings. You may also contact us directly for assistance.

You can opt out of promotional communications at any time. Account-related notices will still be sent as necessary for service operation.

You may request a copy of your data or ask us to delete your account entirely. We will respond to your request within the timeframe required by applicable law.''',
    },
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String id) {
    final key = _sectionKeys[id];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundBlobs(context, cs),
          SafeArea(
            child: Column(
              children: [
                _buildAppBar(context, cs),
                _buildHeader(context, cs),
                _buildChips(context, cs),
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: _sections.map((s) => _buildSection(context, cs, s)).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundBlobs(BuildContext context, ColorScheme cs) {
    return CustomPaint(
      size: Size.infinite,
      painter: _BlobPainter(cs),
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
            'Privacy Policy',
            style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.shield_outlined, size: 32, color: cs.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Privacy Policy',
                    style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Last updated: July 22, 2026',
                    style: context.textTheme.bodySmall?.copyWith(color: cs.onSurface.withValues(alpha: 0.5)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChips(BuildContext context, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _sections.map((s) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ActionChip(
                label: Text(s['label'] as String),
                onPressed: () => _scrollToSection(s['id'] as String),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, ColorScheme cs, Map<String, dynamic> section) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        key: _sectionKeys[section['id'] as String],
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section['title'] as String,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(
              (section['content'] as String).trim(),
              style: context.textTheme.bodyMedium?.copyWith(height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

class _BlobPainter extends CustomPainter {
  final ColorScheme cs;

  _BlobPainter(this.cs);

  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      cs.primary.withValues(alpha: 0.12),
      cs.secondary.withValues(alpha: 0.10),
      cs.primary.withValues(alpha: 0.08),
    ];

    for (var i = 0; i < 3; i++) {
      final center = Offset(
        size.width * (0.15 + 0.7 * (i / 2)),
        size.height * (0.1 + 0.6 * (i / 2)),
      );
      final radius = size.width * (0.25 + 0.15 * sin(i * 2.5));

      final paint = Paint()
        ..shader = RadialGradient(
          colors: [colors[i], colors[i].withValues(alpha: 0.0)],
          stops: const [0.0, 1.0],
        ).createShader(Rect.fromCircle(center: center, radius: radius));

      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
