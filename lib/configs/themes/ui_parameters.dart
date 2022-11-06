import 'package:flutter/material.dart';

class UIParaqmeters{
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}