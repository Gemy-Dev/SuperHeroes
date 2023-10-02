import 'package:flutter/material.dart';

class TextHero extends StatelessWidget {
  const TextHero({super.key, required this.tag, required this.child});

  final Object tag;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: child,
        ));
  }
}
