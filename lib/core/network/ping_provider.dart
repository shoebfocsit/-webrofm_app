import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PingState {
  final int? latencyMs;
  final bool isConnected;
  final bool hasCompletedFirstPing;

  const PingState({
    this.latencyMs,
    this.isConnected = false,
    this.hasCompletedFirstPing = false,
  });

  PingSeverity get severity {
    if (!isConnected) return PingSeverity.disconnected;
    if (latencyMs == null) return PingSeverity.unknown;
    if (latencyMs! < 150) return PingSeverity.good;
    if (latencyMs! < 300) return PingSeverity.fair;
    if (latencyMs! < 500) return PingSeverity.poor;
    return PingSeverity.bad;
  }
}

enum PingSeverity { good, fair, poor, bad, disconnected, unknown }

class PingNotifier extends Notifier<PingState> {
  Timer? _timer;
  HttpClient? _client;

  @override
  PingState build() {
    _client = HttpClient()
      ..connectionTimeout = const Duration(seconds: 5);
    ref.onDispose(() {
      _timer?.cancel();
      _client?.close(force: true);
    });
    _schedulePing();
    return const PingState();
  }

  void _schedulePing() {
    _timer = Timer(const Duration(seconds: 2), () {
      _ping();
      _timer = Timer.periodic(const Duration(seconds: 15), (_) => _ping());
    });
  }

  Future<void> _ping() async {
    try {
      final sw = Stopwatch()..start();
      final request = await _client!
          .headUrl(Uri.parse('https://webrofm.com/'))
          .timeout(const Duration(seconds: 6));
      final response = await request.close().timeout(const Duration(seconds: 4));
      await response.drain();
      sw.stop();
      state = PingState(
        latencyMs: sw.elapsedMilliseconds,
        isConnected: true,
        hasCompletedFirstPing: true,
      );
    } catch (_) {
      state = PingState(
        isConnected: false,
        hasCompletedFirstPing: state.hasCompletedFirstPing,
      );
    }
  }
}

final pingProvider = NotifierProvider<PingNotifier, PingState>(PingNotifier.new);
