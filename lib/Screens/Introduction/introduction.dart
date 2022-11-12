import 'package:flutter/material.dart';
import 'package:project/Screens/home/home_screen.dart';
import 'package:project/widgets/app_circle_button.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width*0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.safety_check, size: 100, color: Colors.amber),
              SizedBox(height: 40,),
              const Text(
                  'This is a study app for students and teachers. You can learn lessons, attept quizes, read books, send papers to studedts, share tutes with friends, and request for help',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: onSurfaceTextColor,
                    fontWeight: FontWeight.bold
                  ),
              ),
              SizedBox(height: 40,),
              AppCircleButton(
                  onTap: () => Get.offAndToNamed("/home"),  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()))
                  child: const Icon(Icons.arrow_forward, size: 36,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
