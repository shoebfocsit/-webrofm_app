import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webrofm/core/constants/app_constants.dart';

const _supportedCodes = {
  'en',
  'hi',
  'pa',
  'mr',
  'gu',
  'bn',
  'ta',
  'te',
  'kn',
  'ml',
  'ur',
};

Locale _localeFromCode(String? code) {
  if (code == null || !_supportedCodes.contains(code)) return const Locale('en');
  return Locale(code);
}

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(_loadLocale());

  static Locale _loadLocale() {
    final box = GetStorage();
    final stored = box.read<String>(AppConstants.prefLanguage);
    return _localeFromCode(stored);
  }

  void _persist(String code) {
    final box = GetStorage();
    box.write(AppConstants.prefLanguage, code);
  }

  String get code => state.languageCode;

  void setLanguage(String code) {
    final locale = _localeFromCode(code);
    state = locale;
    _persist(locale.languageCode);
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier();
});
