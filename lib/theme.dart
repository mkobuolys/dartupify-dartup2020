import 'package:flutter/material.dart';

import 'package:dartupify/constants.dart';

final BottomNavigationBarThemeData _bottomNavigationBarTheme =
    BottomNavigationBarThemeData(
  backgroundColor: kLightBackgroundColor,
  elevation: 4.0,
  selectedIconTheme: IconThemeData(size: 20.0),
  selectedItemColor: kBlackColor,
  unselectedIconTheme: IconThemeData(size: 20.0),
  unselectedItemColor: kBlackColor.withOpacity(0.45),
);

final ThemeData theme = ThemeData(
  accentColor: kBlackColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  backgroundColor: kLightBackgroundColor,
  scaffoldBackgroundColor: kLightBackgroundColor,
  bottomNavigationBarTheme: _bottomNavigationBarTheme,
  typography: Typography.material2018(),
);
