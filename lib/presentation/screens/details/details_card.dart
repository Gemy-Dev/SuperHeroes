import 'package:flutter/material.dart';

import '../../../config/themes/app_colors.dart';
import '../../widgets/custom_container.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    this.color,
    required this.title,
    required this.child,
  });
  final Color? color;
  final String title;

  final List<Widget> child;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        color: color ?? AppColor.darkGrey.withOpacity(.3),
        margin: 20,
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            
            ...child
          ],
        ));
  }
}