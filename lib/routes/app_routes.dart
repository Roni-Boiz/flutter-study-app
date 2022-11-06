import 'package:project/Screens/home/home_screen.dart';
import 'package:project/Screens/splash/splash_screen.dart';
import 'package:project/controllers/question_paper/question_paper_controller.dart';

import '../Screens/Introduction/introduction.dart';
import 'package:get/get.dart';

class AppRoutes{
  static List<GetPage> routes()=>[
    GetPage(name: "/", page: () => SplashScreen()),
    GetPage(name: "/introduction", page: () => AppIntroductionScreen()),
    GetPage(name: "/home", page: () => HomeScreen(), binding: BindingsBuilder(() {Get.put(QuestionPaperController());})),
  ];
}