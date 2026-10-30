import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/core/utils/profile_utils.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/features/profile/presentation/providers/profile_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _dobController;
  DateTime? _dateOfBirth;
  String? _gender;
  File? _avatarFile;
  List<String> _selectedCategories = [];
  bool _isSaving = false;
  List<String> _availableCategories = [];

  static const _genderOptions = ['male', 'female', 'other', 'prefer_not_to_say'];

  @override
  void initState() {
    super.initState();
    final user = ref.read(profileProvider).user;
    _nameController = TextEditingController(text: user?.name ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _dobController = TextEditingController(text: user?.dateOfBirth != null ? DateFormat('MMM dd, yyyy').format(user!.dateOfBirth!) : '');
    _dateOfBirth = user?.dateOfBirth;
    _gender = user?.gender;
    final homeCategories = ref.read(homeNotifierProvider).categories;
    _selectedCategories = categoryIdsToNames(
      List<String>.from(user?.categories ?? []),
      homeCategories,
    );
    _availableCategories = homeCategories.isNotEmpty
        ? homeCategories.map((c) => c.name).toList()
        : _defaultCategories;
  }

  static const _defaultCategories = [
    'Technology', 'Music', 'Sports', 'News', 'Comedy',
    'Education', 'Business', 'Health', 'Science', 'Arts',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final profileState = ref.watch(profileProvider);
    final user = profileState.user;

    return Scaffold(
      body: GradientMeshBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context, cs),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildAvatarSection(context, cs, user),
                        const SizedBox(height: 24),
                        _buildFieldLabel('Full Name', cs),
                        TextFormField(
                          controller: _nameController,
                          validator: (v) => v == null || v.trim().isEmpty ? 'Name is required' : null,
                          style: TextStyle(color: cs.onSurface, fontSize: 16, fontFamily: 'Outfit'),
                          decoration: InputDecoration(
                            hintText: 'Enter your full name',
                            prefixIcon: const Icon(Icons.person_outline, size: 20),
                            filled: true,
                            fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.6),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.primary, width: 2)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildFieldLabel('Email', cs),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) { if (v == null || v.trim().isEmpty) return 'Email is required'; if (!v.trim().isValidEmail) return 'Invalid email'; return null; },
                          style: TextStyle(color: cs.onSurface, fontSize: 16, fontFamily: 'Outfit'),
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            prefixIcon: const Icon(Icons.email_outlined, size: 20),
                            filled: true,
                            fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.6),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.primary, width: 2)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildFieldLabel('Date of Birth', cs),
                        TextFormField(
                          controller: _dobController,
                          readOnly: true,
                          onTap: () => _pickDate(context),
                          style: TextStyle(color: cs.onSurface, fontSize: 16, fontFamily: 'Outfit'),
                          decoration: InputDecoration(
                            hintText: 'Select Date of Birth',
                            prefixIcon: const Icon(Icons.calendar_today, size: 20),
                            filled: true,
                            fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.6),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.primary, width: 2)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildGenderField(context, cs),
                        const SizedBox(height: 16),
                        _buildFieldLabel('Phone', cs),
                        TextFormField(
                          controller: _phoneController,
                          enabled: false,
                          style: TextStyle(color: cs.onSurface, fontSize: 16, fontFamily: 'Outfit'),
                          decoration: InputDecoration(
                            hintText: 'Phone number',
                            prefixIcon: const Icon(Icons.phone_outlined, size: 20),
                            suffixIcon: Icon(Icons.lock_outline, size: 16, color: cs.onSurface.withValues(alpha: 0.3)),
                            filled: true,
                            fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.5),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.3))),
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildCategorySection(context, cs),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
              _buildSaveButton(context, cs),
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
            'Edit Profile',
            style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarSection(BuildContext context, ColorScheme cs, User? user) {
    return GestureDetector(
      onTap: _pickImage,
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundColor: cs.primary.withValues(alpha: 0.15),
                backgroundImage: _avatarFile != null
                    ? FileImage(_avatarFile!) as ImageProvider
                    : avatarImageProvider(user?.avatar, gender: user?.gender, seed: user?.id ?? ''),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: cs.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: cs.surface, width: 3),
                  ),
                  child: Icon(Icons.camera_alt, size: 22, color: cs.onPrimary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Tap to change photo',
            style: context.textTheme.bodySmall?.copyWith(color: cs.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: cs.onSurface.withValues(alpha: 0.75),
            fontFamily: 'Outfit',
          ),
        ),
      ),
    );
  }

  Widget _buildGenderField(BuildContext context, ColorScheme cs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Gender', cs),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          decoration: BoxDecoration(
            color: cs.surfaceContainerHighest.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.4)),
          ),
          child: DropdownButtonFormField<String>(
            initialValue: _gender,
            isExpanded: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.wc_outlined, size: 20, color: cs.onSurface.withValues(alpha: 0.5)),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
            hint: Text('Select Gender', style: TextStyle(color: cs.onSurface.withValues(alpha: 0.4), fontSize: 16, fontFamily: 'Outfit')),
            items: _genderOptions.map((g) => DropdownMenuItem(
              value: g,
              child: Text(g.titleCase, style: TextStyle(color: cs.onSurface, fontSize: 16, fontFamily: 'Outfit')),
            )).toList(),
            onChanged: (v) => setState(() => _gender = v),
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection(BuildContext context, ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cs.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category Preferences',
            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ..._selectedCategories.map((cat) => Chip(
                    label: Text(cat, style: const TextStyle(fontSize: 13)),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () {
                      setState(() => _selectedCategories.remove(cat));
                    },
                  )),
              ActionChip(
                avatar: const Icon(Icons.add, size: 18),
                label: const Text('Add More', style: TextStyle(fontSize: 13)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: cs.primary.withValues(alpha: 0.5), style: BorderStyle.solid, width: 1),
                ),
                onPressed: () => _showAddCategorySheet(context, cs),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context, ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: cs.onSurface.withValues(alpha: 0.08))),
      ),
      child: GlassButton(
        text: 'Save Changes',
        onPressed: _isSaving ? null : _saveProfile,
        isLoading: _isSaving,
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        width: double.infinity,
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth ?? now.subtract(const Duration(days: 365 * 18)),
      firstDate: now.subtract(const Duration(days: 365 * 100)),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _dateOfBirth = picked;
        _dobController.text = DateFormat('MMM dd, yyyy').format(picked);
      });
    }
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      setState(() => _avatarFile = File(result.files.single.path!));
    }
  }

  void _showAddCategorySheet(BuildContext context, ColorScheme cs) {
    final available = _availableCategories.where((c) => !_selectedCategories.contains(c)).toList();
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Category', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: available.map((cat) => FilterChip(
                label: Text(cat),
                selected: false,
                onSelected: (_) {
                  setState(() => _selectedCategories.add(cat));
                  Navigator.of(ctx).pop();
                },
              )).toList(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    final current = ref.read(profileProvider).user;
    if (current == null) {
      context.showSnackBar('User data not available', isError: true);
      setState(() => _isSaving = false);
      return;
    }

    final homeCategories = ref.read(homeNotifierProvider).categories;
    final interestIds = categoryNamesToIds(_selectedCategories, homeCategories);

    final updated = current.copyWith(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      gender: _gender,
      dateOfBirth: _dateOfBirth,
      categories: interestIds.map((e) => e.toString()).toList(),
    );

    await ref.read(profileProvider.notifier)
        .updateProfile(updated, profilePicture: _avatarFile);
    setState(() => _isSaving = false);

    final state = ref.read(profileProvider);
    if (state.error != null) {
      context.showSnackBar(state.error!, isError: true);
    } else {
      context.showSnackBar('Profile updated successfully');
      context.pop();
    }
  }
}
