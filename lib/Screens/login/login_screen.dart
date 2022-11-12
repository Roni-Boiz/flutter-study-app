import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/widgets/common/main_button.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
            gradient: mainGradient()
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset("assets/images/app_splash_logo.png", width: 200, height: 200,),
            Spacer(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hey There,\nWelcome Back',
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 10,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login to your account to continue',
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontSize: 20,
                ),
              ),
            ),
            Spacer(),
            MainButton(
              onTap: () {
                controller.navigateToEmailSignInPage();
              },
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: -280,
                      child: SvgPicture.asset("assets/icons/mail-ios.svg")
                  ),
                  Center(
                    child: Text(
                      "Sign in with Email",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Theme.of(context).primaryColor,
            //     onPrimary: onSurfaceTextColor,
            //     minimumSize: Size(double.infinity, 55),
            //   ),
            //   onPressed: () {},
            //   child: Stack(
            //     children: [
            //       Positioned(
            //           top: 0,
            //           bottom: 0,
            //           left: -10,
            //           child: SvgPicture.asset("assets/icons/email.svg", height: 40, width: 40,)
            //       ),
            //       Center(
            //         child: Text(
            //           "Sign in with Email",
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 40,),
            MainButton(
              onTap: () {
                controller.signInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: SvgPicture.asset("assets/icons/google.svg")
                  ),
                  Center(
                    child: Text(
                      "Sign in with Google",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            RichText(
                text: const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    color: onSurfaceTextColor,
                    fontSize: 15
                  ),
                  children: [
                    TextSpan(
                      text: ' Log in',
                      style: TextStyle(
                        color: onSurfaceTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
            ),
            Spacer(),
          ],
        )
      ),
    );
  }
}
