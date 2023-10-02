import 'package:flutter/material.dart';
import 'package:super_heros/config/themes/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.radius = 20,
      required this.child,
      this.padding = 20,
      this.color,
      this.margin = 0,
      this.width,
      this.height});
  final double radius;
  final Widget child;
  final double padding;
  final Color? color;
  final double margin;
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(
        padding,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? AppColor.darkGrey.withOpacity(.3)),
      child: child,
    );
  }
}
