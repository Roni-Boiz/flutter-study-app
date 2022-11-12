import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project/Screens/question/questions_screen.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/firebase_ref/references.dart';
import 'package:project/models/question_paper_model.dart';
import 'package:project/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {

  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady(){
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imageName = [
      "biology",
      "chemistry",
      "maths",
      "physics"
    ];
    try{
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);

      for( var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    }catch(e){
      print(e);
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain = false}){
    AuthController _authController = Get.find();
    if(_authController.isLoggedIn()){
      if(tryAgain){
        Get.back();
      }else{
        Get.toNamed(QuestionsScreen.routeName, arguments: paper);
      }
    }else{
      print('The title is ${paper.title}');
      _authController.showLoginAlertDialog();
    }
  }
}