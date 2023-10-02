import 'package:flutter/material.dart';

class Checker extends StatelessWidget {
  const Checker(
      {super.key, required this.check, required this.onSuccess, this.onFail});
  final bool check;
  final Widget onSuccess;
  final Widget? onFail;
  @override
  Widget build(BuildContext context) {
    if (check) {
      return onSuccess;
    }
    return onFail ?? const SizedBox();
  }
}
