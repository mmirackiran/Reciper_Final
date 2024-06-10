// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SafeOnTap extends StatefulWidget {
  const SafeOnTap({
    super.key,
    required this.child,
    required this.onTap,
    this.intervalMs = 500,
  });
  final Widget child;
  final GestureTapCallback onTap;
  final int intervalMs;

  @override
  _SafeOnTapState createState() => _SafeOnTapState();
}

class _SafeOnTapState extends State<SafeOnTap> {
  int lastTimeClicked = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final now = DateTime.now().millisecondsSinceEpoch;
        if (now - lastTimeClicked < widget.intervalMs) {
          return;
        }
        lastTimeClicked = now;
        widget.onTap();
      },
      child: widget.child,
    );
  }
}
