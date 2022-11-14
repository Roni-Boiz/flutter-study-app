import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/themes/custom_text_styles.dart';
import 'package:project/configs/themes/ui_parameters.dart';
import 'package:project/controllers/question_paper/question_paper_controller.dart';
import 'package:project/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:project/widgets/app_icon_text.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParaqmeters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: (){
          controller.navigateToQuestions(paper: model, tryAgain: false,);
        },
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: Get.width*0.15,
                        width: Get.width*0.15,
                        child: CachedNetworkImage(
                          imageUrl: model.imageUrl!,
                          placeholder : (context, url) => Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Image.asset("assets/images/app_splash_logo.png"),
                        ),
                        // child: FadeInImage(
                        //   image: NetworkImage(_questionPaperController.allPaperImages[index]),
                        //   placeholder: AssetImage("assets/images/app_splash_logo.png"),
                        // ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cardTitles(context) ,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(
                              model.description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                          ),
                        ),
                        Row(
                          children: [
                            AppIconText(
                                icon: Icon(Icons.help_outline_sharp,
                                  size: 24,
                                  color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor.withOpacity(0.8),
                                ),
                                text: Text('${model.questionCount} questions',
                                  style: detailText.copyWith(
                                      color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor.withOpacity(0.8)
                                  ),
                                )
                            ),
                            const SizedBox(width: 20,),
                            AppIconText(
                                icon: Icon(Icons.timer,
                                  size: 24,
                                  color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor.withOpacity(0.8),
                                ),
                                text: Text(model.timeInMinits(),
                                  style: detailText.copyWith(
                                      color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor.withOpacity(0.8)
                                  ),
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: -_padding,
                  right: -_padding,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Icon(Icons.star, size: 24,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(cardBorderRadius),
                            bottomRight: Radius.circular(cardBorderRadius),
                          ),
                          color: Theme.of(context).primaryColor
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
