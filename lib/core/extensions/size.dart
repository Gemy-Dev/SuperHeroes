import 'package:flutter/material.dart';

extension UpdateSize on num {
  double get w =>
      MediaQuery.of(SharedContext.key!.currentState!.context).size.width *
      this /
      100;
  double get h =>
      MediaQuery.of(SharedContext.key!.currentState!.context).size.height *
      this /
      100;
}

class SharedContext {
  static GlobalKey<NavigatorState>? key = GlobalKey();
}
