import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webrofm/core/constants/app_constants.dart';

ThemeMode _themeFromString(String value) {
  switch (value) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

String _themeToString(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.light:
      return 'light';
    case ThemeMode.dark:
      return 'dark';
    default:
      return 'system';
  }
}

ThemeMode _loadTheme() {
  final box = GetStorage();
  final stored = box.read<String>(AppConstants.prefThemeMode) ?? 'light';
  return _themeFromString(stored);
}

void _persistTheme(ThemeMode mode) {
  final box = GetStorage();
  box.write(AppConstants.prefThemeMode, _themeToString(mode));
}

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(_loadTheme());

  void toggle() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else if (state == ThemeMode.dark) {
      state = ThemeMode.system;
    } else {
      state = ThemeMode.light;
    }
    _persistTheme(state);
  }

  void setLight() {
    state = ThemeMode.light;
    _persistTheme(state);
  }

  void setDark() {
    state = ThemeMode.dark;
    _persistTheme(state);
  }

  void setSystem() {
    state = ThemeMode.system;
    _persistTheme(state);
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
    _persistTheme(state);
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});
