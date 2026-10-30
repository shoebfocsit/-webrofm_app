import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';

class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({super.key});

  @override
  State<TermsOfUseScreen> createState() => _TermsOfUseScreenState();
}

class _TermsOfUseScreenState extends State<TermsOfUseScreen> {
  final _scrollController = ScrollController();
  final _sectionKeys = {
    'usage': GlobalKey(),
    'accounts': GlobalKey(),
    'content': GlobalKey(),
    'liability': GlobalKey(),
  };

  static const _sections = [
    {'id': 'usage', 'label': 'Usage', 'title': 'Usage Guidelines', 'content': '''
By accessing or using WebroFM, you agree to be bound by these Terms of Use. You must use the Service in compliance with all applicable laws and regulations.

You may not modify, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any content obtained from the Service without explicit permission.

The Service is provided for personal, non-commercial entertainment purposes only. Any commercial use is strictly prohibited unless otherwise agreed in writing.''',
    },
    {'id': 'accounts', 'label': 'Accounts', 'title': 'User Accounts', 'content': '''
You are responsible for maintaining the confidentiality of your account credentials. You must provide accurate, current, and complete information during the registration process.

You are solely responsible for all activities that occur under your account. You must notify us immediately of any unauthorized use of your account.

We reserve the right to suspend or terminate accounts that violate these terms or engage in fraudulent, abusive, or illegal activities.''',
    },
    {'id': 'content', 'label': 'Content', 'title': 'Content & Intellectual Property', 'content': '''
All content available on WebroFM, including but not limited to audio, video, text, graphics, and logos, is protected by copyright and other intellectual property laws.

You may stream content for personal, non-commercial viewing only. Downloading, recording, or redistributing content without authorization is strictly prohibited.

User-generated content, including reviews and comments, must not infringe upon the rights of others or contain offensive, defamatory, or illegal material.''',
    },
    {'id': 'liability', 'label': 'Liability', 'title': 'Limitation of Liability', 'content': '''
WebroFM and its affiliates shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of the Service.

We do not guarantee that the Service will be uninterrupted, timely, secure, or error-free. The Service is provided on an "AS IS" and "AS AVAILABLE" basis.

In no event shall our total liability exceed the amount paid by you, if any, for accessing the Service during the twelve months preceding the claim.''',
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
      body: GradientMeshBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context, cs),
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
            'Terms of Use',
            style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildChips(BuildContext context, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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
