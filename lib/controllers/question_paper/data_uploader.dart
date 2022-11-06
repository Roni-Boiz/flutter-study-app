import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project/firebase_ref/loading_status.dart';
import 'package:project/firebase_ref/references.dart';
import 'package:project/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUploader extends GetxController{
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {

    loadingStatus.value = LoadingStatus.loading; // -> 0
    final fireStore = FirebaseFirestore.instance;
    final manifestContnet = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContnet);
    final paperAssets = manifestMap.keys
        .where((path) =>
    path.startsWith("assets/DB/papers") && path.contains(".json")).toList();
    List<QuestionPaperModel> questionPapers = [];
    for(var paper in paperAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }

    var batch = fireStore.batch();
    for( var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title":paper.title,
        "image_url":paper.imageUrl,
        "description":paper.description,
        "time_seconds":paper.timeSeconds,
        "questions_count": paper.questions==null ? 0 : paper.questions!.length
      });

      for( var questions in paper.questions!) {
        final questionPath = questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question" : questions.question,
          "correct_answer" : questions.correctAnswer
        });

        for (var answer in questions.answers ) {
          batch.set(questionPath.collection("answers").doc(answer.identifier), {
            "identifier": answer.identifier,
            "answer": answer.answer
          });
        }
      }
    }

    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }

}