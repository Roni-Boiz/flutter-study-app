import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/Screens/Introduction/introduction.dart';
import 'package:project/Screens/splash/splash_screen.dart';
import 'package:project/bindings/initial_bindings.dart';
import 'package:project/configs/themes/app_dark_theme.dart';
import 'package:project/configs/themes/app_light_theme.dart';
import 'package:project/controllers/theme_controller.dart';
import 'package:project/data_uploader_screen.dart';
import 'package:project/firebase_options.dart';
import 'package:get/get.dart';
import 'package:project/routes/app_routes.dart';

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitailBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   // await Firebase.initializeApp();
//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }
