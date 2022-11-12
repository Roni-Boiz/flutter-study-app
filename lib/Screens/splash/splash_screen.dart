import 'package:flutter/material.dart';
import 'package:project/configs/themes/app_colors.dart';

import '../../configs/themes/app_icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          children: [
            Spacer(),
            Image.asset("assets/images/app_splash_logo.png",
              width: 200,
              height: 200,
            ),
            SizedBox(height: 40,),
            Text(
              "Study App",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: AppIcons.fontFam,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
