import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/controllers/question_paper/question_paper_controller.dart';
import 'package:project/models/question_paper_model.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: Obx(() => ListView.separated(
        shrinkWrap: true,
          itemBuilder: (BuildContext context, int index ){
            return ClipRect(
              child: SizedBox(
                height: 200,
                width: 200,
                // child: CachedNetworkImage(
                //   imageUrl: _questionPaperController.allPapers[index].imageUrl!,
                //   placeholder : (context, url) => Container(
                //     alignment: Alignment.center,
                //     child: const CircularProgressIndicator(),
                //   ),
                //   errorWidget: (context, url, error) => Image.asset("assets/images/app_spalsh_logo.png"),
                // ),
                child: FadeInImage(
                  image: NetworkImage(_questionPaperController.allPaperImages[index]),
                  placeholder: AssetImage("assets/images/app_splash_logo.png"),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return const SizedBox(height: 20);
          },
          itemCount: _questionPaperController.allPaperImages.length
        )
      )
    );
  }
}
