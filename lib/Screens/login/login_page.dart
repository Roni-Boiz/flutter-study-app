import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/configs/themes/app_icons.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../widgets/curve_painter.dart';

class LogInPage extends GetView<AuthController> {
  const LogInPage({Key? key}) : super(key: key);

  static const String routeName = "/emailLogIn";

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      width: w,
                      height: h*0.3,
                      decoration: BoxDecoration(
                        gradient: mainGradient(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/app_splash_logo.png", width: 150, height: 150,),
                        ],
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                    width: w,
                    height: h*.47,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Study App",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppIcons.fontFam,
                            ),
                          ),
                          Text(
                            "Sign into your account",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey[500],
                              fontFamily: AppIcons.fontFam,
                            ),
                          ),
                          SizedBox(height: 50,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: Offset(1, 1),
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ]
                            ),
                            child: TextField(
                              controller: emailController,
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: AppIcons.fontFam,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email, color: const Color(0xFF3ac3cb), size: 30,),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0
                                    )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: Offset(1, 1),
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ]
                            ),
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: AppIcons.fontFam,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.visibility_off, color: const Color(0xFF3ac3cb), size: 30,),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0
                                    )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(child: Container(),),
                              Text(
                                "Forget your Password?",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[500],
                                  fontFamily: AppIcons.fontFam,
                                ),
                              ),
                            ],
                          ),


                        ],
                      ),
                    )
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.login(emailController.text.trim(), passwordController.text.trim());
                    },
                    child: Container(
                      width: w*0.4,
                      height: h*0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: mainGradient(),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppIcons.fontFam,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(text: TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: " Create",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        recognizer: TapGestureRecognizer()..onTap=() => Get.offAndToNamed("/emailSignUp")
                      )
                    ]
                  ))
                ],
              ),
            ),
        ),
    );
  }
}

