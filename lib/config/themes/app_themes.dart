import 'package:flutter/material.dart';
import 'package:super_heros/config/themes/app_colors.dart';

abstract class AppTheme {
  ////////  here we defind the light them of our app  //////////////////
  static ThemeData get light => ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
            labelSmall: TextStyle(
                fontFamily: 'BebasNeue',
                fontSize: 17,
                color: AppColor.grey,
                height: null,
                overflow: TextOverflow.fade),
            titleMedium: TextStyle(
                fontFamily: 'BebasNeue',
                fontSize: 17,
                color: AppColor.grey,
                height: null,
                overflow: TextOverflow.fade),
            titleLarge: TextStyle(
                fontFamily: 'BebasNeue',
                fontSize: 30,
                color: AppColor.grey,
                letterSpacing: 2,
                overflow: TextOverflow.fade)),
        useMaterial3: true,
      );
}
