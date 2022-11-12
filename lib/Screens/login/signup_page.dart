import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/controllers/auth_controller.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../widgets/common/main_button.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<AuthController> {

  static const String routeName = "/emailSignUp";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var displayNameController = TextEditingController();

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
                        // SizedBox(height: h*0.15),
                        // CircleAvatar(
                        //   backgroundColor: Colors.white12,
                        //   radius: 60,
                        //   backgroundImage: AssetImage(
                        //     "assets/images/app_splash_logo.png",
                        //   ),
                        // )
                        Image.asset("assets/images/app_splash_logo.png", width: 150, height: 150,),
                      ],
                    )
                ),

                Container(
                    margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                    width: w,
                    height: h*.375,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Study App",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppIcons.fontFam,
                            ),
                          ),
                          // Text(
                          //   "Create your account",
                          //   style: TextStyle(
                          //     fontSize: 25,
                          //     color: Colors.grey[500],
                          //     fontFamily: AppIcons.fontFam,
                          //   ),
                          // ),
                          SizedBox(height: 20,),
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
                              controller: displayNameController,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: AppIcons.fontFam,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Name',
                                prefixIcon: Icon(Icons.person, color: const Color(0xFF3ac3cb), size: 25,),
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
                              // onChanged: (email) {
                              //   emailController = email;
                              // },
                              controller: emailController,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: AppIcons.fontFam,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email, color: const Color(0xFF3ac3cb), size: 25,),
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
                              // onChanged: (password) {
                              //   passwordController = password;
                              // },
                              controller: passwordController,
                              obscureText: true,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: AppIcons.fontFam,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.visibility_off, color: const Color(0xFF3ac3cb), size: 25,),
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
                        ],
                      ),
                    )
                ),
                GestureDetector(
                  onTap: (){
                    controller.register(emailController.text.trim(), passwordController.text.trim(), displayNameController.text.trim());
                  },
                  child: Container(
                    width: w*0.4,
                    height: h*0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: mainGradient(),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 28,
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
                    text: "-----  Sign up using following methods  -----",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 17,
                    )
                )),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.alphaBlend(const Color(0xFF3ac3cb), const Color(0xFFf85187)),
                        width: 2
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 16),
                  child: MainButton(
                    onTap: () {
                      controller.signInWithGoogle();
                    },
                    color: Colors.grey[300],
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
                            "Sign up with Google",
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
                ),
                RichText(text: TextSpan(
                    text: "Have an account?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                          text: " Login",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()..onTap=() => Get.offAndToNamed("/emailLogIn")
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
