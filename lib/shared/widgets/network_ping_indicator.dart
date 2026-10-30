import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webrofm/core/network/ping_provider.dart';
import 'package:webrofm/core/utils/extensions.dart';

class NetworkPingIndicator extends ConsumerStatefulWidget {
  const NetworkPingIndicator({super.key});

  @override
  ConsumerState<NetworkPingIndicator> createState() => _NetworkPingIndicatorState();
}

class _NetworkPingIndicatorState extends ConsumerState<NetworkPingIndicator> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(pingProvider, _onPingChange);
  }

  void _onPingChange(PingState? prev, PingState next) {
    if ((prev?.isConnected ?? false) && !next.isConnected) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _showOfflineSnackbar(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ping = ref.watch(pingProvider);
    final bgColor = Colors.white.withValues(alpha: 0.5);
    final borderColor = Colors.white.withValues(alpha: 0.45);
    const purple = Color(0xFF7B2FF7);

    if (!ping.isConnected && ping.hasCompletedFirstPing) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Offline Mode',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: purple,
                height: 1.2,
              ),
            ),
            Text(
              'Download Mode',
              style: TextStyle(
                fontSize: 7,
                fontWeight: FontWeight.w500,
                color: purple.withValues(alpha: 0.8),
                height: 1.2,
              ),
            ),
          ],
        ),
      );
    }

    final color = _pingColor(ping.severity);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.6),
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '${ping.latencyMs}ms',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.onSurface,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  void _showOfflineSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wifi_off_rounded, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Offline Mode On\nStart exploring download content',
                style: TextStyle(fontSize: 13, height: 1.3),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 6),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        backgroundColor: const Color(0xFF7B2FF7),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }

  Color _pingColor(PingSeverity severity) {
    return switch (severity) {
      PingSeverity.good => Colors.green,
      PingSeverity.fair => Colors.lime,
      PingSeverity.poor => Colors.orange,
      PingSeverity.bad => Colors.redAccent,
      PingSeverity.disconnected => Colors.red,
      PingSeverity.unknown => Colors.grey,
    };
  }
}
