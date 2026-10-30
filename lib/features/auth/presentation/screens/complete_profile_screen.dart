import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';

class CompleteProfileScreen extends ConsumerStatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  ConsumerState<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends ConsumerState<CompleteProfileScreen> {
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final _dobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  final Set<String> _selectedCategoryIds = {};
  String? _selectedGender;
  bool _isSaving = false;

  bool get _canSave =>
      _nameController.text.trim().isNotEmpty && _selectedCategoryIds.isNotEmpty && _selectedGender != null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cats = ref.read(homeNotifierProvider).categories;
      if (cats.isEmpty) {
        ref.read(homeNotifierProvider.notifier).fetchCategories();
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now.subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1950),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = DateFormat('MMM dd, yyyy').format(picked);
      });
    }
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedCategoryIds.isEmpty) {
      context.showSnackBar('Please select at least one category', isError: true);
      return;
    }
    if (_selectedGender == null) {
      context.showSnackBar('Please select your gender', isError: true);
      return;
    }
    setState(() => _isSaving = true);

    final authState = ref.read(authProvider);
    final current = authState.user;
    final interestIds = _selectedCategoryIds
        .map((id) => int.tryParse(id) ?? 0)
        .where((id) => id != 0)
        .toList();

    final updated = current?.copyWith(
      name: _nameController.text.trim(),
      dateOfBirth: _selectedDate,
      gender: _selectedGender,
      categories: interestIds.map((e) => e.toString()).toList(),
    );

    if (updated != null) {
      ref.read(authProvider.notifier).updateProfile(updated).then((_) {
        if (!mounted) return;
        setState(() => _isSaving = false);
        GetStorage().write('profile_completed', true);
        context.go('/home');
      });
    } else {
      setState(() => _isSaving = false);
      context.showSnackBar('User data not available', isError: true);
    }
  }

  void _onSkip() {
    GetStorage().write('profile_completed', true);
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final homeState = ref.watch(homeNotifierProvider);
    final apiCategories = homeState.categories;

    const fallbackCategories = [
      ShowCategory(id: '1', name: 'Drama'),
      ShowCategory(id: '2', name: 'Comedy'),
      ShowCategory(id: '3', name: 'Romance'),
      ShowCategory(id: '4', name: 'Thriller'),
      ShowCategory(id: '5', name: 'Action'),
      ShowCategory(id: '6', name: 'Horror'),
      ShowCategory(id: '7', name: 'Sci-Fi'),
      ShowCategory(id: '8', name: 'Documentary'),
    ];
    final availableCategories = apiCategories.isNotEmpty ? apiCategories : fallbackCategories;
    final isCatLoading = apiCategories.isEmpty && homeState.isLoading;

    return Scaffold(
      body: GradientMeshBackground(
        animate: true,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 8, right: 16),
                child: Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: _onSkip,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: cs.primary,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 120),
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Complete Your Profile',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: cs.onSurface,
                            fontFamily: 'Outfit',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Set your name, gender and interests to get started',
                          style: TextStyle(
                            fontSize: 14,
                            color: cs.onSurface.withValues(alpha: 0.6),
                            fontFamily: 'Outfit',
                          ),
                        ),
                        const SizedBox(height: 28),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: cs.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.3), width: 1),
                            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Basic Info',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: cs.onSurface,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _nameController,
                                textCapitalization: TextCapitalization.words,
                                validator: (v) => v == null || v.trim().isEmpty ? 'Name is required' : null,
                                onChanged: (_) => setState(() {}),
                                style: TextStyle(color: cs.onSurface, fontSize: 16, fontFamily: 'Outfit'),
                                decoration: InputDecoration(
                                  hintText: 'Enter your name',
                                  prefixIcon: Icon(Icons.person_outline, size: 20, color: cs.onSurface.withValues(alpha: 0.5)),
                                  filled: true, fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.6),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.primary, width: 2)),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _genderController,
                                readOnly: true,
                                onTap: () => _showGenderPicker(context),
                                style: TextStyle(color: cs.onSurface, fontSize: 16, fontFamily: 'Outfit'),
                                decoration: InputDecoration(
                                  labelText: 'Gender *',
                                  hintText: 'Select your gender',
                                  prefixIcon: Icon(Icons.person_outline, size: 20, color: cs.onSurface.withValues(alpha: 0.5)),
                                  suffixIcon: Icon(Icons.keyboard_arrow_down, size: 20, color: cs.onSurface.withValues(alpha: 0.5)),
                                  filled: true, fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.6),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.primary, width: 2)),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _dobController,
                                readOnly: true,
                                onTap: _pickDate,
                                style: TextStyle(color: cs.onSurface, fontSize: 16, fontFamily: 'Outfit'),
                                decoration: InputDecoration(
                                  labelText: 'Date of Birth',
                                  hintText: 'Select your date of birth',
                                  prefixIcon: Icon(Icons.calendar_today_outlined, size: 20, color: cs.onSurface.withValues(alpha: 0.5)),
                                  suffixIcon: Icon(Icons.keyboard_arrow_down, size: 20, color: cs.onSurface.withValues(alpha: 0.5)),
                                  filled: true, fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.6),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.4))),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: cs.primary, width: 2)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: cs.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.3), width: 1),
                            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Choose Your Interests *',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: cs.onSurface,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Select at least one category',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: cs.onSurface.withValues(alpha: 0.5),
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              const SizedBox(height: 16),
                              if (isCatLoading)
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: List.generate(6, (_) => Container(
                                    width: 80, height: 32,
                                    decoration: BoxDecoration(
                                      color: cs.onSurface.withValues(alpha: 0.08),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  )),
                                )
                              else
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: availableCategories.map((cat) {
                                    final selected = _selectedCategoryIds.contains(cat.id);
                                    return FilterChip(
                                      label: Text(
                                        cat.name,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                                          color: selected ? cs.primary : cs.onSurface,
                                          fontFamily: 'Outfit',
                                        ),
                                      ),
                                      selected: selected,
                                      onSelected: (v) {
                                        setState(() {
                                          if (v) {
                                            _selectedCategoryIds.add(cat.id);
                                          } else {
                                            _selectedCategoryIds.remove(cat.id);
                                          }
                                        });
                                      },
                                      selectedColor: cs.primary.withValues(alpha: 0.15),
                                      backgroundColor: cs.surface,
                                      checkmarkColor: cs.primary,
                                      showCheckmark: true,
                                      side: BorderSide(
                                        color: selected ? cs.primary.withValues(alpha: 0.4) : cs.outlineVariant.withValues(alpha: 0.4),
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    );
                                  }).toList(),
                                ),
                              const SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    if (_selectedCategoryIds.isEmpty) {
                                      context.showSnackBar('Please select at least one interest', isError: true);
                                    } else {
                                      context.showSnackBar('${_selectedCategoryIds.length} interests selected');
                                    }
                                  },
                                  style: TextButton.styleFrom(foregroundColor: cs.primary, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                                  child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Outfit')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: GlassButton(
          text: 'Save & Continue',
          backgroundColor: _canSave && !_isSaving ? cs.primary : cs.onSurface.withValues(alpha: 0.15),
          foregroundColor: _canSave && !_isSaving ? cs.onPrimary : cs.onSurface.withValues(alpha: 0.4),
          isLoading: _isSaving,
          onPressed: _canSave && !_isSaving ? _onSave : null,
        ),
      ),
    );
  }

  void _showGenderPicker(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: cs.onSurface.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Select Gender',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: cs.onSurface,
                fontFamily: 'Outfit',
              ),
            ),
            const SizedBox(height: 20),
            _buildGenderOption(context, 'Male', 'male'),
            _buildGenderOption(context, 'Female', 'female'),
            _buildGenderOption(context, 'Other', 'other'),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(BuildContext context, String label, String value) {
    final cs = Theme.of(context).colorScheme;
    final selected = _selectedGender == value;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedGender = value;
            _genderController.text = label;
          });
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: selected ? cs.primary.withValues(alpha: 0.15) : context.surfaceWhite(),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? cs.primary : context.glassBorder(),
              width: selected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                color: selected ? cs.primary : cs.onSurface.withValues(alpha: 0.4),
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: selected ? cs.primary : cs.onSurface,
                  fontFamily: 'Outfit',
                ),
              ),
            ],
          ),
        ),
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
}