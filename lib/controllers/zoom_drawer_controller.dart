import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:logger/logger.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';


class MyZoomDrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn(){

  }

  void home(){

  }
  
  void website(){
    _launch("https://www.youtube.com");
  }

  void profile(){

  }

  void settings(){

  }

  void aboutus(){

  }

  void contactus(){
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'donrosa1234@gmail.com'
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if(!await launch(url)) {
      throw 'could not launch $url';
    }
  }

  void donateus(){

  }
}