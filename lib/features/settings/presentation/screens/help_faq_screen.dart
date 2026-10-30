import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';

class HelpFaqScreen extends StatefulWidget {
  const HelpFaqScreen({super.key});

  @override
  State<HelpFaqScreen> createState() => _HelpFaqScreenState();
}

class _HelpFaqScreenState extends State<HelpFaqScreen> {
  String _selectedCategory = 'All';
  int? _expandedIndex;
  final _searchController = TextEditingController();

  static const _categories = ['All', 'Account', 'Playback', 'Billing', 'Other'];

  static const _faqs = [
    {'category': 'Account', 'question': 'How do I reset my password?', 'answer': 'To reset your password, go to the Login screen and tap "Forgot Password". Enter your registered email address and we will send you a password reset link. Follow the instructions in the email to create a new password. Make sure to check your spam folder if you do not receive the email within a few minutes.'},
    {'category': 'Billing', 'question': 'Can I change my subscription plan?', 'answer': 'Yes, you can change your subscription plan at any time. Go to Settings > Subscription & Billing. Select the new plan you wish to switch to. The changes will take effect at the start of your next billing cycle. If you upgrade, you will be charged the prorated difference immediately.'},
    {'category': 'Account', 'question': 'How do I delete my account?', 'answer': 'To delete your account, go to Settings > Account & Privacy > Danger Zone and tap "Delete My Account". Follow the verification process to confirm the deletion. Please note that account deletion is permanent and cannot be undone. All your data, including playlists and listening history, will be erased.'},
    {'category': 'Playback', 'question': 'Where are my downloaded files?', 'answer': 'Your downloaded files are stored locally on your device within the app\'s secure storage. You can access them by going to the Downloads tab from the main navigation. Downloaded content is available for offline playback only within the WebroFM app and cannot be transferred to other devices.'},
    {'category': 'Account', 'question': 'How do I update my profile information?', 'answer': 'Go to your Profile by tapping the profile icon. Tap "Edit Profile" to update your name, email, date of birth, and profile picture. Your phone number cannot be changed from the app for security reasons. Contact support if you need to update your phone number.'},
    {'category': 'Playback', 'question': 'Why is my audio not playing?', 'answer': 'First, check your internet connection. Try restarting the app or clearing the cache. If the issue persists, check if your device volume is on and that the app has permission to play audio. You can also try logging out and logging back in.'},
    {'category': 'Billing', 'question': 'How do I get a refund?', 'answer': 'Refunds are handled on a case-by-case basis. Please contact our support team through the Contact Us page with your payment details and reason for the refund request. We typically process refunds within 5-10 business days after approval.'},
    {'category': 'Other', 'question': 'How do I report a bug?', 'answer': 'We appreciate your help in improving WebroFM. Please use the Contact Us feature to report any bugs or issues you encounter. Include as much detail as possible, including your device model, app version, and steps to reproduce the issue.'},
  ];

  List<Map<String, String>> get _filteredFaqs {
    final query = _searchController.text.toLowerCase().trim();
    return _faqs.where((faq) {
      final matchesCategory = _selectedCategory == 'All' || faq['category'] == _selectedCategory;
      if (!matchesCategory) return false;
      if (query.isEmpty) return true;
      return (faq['question'] ?? '').toLowerCase().contains(query) ||
          (faq['answer'] ?? '').toLowerCase().contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final filtered = _filteredFaqs;

    return Scaffold(
      body: GradientMeshBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context, cs),
              _buildSearchBar(context, cs),
              _buildCategoryChips(context, cs),
              Expanded(
                child: filtered.isEmpty
                    ? _buildEmptyState(context, cs)
                    : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                        itemCount: filtered.length,
                        itemBuilder: (ctx, i) => _buildFaqItem(context, cs, filtered[i], i),
                      ),
              ),
              _buildContactFooter(context, cs),
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
            'Help & FAQ',
            style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: GlassInput(
        hint: 'Search FAQs...',
        controller: _searchController,
        onChanged: (_) => setState(() {}),
        prefixIcon: Icon(Icons.search, size: 20),
      ),
    );
  }

  Widget _buildCategoryChips(BuildContext context, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories.map((cat) {
            final isSelected = cat == _selectedCategory;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(cat),
                selected: isSelected,
                onSelected: (_) => setState(() => _selectedCategory = cat),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildFaqItem(BuildContext context, ColorScheme cs, Map<String, String> faq, int index) {
    final isExpanded = _expandedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: EdgeInsets.zero,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          child: Column(
            children: [
              InkWell(
                onTap: () => setState(() => _expandedIndex = isExpanded ? null : index),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          faq['question'] ?? '',
                          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 250),
                        child: Icon(Icons.keyboard_arrow_down, size: 22, color: cs.onSurface.withValues(alpha: 0.4)),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    faq['answer'] ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: cs.onSurface.withValues(alpha: 0.7),
                      height: 1.5,
                    ),
                  ),
                ),
                crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 250),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ColorScheme cs) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 48, color: cs.onSurface.withValues(alpha: 0.3)),
          const SizedBox(height: 12),
          Text(
            'No results found',
            style: context.textTheme.titleMedium?.copyWith(color: cs.onSurface.withValues(alpha: 0.5)),
          ),
        ],
      ),
    );
  }

  Widget _buildContactFooter(BuildContext context, ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: cs.onSurface.withValues(alpha: 0.08))),
      ),
      child: Column(
        children: [
          Text(
            'Still need help?',
            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => context.push('/contact-us'),
              icon: const Icon(Icons.headphones_outlined, size: 20),
              label: const Text('Contact Us'),
            ),
          ),
        ],
      ),
    );
  }
}
