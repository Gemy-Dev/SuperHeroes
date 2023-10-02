import 'dart:math';

import 'package:flutter/material.dart';

class AnimationArc extends StatefulWidget {
  const AnimationArc(
      {super.key,
      this.activeColor,
      this.indecator,
      this.backgroundColor,
      this.value = 0});
  final Color? activeColor;
  final double value;
  final Indecator? indecator;
  final Color? backgroundColor;
  @override
  State<AnimationArc> createState() => _AnimationArcState();
}

class _AnimationArcState extends State<AnimationArc>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double?> _animation;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    final curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo);
    _animation = Tween<double>(begin: 0, end: widget.value / 100)
        .animate(curveAnimation);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: CustomPaint(
        painter: ArcPainter(
            activeColor: widget.activeColor ?? Colors.blue,
            indecator: widget.indecator ?? Indecator.line,
            angle: _animation.value!,
            backgroundColor: widget.backgroundColor ?? Colors.grey),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  const ArcPainter(
      {required this.angle,
      required this.indecator,
      required this.activeColor,
      required this.backgroundColor});
  final Color activeColor;
  final double angle;
  final Indecator indecator;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    const startAngle = -pi;
    double sweepAngle = angle * pi;
    bool useCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    if (indecator == Indecator.arc) {
      canvas.drawArc(
          rect, startAngle, pi, useCenter, paint..color = backgroundColor);
      canvas.drawArc(
          rect, startAngle, sweepAngle, useCenter, paint..color = activeColor);
    } else {
      canvas.drawLine(Offset(0, size.height / 2),
          Offset(size.width, size.height / 2), paint..color = backgroundColor);
      canvas.drawLine(
          Offset(0, size.height / 2),
          Offset(angle * size.width, size.height / 2),
          paint..color = activeColor);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

enum Indecator { arc, line }
