import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:project/Screens/home/home_screen.dart';
import 'package:project/Screens/login/login_page.dart';
import 'package:project/Screens/login/login_screen.dart';
import 'package:project/Screens/login/signup_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../firebase_ref/references.dart';
import '../widgets/dialogs/dialogue_widget.dart';

class AuthController extends  GetxController {
  @override
  void onReady(){
    initAuth();
    super.onReady();
  }

  var AppLogger = Logger();

  late FirebaseAuth _auth;
  final _user = Rxn<User>(); // eamil password name profilepic
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  signInWithGoogle() async{
    final GoogleSignIn _googleSignIn= GoogleSignIn();
    try{
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if(account != null) {
        final _authAccount = await account.authentication;
        final _credentials = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );

        await _auth.signInWithCredential(_credentials);
        await saveUser(account);
        navigateToHomePage();
      }
    }on Exception catch(error){
      print(error);
    }
  }

  User? getUser(){
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account){
    userRF.doc(account.email).set({
      "email":account.email,
      "name":account.displayName,
      "prfilepic":account.photoUrl
    });
  }

  void register(String email, String password, String displayName) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await userRF.doc(email).set({
        "email":email,
        "name":displayName,
        "prfilepic":"https://picsum.photos/100",
      });
      _auth.currentUser!.updateDisplayName(displayName);
      navigateToHomePage();
    }on Exception catch(error){
      Get.snackbar("About User", "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        messageText: Text(
          error.toString(),
          style: TextStyle(
            color: Colors.white
          ),
        )
      );
    }

  }

  void login(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      navigateToHomePage();
    }on Exception catch(error){
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            "Login failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
            error.toString(),
            style: TextStyle(
                color: Colors.white
            ),
          )
      );
    }

  }

  Future<void> signOut() async{
    AppLogger.d("Sign out");
    try{
      await _auth.signOut();
      navigateToHomePage();
    } on FirebaseAuthException catch(e) {
      AppLogger.e(e);
    }
  }

  void navigateToIntroduction(){
    Get.offAllNamed("/introduction");
  }

  navigateToHomePage(){
    Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialog(){
    Get.dialog(Dialogs.questionStartDialogue(onTap: (){
      Get.back();
      navigateToLoginPage();
      // Login Page
    }),
    barrierDismissible: false
    );
  }

  void navigateToLoginPage(){
    Get.toNamed(LoginScreen.routeName);
  }

  void navigateToEmailSignInPage(){
    Get.toNamed(LogInPage.routeName);
  }

  bool isLoggedIn(){
    return _auth.currentUser != null;
  }
}