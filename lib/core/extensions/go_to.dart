import 'package:flutter/material.dart';

extension GoTo on BuildContext {
  goTo(Widget screen) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
}
