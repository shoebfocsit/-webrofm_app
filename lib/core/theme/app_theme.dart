import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color _primary = Color(0xFFae3115);
const Color _primaryContainer = Color(0xFFff6b4a);
const Color _secondary = Color(0xFF603ed3);
const Color _secondaryContainer = Color(0xFF795aee);
const Color _error = Color(0xFFba1a1a);
const Color _surfaceLight = Color(0xFFfbf8ff);
const Color _onSurface = Color(0xFF1a1b22);

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primary,
      primary: _primary,
      secondary: _secondary,
      error: _error,
      surface: _surfaceLight,
      onSurface: _onSurface,
      brightness: Brightness.light,
    );

    return _baseTheme(colorScheme).copyWith(
      scaffoldBackgroundColor: _surfaceLight,
      appBarTheme: _appBarTheme(colorScheme),
      cardTheme: _cardThemeData(colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      textButtonTheme: _textButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      bottomNavigationBarTheme: _bottomNavTheme(colorScheme),
      navigationBarTheme: _navBarTheme(colorScheme),
      bottomSheetTheme: _bottomSheetTheme(colorScheme),
      dialogTheme: _dialogThemeData(colorScheme),
      chipTheme: _chipTheme(colorScheme),
      dividerTheme: _dividerTheme(colorScheme),
      snackBarTheme: _snackBarTheme(colorScheme),
      floatingActionButtonTheme: _fabTheme(colorScheme),
      switchTheme: _switchTheme(colorScheme),
      checkboxTheme: _checkboxTheme(colorScheme),
      radioTheme: _radioTheme(colorScheme),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primary,
      primary: _primaryContainer,
      secondary: _secondaryContainer,
      error: _error,
      surface: const Color(0xFF0B1220),
      onSurface: const Color(0xFFE3E6EE),
      brightness: Brightness.dark,
    );

    return _baseTheme(colorScheme).copyWith(
      scaffoldBackgroundColor: const Color(0xFF0B1220),
      appBarTheme: _appBarTheme(colorScheme),
      cardTheme: _cardThemeDataDark(colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      textButtonTheme: _textButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationThemeDark(colorScheme),
      bottomNavigationBarTheme: _bottomNavThemeDark(colorScheme),
      navigationBarTheme: _navBarThemeDark(colorScheme),
      bottomSheetTheme: _bottomSheetThemeDark(colorScheme),
      dialogTheme: _dialogThemeData(colorScheme),
      chipTheme: _chipThemeDark(colorScheme),
      dividerTheme: _dividerThemeDark(colorScheme),
      snackBarTheme: _snackBarThemeDark(colorScheme),
      floatingActionButtonTheme: _fabTheme(colorScheme),
      switchTheme: _switchThemeDark(colorScheme),
      checkboxTheme: _checkboxTheme(colorScheme),
      radioTheme: _radioTheme(colorScheme),
    );
  }

  static ThemeData _baseTheme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: 'Outfit',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: _textTheme(),
      primaryTextTheme: _textTheme(),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: const CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  static TextTheme _textTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -0.5,
      ),
      displayMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -0.25,
      ),
      displaySmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.5,
      ),
      labelMedium: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 0.5,
      ),
    );
  }

  static AppBarTheme _appBarTheme(ColorScheme cs) {
    return AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: true,
      backgroundColor: cs.surface.withValues(alpha: 0.85),
      foregroundColor: cs.onSurface,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: cs.onSurface,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Outfit',
      ),
      iconTheme: IconThemeData(color: cs.onSurface, size: 24),
      actionsIconTheme: IconThemeData(color: cs.onSurface, size: 24),
    );
  }

  static CardThemeData _cardThemeData(ColorScheme cs) {
    return CardThemeData(
      elevation: 0,
      color: Colors.white.withValues(alpha: 0.72),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.45), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    );
  }

  static CardThemeData _cardThemeDataDark(ColorScheme cs) {
    return CardThemeData(
      elevation: 0,
      color: const Color(0xFF16202F),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: const Color(0xFF2A3546), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme cs) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        disabledBackgroundColor: cs.onSurface.withValues(alpha: 0.12),
        disabledForegroundColor: cs.onSurface.withValues(alpha: 0.38),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Outfit',
          letterSpacing: 0.5,
        ),
        shadowColor: cs.primary.withValues(alpha: 0.3),
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme cs) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: cs.primary,
        side: BorderSide(color: cs.primary, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Outfit',
        ),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(ColorScheme cs) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: cs.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Outfit',
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme cs) {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.72),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.45), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.45), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cs.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cs.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cs.error, width: 2),
      ),
      labelStyle: TextStyle(color: cs.onSurface.withValues(alpha: 0.6)),
      hintStyle: TextStyle(color: cs.onSurface.withValues(alpha: 0.4)),
      errorStyle: TextStyle(color: cs.error, fontSize: 12),
      prefixIconColor: cs.onSurface.withValues(alpha: 0.6),
      suffixIconColor: cs.onSurface.withValues(alpha: 0.6),
    );
  }

  static InputDecorationTheme _inputDecorationThemeDark(ColorScheme cs) {
    return InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF16202F),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: const Color(0xFF2A3546), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: const Color(0xFF2A3546), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cs.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cs.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: cs.error, width: 2),
      ),
      labelStyle: TextStyle(color: cs.onSurface.withValues(alpha: 0.6)),
      hintStyle: TextStyle(color: cs.onSurface.withValues(alpha: 0.4)),
      errorStyle: TextStyle(color: cs.error, fontSize: 12),
      prefixIconColor: cs.onSurface.withValues(alpha: 0.6),
      suffixIconColor: cs.onSurface.withValues(alpha: 0.6),
    );
  }

  static BottomNavigationBarThemeData _bottomNavTheme(ColorScheme cs) {
    return BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: cs.primary,
      unselectedItemColor: cs.onSurface.withValues(alpha: 0.5),
      selectedLabelStyle: const TextStyle(
        fontSize: 11, fontWeight: FontWeight.w600, fontFamily: 'Outfit',
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 11, fontWeight: FontWeight.w500, fontFamily: 'Outfit',
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  static BottomNavigationBarThemeData _bottomNavThemeDark(ColorScheme cs) {
    return BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: cs.primary,
      unselectedItemColor: cs.onSurface.withValues(alpha: 0.5),
      selectedLabelStyle: const TextStyle(
        fontSize: 11, fontWeight: FontWeight.w600, fontFamily: 'Outfit',
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 11, fontWeight: FontWeight.w500, fontFamily: 'Outfit',
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  static NavigationBarThemeData _navBarTheme(ColorScheme cs) {
    return NavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      indicatorColor: cs.primary.withValues(alpha: 0.15),
      surfaceTintColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontSize: 11, fontWeight: FontWeight.w600, fontFamily: 'Outfit',
            color: cs.primary,
          );
        }
        return TextStyle(
          fontSize: 11, fontWeight: FontWeight.w500, fontFamily: 'Outfit',
          color: cs.onSurface.withValues(alpha: 0.5),
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(size: 24, color: cs.primary);
        }
        return IconThemeData(size: 24, color: cs.onSurface.withValues(alpha: 0.5));
      }),
    );
  }

  static NavigationBarThemeData _navBarThemeDark(ColorScheme cs) {
    return NavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      indicatorColor: cs.primary.withValues(alpha: 0.2),
      surfaceTintColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontSize: 11, fontWeight: FontWeight.w600, fontFamily: 'Outfit',
            color: cs.primary,
          );
        }
        return TextStyle(
          fontSize: 11, fontWeight: FontWeight.w500, fontFamily: 'Outfit',
          color: cs.onSurface.withValues(alpha: 0.5),
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(size: 24, color: cs.primary);
        }
        return IconThemeData(size: 24, color: cs.onSurface.withValues(alpha: 0.5));
      }),
    );
  }

  static BottomSheetThemeData _bottomSheetTheme(ColorScheme cs) {
    return BottomSheetThemeData(
      elevation: 0,
      backgroundColor: Colors.white.withValues(alpha: 0.92),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      modalBackgroundColor: Colors.white.withValues(alpha: 0.92),
      modalElevation: 0,
      dragHandleColor: cs.onSurface.withValues(alpha: 0.3),
      dragHandleSize: const Size(40, 4),
    );
  }

  static BottomSheetThemeData _bottomSheetThemeDark(ColorScheme cs) {
    return BottomSheetThemeData(
      elevation: 0,
      backgroundColor: const Color(0xFF121B29),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      modalBackgroundColor: const Color(0xFF121B29),
      modalElevation: 0,
      dragHandleColor: cs.onSurface.withValues(alpha: 0.3),
      dragHandleSize: const Size(40, 4),
    );
  }

  static DialogThemeData _dialogThemeData(ColorScheme cs) {
    return DialogThemeData(
      elevation: 0,
      backgroundColor: cs.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  static ChipThemeData _chipTheme(ColorScheme cs) {
    return ChipThemeData(
      elevation: 0,
      backgroundColor: Colors.white.withValues(alpha: 0.72),
      selectedColor: cs.primary.withValues(alpha: 0.15),
      disabledColor: cs.onSurface.withValues(alpha: 0.08),
      labelStyle: TextStyle(color: cs.onSurface, fontSize: 13),
      secondaryLabelStyle: TextStyle(color: cs.onSurface, fontSize: 13),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.45), width: 1),
      ),
      iconTheme: IconThemeData(size: 18, color: cs.primary),
      checkmarkColor: cs.primary,
    );
  }

  static ChipThemeData _chipThemeDark(ColorScheme cs) {
    return ChipThemeData(
      elevation: 0,
      backgroundColor: const Color(0xFF16202F),
      selectedColor: cs.primary.withValues(alpha: 0.2),
      disabledColor: cs.onSurface.withValues(alpha: 0.08),
      labelStyle: TextStyle(color: cs.onSurface, fontSize: 13),
      secondaryLabelStyle: TextStyle(color: cs.onSurface, fontSize: 13),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: const Color(0xFF2A3546), width: 1),
      ),
      iconTheme: IconThemeData(size: 18, color: cs.primary),
      checkmarkColor: cs.primary,
    );
  }

  static DividerThemeData _dividerTheme(ColorScheme cs) {
    return DividerThemeData(
      color: cs.onSurface.withValues(alpha: 0.08),
      thickness: 1,
      space: 1,
    );
  }

  static DividerThemeData _dividerThemeDark(ColorScheme cs) {
    return DividerThemeData(
      color: cs.onSurface.withValues(alpha: 0.12),
      thickness: 1,
      space: 1,
    );
  }

  static SnackBarThemeData _snackBarTheme(ColorScheme cs) {
    return SnackBarThemeData(
      elevation: 0,
      backgroundColor: cs.inverseSurface,
      contentTextStyle: TextStyle(color: cs.onInverseSurface, fontSize: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
      actionTextColor: cs.primary,
    );
  }

  static SnackBarThemeData _snackBarThemeDark(ColorScheme cs) {
    return SnackBarThemeData(
      elevation: 0,
      backgroundColor: cs.inverseSurface,
      contentTextStyle: TextStyle(color: cs.onInverseSurface, fontSize: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
      actionTextColor: cs.primary,
    );
  }

  static FloatingActionButtonThemeData _fabTheme(ColorScheme cs) {
    return FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: cs.primary,
      foregroundColor: cs.onPrimary,
      shape: const CircleBorder(),
      smallSizeConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      largeSizeConstraints: const BoxConstraints(minWidth: 64, minHeight: 64),
    );
  }

  static SwitchThemeData _switchTheme(ColorScheme cs) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return cs.primary;
        return cs.onSurface.withValues(alpha: 0.5);
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return cs.primary.withValues(alpha: 0.5);
        }
        return cs.onSurface.withValues(alpha: 0.2);
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return cs.primary.withValues(alpha: 0.12);
        }
        return cs.onSurface.withValues(alpha: 0.08);
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    );
  }

  static SwitchThemeData _switchThemeDark(ColorScheme cs) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return cs.primary;
        return cs.onSurface.withValues(alpha: 0.5);
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return cs.primary.withValues(alpha: 0.5);
        }
        return cs.onSurface.withValues(alpha: 0.2);
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return cs.primary.withValues(alpha: 0.2);
        }
        return cs.onSurface.withValues(alpha: 0.08);
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    );
  }

  static CheckboxThemeData _checkboxTheme(ColorScheme cs) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return cs.primary;
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(cs.onPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(color: cs.onSurface.withValues(alpha: 0.5), width: 1.5),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return cs.primary.withValues(alpha: 0.12);
        }
        return cs.onSurface.withValues(alpha: 0.08);
      }),
    );
  }

  static RadioThemeData _radioTheme(ColorScheme cs) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return cs.primary;
        return cs.onSurface.withValues(alpha: 0.5);
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return cs.primary.withValues(alpha: 0.12);
        }
        return cs.onSurface.withValues(alpha: 0.08);
      }),
    );
  }
}
