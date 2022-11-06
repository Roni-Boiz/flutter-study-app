import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/controllers/question_paper/data_uploader.dart';
import 'package:get/get.dart';
import 'package:project/firebase_ref/loading_status.dart';

class DataUploaderScreen extends StatelessWidget {

  DataUploaderScreen({Key? key}) : super(key: key);
  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(controller.loadingStatus.value == LoadingStatus.completed ? "Uploading Completed"
        : "Uploading...")),
      ),
    );
  }
}
