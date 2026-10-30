import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webrofm/core/constants/asset_paths.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get mediaSize => mediaQuery.size;
  double get mediaWidth => mediaSize.width;
  double get mediaHeight => mediaSize.height;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  bool get isKeyboardVisible => mediaQuery.viewInsets.bottom > 0;
  double get textScaleFactor => mediaQuery.textScaleFactor;
  NavigatorState get navigator => Navigator.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  String get appLogoPath =>
      theme.brightness == Brightness.dark ? AssetPaths.appLogoDark : AssetPaths.appLogoLight;

  bool get isSmallScreen => mediaWidth < 360;
  bool get isMediumScreen => mediaWidth >= 360 && mediaWidth < 600;
  bool get isLargeScreen => mediaWidth >= 600;

  double responsiveWidth(double value) => mediaWidth * (value / 375);
  double responsiveHeight(double value) => mediaHeight * (value / 812);
  double responsiveFont(double size) => size * (mediaWidth / 375).clamp(0.8, 1.3);

  bool get isDark => theme.brightness == Brightness.dark;

  Color surfaceWhite({double opacity = 0.72}) {
    if (!isDark) return Colors.white.withValues(alpha: opacity);
    return const Color(0xFFB0B8C4).withValues(alpha: 0.10);
  }

  Color glassBorder({double opacity = 0.45}) {
    if (!isDark) return Colors.white.withValues(alpha: opacity);
    return Colors.white.withValues(alpha: 0.12);
  }

  void showSnackBar(String message, {bool isError = false, Duration? duration}) {
    scaffoldMessenger.hideCurrentSnackBar();
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colorScheme.error : null,
        duration: duration ?? const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void unFocus() => focusScope.unfocus();
}

extension StringX on String {
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get capitalizeAllWords => split(' ').map((w) => w.capitalize).join(' ');

  String get titleCase => replaceAll(RegExp(r'[_\-]'), ' ').capitalizeAllWords;

  String get initials {
    if (isEmpty) return '';
    final parts = trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return this[0].toUpperCase();
  }

  String? get nullIfEmpty => isEmpty ? null : this;

  bool get isValidEmail => RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(this);

  bool get isValidPhone => length >= 10 && length <= 15;

  bool get isValidOtp => length == 6 && RegExp(r'^\d{6}$').hasMatch(this);

  String get formatPhone {
    final cleaned = replaceAll(RegExp(r'[^\d]'), '');
    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    }
    if (cleaned.length == 11) {
      return '${cleaned[0]} (${cleaned.substring(1, 4)}) ${cleaned.substring(4, 7)}-${cleaned.substring(7)}';
    }
    return this;
  }

  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }

  String maskEmail() {
    final atIndex = indexOf('@');
    if (atIndex <= 1) return this;
    return '${this[0]}${'*' * (atIndex - 2)}${substring(atIndex - 1)}';
  }

  String maskPhone() {
    if (length < 6) return this;
    return '${substring(0, 2)}${'*' * (length - 4)}${substring(length - 2)}';
  }
}

extension DateTimeX on DateTime {
  String get formatted => DateFormat('MMM dd, yyyy').format(this);
  String get formattedFull => DateFormat('EEEE, MMM dd, yyyy').format(this);
  String get formattedTime => DateFormat('hh:mm a').format(this);
  String get formattedApi => DateFormat('yyyy-MM-dd').format(this);
  String get formattedDateTime => DateFormat('MMM dd, yyyy - hh:mm a').format(this);

  String get relativeTime {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.isNegative) {
      final future = diff.abs();
      if (future.inMinutes < 60) return 'in ${future.inMinutes}m';
      if (future.inHours < 24) return 'in ${future.inHours}h';
      return 'in ${future.inDays}d';
    }

    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()}w ago';
    if (diff.inDays < 365) return '${(diff.inDays / 30).floor()}mo ago';
    return '${(diff.inDays / 365).floor()}y ago';
  }

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  bool get isThisWeek {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    return isAfter(weekStart.subtract(const Duration(days: 1)));
  }

  bool get isThisYear => year == DateTime.now().year;
}

extension NumX on num {
  double get w => this * 0.00267;
  double get h => this * 0.00123;

  String get formatDuration {
    final totalSeconds = round();
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours}h ${minutes.toString().padLeft(2, '0')}m';
    }
    return '${minutes}m ${seconds.toString().padLeft(2, '0')}s';
  }

  String get formatTime {
    final totalSeconds = round();
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }

  String get formatViews {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    }
    if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    }
    return toString();
  }

  String get formatFileSize {
    if (this >= 1073741824) {
      return '${(this / 1073741824).toStringAsFixed(1)} GB';
    }
    if (this >= 1048576) {
      return '${(this / 1048576).toStringAsFixed(1)} MB';
    }
    if (this >= 1024) {
      return '${(this / 1024).toStringAsFixed(1)} KB';
    }
    return '${this} B';
  }
}

extension EdgeInsetsX on EdgeInsets {
  EdgeInsets get horizontalOnly => EdgeInsets.symmetric(horizontal: horizontal);
  EdgeInsets get verticalOnly => EdgeInsets.symmetric(vertical: vertical);
  EdgeInsets get removeBottom => copyWith(bottom: 0);
  EdgeInsets get removeTop => copyWith(top: 0);
  EdgeInsets get removeLeft => copyWith(left: 0);
  EdgeInsets get removeRight => copyWith(right: 0);
}

extension IterableX<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  T? get lastOrNull => isEmpty ? null : last;

  List<T> separated(T separator) {
    if (isEmpty) return [];
    final result = <T>[];
    for (var i = 0; i < length; i++) {
      if (i > 0) result.add(separator);
      result.add(elementAt(i));
    }
    return result;
  }

  List<List<T>> chunked(int size) {
    final result = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      result.add(skip(i).take(size).toList());
    }
    return result;
  }
}

extension WidgetListX on List<Widget> {
  List<Widget> separated(Widget separator) {
    final result = <Widget>[];
    for (var i = 0; i < length; i++) {
      if (i > 0) result.add(separator);
      result.add(this[i]);
    }
    return result;
  }
}
