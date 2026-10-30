import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.webrofm.app';

  /// Share main app link
  static Future<void> shareApp([String? customMessage]) async {
    final message = customMessage ?? 'Listen to incredible audio stories and episodes on WebroFM!';
    final text = '$message\n\nDownload now on Play Store: $playStoreUrl';
    await SharePlus.instance.share(ShareParams(text: text));
  }

  /// Share show link
  static Future<void> shareShow({required String title, String? showId}) async {
    final text = 'Check out "$title" on WebroFM!\n\nListen now on Play Store: $playStoreUrl';
    await SharePlus.instance.share(ShareParams(text: text));
  }

  /// Share episode link
  static Future<void> shareEpisode({required String title, String? showTitle, String? episodeId}) async {
    final showName = (showTitle != null && showTitle.isNotEmpty) ? ' from "$showTitle"' : '';
    final text = 'Listen to episode "$title"$showName on WebroFM!\n\nDownload app on Play Store: $playStoreUrl';
    await SharePlus.instance.share(ShareParams(text: text));
  }
}
