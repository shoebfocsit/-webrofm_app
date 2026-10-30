import 'package:flutter/foundation.dart';

class AnalyticsService {
  /// Initialize analytics
  static Future<void> init() async {
    debugPrint('AnalyticsService initialized successfully.');
  }

  /// Log standard event: Completed Registration
  static Future<void> logCompletedRegistration({String? registrationMethod}) async {
    debugPrint('Analytics logCompletedRegistration: $registrationMethod');
  }

  /// Log standard event: View Content (e.g. Show or Episode detail view)
  static Future<void> logViewContent({
    required String id,
    required String type,
    String? title,
  }) async {
    debugPrint('Analytics logViewContent: $id ($type) $title');
  }

  /// Log custom event: Episode Played
  static Future<void> logEpisodePlayed({
    required String episodeId,
    required String showId,
    required String episodeTitle,
  }) async {
    debugPrint('Analytics logEpisodePlayed: $episodeId / $showId / $episodeTitle');
  }

  /// Log standard event: Purchase or Subscription
  static Future<void> logPurchase({
    required double amount,
    required String currency,
    Map<String, dynamic>? parameters,
  }) async {
    debugPrint('Analytics logPurchase: $amount $currency $parameters');
  }

  /// Log custom event
  static Future<void> logCustomEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    debugPrint('Analytics logCustomEvent: $name $parameters');
  }
}
