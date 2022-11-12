import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:project/Screens/home/menu_screen.dart';
import 'package:project/Screens/home/question_card.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/configs/themes/custom_text_styles.dart';
import 'package:project/configs/themes/ui_parameters.dart';
import 'package:project/controllers/question_paper/question_paper_controller.dart';
import 'package:get/get.dart';
import 'package:project/widgets/app_circle_button.dart';
import 'package:project/widgets/content_area.dart';

import '../../controllers/zoom_drawer_controller.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_){
        return  ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.Style1,
          backgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width*0.7,
          openCurve: Curves.easeInOut,
          closeCurve: Curves.bounceIn,
          menuScreen: MenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          child: const Icon(Icons.menu, ),
                          onTap: controller.toogleDrawer,
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.account_circle, size: 24,),
                              Text(
                                "  Hello friend",
                                style: detailText.copyWith(
                                    color: onSurfaceTextColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "What do you want to learn today?",
                          style: headerText.copyWith(
                              color: onSurfaceTextColor
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        child: Obx(() => ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index ){
                              return QuestionCard(
                                model: _questionPaperController.allPapers[index],
                              );
                            },
                            separatorBuilder: (BuildContext context, int index){
                              return const SizedBox(height: 20);
                            },
                            itemCount: _questionPaperController.allPapers.length
                        )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },),
    );
  }
}
