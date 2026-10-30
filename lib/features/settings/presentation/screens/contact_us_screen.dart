import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/l10n/app_localizations.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String _selectedSubject = 'General Inquiry';
  final _messageController = TextEditingController();
  String? _attachmentName;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onMessageChanged);
  }

  void _onMessageChanged() => setState(() {});

  @override
  void dispose() {
    _messageController.removeListener(_onMessageChanged);
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: GradientMeshBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context, cs, l10n),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildQuickContactSection(context, cs, l10n),
                      const SizedBox(height: 24),
                      _buildFormLabel(context, cs, l10n.contactUsSubject),
                      const SizedBox(height: 8),
                      _buildSubjectDropdown(context, cs),
                      const SizedBox(height: 16),
                      _buildFormLabel(context, cs, l10n.contactUsMessageLabel),
                      const SizedBox(height: 8),
                      _buildMessageField(context, cs, l10n),
                      const SizedBox(height: 12),
                      _buildAttachmentButton(context, cs, l10n),
                      const SizedBox(height: 24),
                      _buildSendButton(context, cs, l10n),
                      const SizedBox(height: 32),
                      _buildSocialMediaSection(context, cs, l10n),
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

  Widget _buildAppBar(BuildContext context, ColorScheme cs, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 20, 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.contactUsTitle,
                  style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  l10n.contactUsSubtitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormLabel(BuildContext context, ColorScheme cs, String text) {
    return Text(
      text,
      style: context.textTheme.titleSmall?.copyWith(
        color: cs.onSurface.withValues(alpha: 0.8),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildQuickContactSection(BuildContext context, ColorScheme cs, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.contactUsQuickContact,
          style: context.textTheme.titleMedium?.copyWith(
            color: cs.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _buildContactTile(
          context,
          cs,
          Icons.email_outlined,
          const [Color(0xFFae3115), Color(0xFFff6b4a)],
          l10n.contactUsEmail,
          l10n.contactUsEmailValue,
          () => _launchUrl('mailto:${l10n.contactUsEmailValue}'),
        ),
      ],
    );
  }

  Widget _buildContactTile(
    BuildContext context,
    ColorScheme cs,
    IconData icon,
    List<Color> colors,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: colors),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: cs.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: cs.onSurface.withValues(alpha: 0.4)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectDropdown(BuildContext context, ColorScheme cs) {
    final l10n = AppLocalizations.of(context)!;
    final subjects = [
      l10n.contactUsGeneralInquiry,
      l10n.contactUsTechnicalSupport,
      l10n.contactUsAccountIssue,
      l10n.contactUsBillingQuestion,
      l10n.contactUsFeatureRequest,
      l10n.contactUsBugReport,
      'Other',
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: DropdownButtonFormField<String>(
        initialValue: _selectedSubject,
        dropdownColor: cs.surfaceContainerHigh,
        isExpanded: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8),
        ),
        style: context.textTheme.bodyMedium?.copyWith(
          color: cs.onSurface,
          fontWeight: FontWeight.w600,
        ),
        items: subjects.map((s) => DropdownMenuItem(value: s, child: Text(s, overflow: TextOverflow.ellipsis))).toList(),
        onChanged: (v) {
          if (v != null) setState(() => _selectedSubject = v);
        },
      ),
    );
  }

  Widget _buildMessageField(BuildContext context, ColorScheme cs, AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: TextFormField(
        controller: _messageController,
        maxLines: 6,
        minLines: 6,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        style: context.textTheme.bodyMedium?.copyWith(
          color: cs.onSurface,
        ),
        decoration: InputDecoration(
          hintText: l10n.contactUsMessageHint,
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: cs.onSurface.withValues(alpha: 0.45),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildAttachmentButton(BuildContext context, ColorScheme cs, AppLocalizations l10n) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: cs.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _pickAttachment,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _attachmentName != null ? Icons.attach_file : Icons.attachment_outlined,
                  size: 20,
                  color: cs.primary,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    _attachmentName != null ? _attachmentName! : l10n.contactUsAddAttachment,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: cs.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (_attachmentName != null) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => _attachmentName = null),
                    child: Icon(Icons.close, size: 18, color: cs.onSurface.withValues(alpha: 0.5)),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSendButton(BuildContext context, ColorScheme cs, AppLocalizations l10n) {
    final disabled = _messageController.text.trim().isEmpty || _isSending;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFae3115), Color(0xFFff6b4a)]),
            ),
            child: InkWell(
              onTap: disabled ? null : _sendMessage,
              splashColor: Colors.white.withValues(alpha: 0.2),
              highlightColor: Colors.white.withValues(alpha: 0.1),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: disabled ? 0.5 : 1,
                child: Center(
                  child: _isSending
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              l10n.contactUsSend,
                              style: context.textTheme.labelLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaSection(BuildContext context, ColorScheme cs, AppLocalizations l10n) {
    final socialLinks = [
      {
        'name': 'LinkedIn',
        'url': 'https://www.linkedin.com/company/webro-fm/?viewAsMember=true',
        'colors': [const Color(0xFF0A66C2), const Color(0xFF004182)],
        'icon': Icons.business_center_rounded,
      },
      {
        'name': 'YouTube',
        'url': 'https://youtube.com/@webro_fm',
        'colors': [const Color(0xFFFF0000), const Color(0xFFC40000)],
        'icon': Icons.play_arrow_rounded,
      },
      {
        'name': 'Instagram',
        'url': 'https://www.instagram.com/webro_fm?igsi=MTh3eHY5dHd3ejgwcw%3D%3D',
        'colors': [const Color(0xFF833AB4), const Color(0xFFFD1D1D), const Color(0xFFF77737)],
        'icon': Icons.camera_alt_rounded,
      },
      {
        'name': 'Facebook',
        'url': 'https://www.facebook.com/share/1TShauth9K/?mibextid=wwXIfr',
        'colors': [const Color(0xFF1877F2), const Color(0xFF0056B3)],
        'icon': Icons.facebook_rounded,
      },
    ];

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text(
          'Connect With Us',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Follow Webro FM on official channels',
          style: context.textTheme.bodySmall?.copyWith(
            color: cs.onSurface.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 14,
          runSpacing: 14,
          children: socialLinks.map((social) {
            final colors = social['colors'] as List<Color>;
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _launchUrl(social['url'] as String),
                borderRadius: BorderRadius.circular(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: colors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: colors.first.withValues(alpha: 0.35),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        social['icon'] as IconData,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      social['name'] as String,
                      style: context.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: cs.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    ),
    );
  }

  Future<void> _pickAttachment() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() => _attachmentName = result.files.first.name);
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        if (mounted) {
          context.showSnackBar('Could not launch link', isError: true);
        }
      }
    } catch (_) {
      if (mounted) {
        context.showSnackBar('Could not launch link', isError: true);
      }
    }
  }

  Future<void> _sendMessage() async {
    final l10n = AppLocalizations.of(context)!;
    final message = _messageController.text.trim();
    if (message.isEmpty) {
      context.showSnackBar(l10n.contactUsNoMessage, isError: true);
      return;
    }
    setState(() => _isSending = true);
    await Future.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    context.showSnackBar(l10n.contactUsSent);
    _messageController.clear();
    setState(() {
      _isSending = false;
      _selectedSubject = l10n.contactUsGeneralInquiry;
      _attachmentName = null;
    });
  }
}
