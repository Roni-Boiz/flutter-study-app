import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/themes/app_dark_theme.dart';
import 'package:project/configs/themes/ui_parameters.dart';
import 'app_light_theme.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryLightColorLight,
      primaryColorLight,
    ]
);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryDarkColorDark,
      primaryColorDark,
    ]
);

LinearGradient mainGradient(BuildContext context) =>
  UIParaqmeters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
