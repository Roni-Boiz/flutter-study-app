import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/controllers/question_paper/questions_controller.dart';
import 'package:get/get.dart';
import '../../firebase_ref/references.dart';

extension QuestionsControllerExtensions on QuestionsController{

  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions{
    return '$correctQuestionCount out of ${allQuestions.length} are correct';
  }

  String get points{
    var points = (correctQuestionCount/allQuestions.length)*100*
      (questionPaperModel.timeSeconds - remainSeconds)/questionPaperModel.timeSeconds*100;

    return points.toStringAsFixed(2);
  }


  Future<void> saveTestResults() async {
    var batch = firestore.batch();
    User? _user = Get.find<AuthController>().getUser();
    if(_user == null) return;
    batch.set(
        userRF.doc(_user.email).collection('myresent_tests').doc(questionPaperModel.id),
        {
          "points": points,
          "correct_answer": '$correctQuestionCount/${allQuestions.length}',
          "question_id": questionPaperModel.id,
          "time":questionPaperModel.timeSeconds - remainSeconds
        }
    );
    batch.commit();
    navigateToHome();
  }

}