import 'package:flutter/material.dart';
import 'package:project/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Image.asset("assets/images/app_splash_logo.png",
          width: 200,
          height: 200,
        )
      ),
    );
  }
}
