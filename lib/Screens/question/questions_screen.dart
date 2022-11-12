import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/configs/themes/custom_text_styles.dart';
import 'package:project/configs/themes/ui_parameters.dart';
import 'package:project/controllers/question_paper/questions_controller.dart';
import 'package:project/firebase_ref/loading_status.dart';
import 'package:project/widgets/common/background_decoration.dart';
import 'package:get/get.dart';
import 'package:project/widgets/common/custom_app_bar.dart';
import 'package:project/widgets/common/main_button.dart';
import 'package:project/widgets/common/questions_place_holder.dart';
import 'package:project/widgets/content_area.dart';
import 'package:project/widgets/questions/answer_card.dart';
import 'package:project/widgets/questions/countdown_timer.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);
  static const String routeName = "/questionsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const ShapeDecoration(
              shape: StadiumBorder(
                  side: BorderSide(color: onSurfaceTextColor, width: 2)
              ),
          ),
          child: Obx(() => CountdownTimer(
              time: controller.time.value,
              color: onSurfaceTextColor,
          ),
          )
        ),
        showActionIcon: true,
        titleWidget: Obx(
            () => Text(
              'Q. ${(controller.questionIndex.value+1).toString().padLeft(2, '0')}',
              style: appBarTS,
            )
        ),

      ),
      body: BackgroundDecoration(
        child: Obx(
            () => Column(
              children: [
                if(controller.loadingStatus.value == LoadingStatus.loading)
                  const Expanded(child: ContentArea(child: QuestionScreenHolder())),
                if(controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(child: ContentArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Text(
                          controller.currentQuestion.value!.question,
                          style: questionText,
                        ),
                        GetBuilder<QuestionsController>(
                            id: 'answers_list',
                            builder: (context) {
                          return ListView.separated(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(top: 25),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final answer = controller.currentQuestion.value!.answers[index];
                                return AnswerCard(answer: '${answer.identifier}.  ${answer.answer}', onTap: () {
                                  controller.selectedAnswer(answer.identifier);
                                },
                                isSelected: answer.identifier == controller.currentQuestion.value!.selectedAnswer,
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
                              itemCount: controller.currentQuestion.value!.answers.length
                          );
                        }),

                      ],
                    ),
                  ),
                ),
                ),
                ColoredBox(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: UIParaqmeters.mobileScreenPadding,
                    child: Row(
                      children: [
                        Visibility(
                          visible: controller.isFirstQuestion,
                          child: SizedBox(
                            width: 55,
                            height: 55,
                            child: MainButton(
                              onTap: () {
                                controller.prevQuestion();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Get.isDarkMode?onSurfaceTextColor:Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Visibility(
                              visible: controller.loadingStatus.value == LoadingStatus.completed,
                              child: MainButton(
                              onTap: () {
                                controller.isLastQuestion?Container():
                                controller.nextQuestion();
                              },
                              title: controller.isLastQuestion?'Completed':'Next',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
