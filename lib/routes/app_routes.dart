import 'package:project/Screens/home/home_screen.dart';
import 'package:project/Screens/login/login_page.dart';
import 'package:project/Screens/login/login_screen.dart';
import 'package:project/Screens/login/signup_page.dart';
import 'package:project/Screens/question/questions_screen.dart';
import 'package:project/Screens/splash/splash_screen.dart';
import 'package:project/controllers/question_paper/question_paper_controller.dart';
import 'package:project/controllers/question_paper/questions_controller.dart';
import 'package:project/controllers/zoom_drawer_controller.dart';

import '../Screens/Introduction/introduction.dart';
import 'package:get/get.dart';

class AppRoutes{
  static List<GetPage> routes()=>[
    GetPage(name: "/", page: () => SplashScreen()),
    GetPage(name: "/introduction", page: () => AppIntroductionScreen()),
    GetPage(name: "/home", page: () => HomeScreen(), binding: BindingsBuilder(() {
      Get.put(QuestionPaperController());
      Get.put(MyZoomDrawerController());
    })),
    GetPage(name: "/login", page: () => LoginScreen() ),
    GetPage(name: "/emailLogIn", page: () => LogInPage() ),
    GetPage(name: "/emailSignUp", page: () => SignUpPage() ),
    GetPage(name: "/questionsScreen", page: () => QuestionsScreen(), binding: BindingsBuilder(() {
      Get.put(QuestionsController());
    }) ),
    // GetPage(name: QuestionsScreen.routeName, page: () => QuestionsScreen() ),
  ];
}