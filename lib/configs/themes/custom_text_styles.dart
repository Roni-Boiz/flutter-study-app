import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';

TextStyle cardTitles(context) => TextStyle(
  color: UIParaqmeters.isDarkMode()?Theme.of(context).textTheme.bodyText1!.color
      :Theme.of(context).primaryColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const questionText = TextStyle(fontSize: 20, fontWeight: FontWeight.w800);
const detailText = TextStyle(fontSize: 15,);
const headerText = TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: onSurfaceTextColor);

const appBarTS = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: onSurfaceTextColor);

TextStyle coutdownTimerTs() => TextStyle(
  letterSpacing: 2,
  color: UIParaqmeters.isDarkMode()?Theme.of(Get.context!).textTheme.bodyText1!.color
      : Theme.of(Get.context!).primaryColor
);