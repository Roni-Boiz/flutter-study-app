import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dialogs{
  static final Dialogs _singleton = Dialogs._internal();
  
  Dialogs._internal();
  
  factory Dialogs(){
    return _singleton;
  }
  
  static Widget questionStartDialogue({required VoidCallback onTap}){
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Please login...",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 5,),
          Text(
              "You have to login to your account to get full access to all the resorces and servicess",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10,),
          Image.asset("assets/images/app_splash_logo.png",
            width: 50,
            height: 50,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: onTap,
            child: Text("Continue to Login",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),))
      ],
    );
  }
}