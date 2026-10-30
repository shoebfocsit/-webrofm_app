import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class GuestTimerWidget extends StatefulWidget {
  final VoidCallback onTimeUp;
  final Widget child;
  final int initialRemaining;

  const GuestTimerWidget({
    super.key,
    required this.onTimeUp,
    required this.child,
    this.initialRemaining = 135,
  });

  @override
  State<GuestTimerWidget> createState() => _GuestTimerWidgetState();
}

class _GuestTimerWidgetState extends State<GuestTimerWidget> {
  late int _totalSeconds;
  late int _remaining;
  Timer? _timer;
  Offset _position = const Offset(20, 100);

  @override
  void initState() {
    super.initState();
    _totalSeconds = widget.initialRemaining;
    _remaining = widget.initialRemaining;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        _remaining--;
        if (_remaining <= 0) {
          _timer?.cancel();
          _timer = null;
          GetStorage().remove('guest_timer_end');
          widget.onTimeUp();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formatted {
    final m = (_remaining ~/ 60).toString().padLeft(2, '0');
    final s = (_remaining % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  double get _progress => _remaining / _totalSeconds;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned(
          left: _position.dx,
          top: _position.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _position += details.delta;
              });
            },
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.92),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: CircularProgressIndicator(
                      value: _progress,
                      strokeWidth: 3,
                      backgroundColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.08),
                      color: _remaining < 30
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    _formatted,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Outfit',
                      color: _remaining < 30
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
