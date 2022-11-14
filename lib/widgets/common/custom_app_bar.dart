import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Screens/question/test_overview_screen.dart';
import 'package:project/configs/themes/app_icons.dart';
import 'package:project/configs/themes/custom_text_styles.dart';
import 'package:project/configs/themes/ui_parameters.dart';
import 'package:project/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key,
    this.title = '',
    this.showActionIcon = false,
    this.leading,
    this.titleWidget,
    this.onMenuActionTap
  }) : super(key: key);

  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mobileScreenPadding, vertical: mobileScreenPadding),
          child: Stack(
            children: [
              Positioned.fill(
                  child: titleWidget==null?Center(
                    child: Text(
                      title,
                      style: appBarTS,
                    )
                  ):Center(child: titleWidget),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading??Transform.translate(offset: const Offset(-14, 0),
                  child: const BackButton(),
                  ),
                  if(showActionIcon)
                    Transform.translate(offset: const Offset(0, 0),
                      child: AppCircleButton(
                        onTap: onMenuActionTap??() => Get.toNamed(TestOverviewScreen.routeName),
                        child: const Icon(Icons.dashboard_sharp, size: 20, semanticLabel: "Menu"),
                      ),
                    )
                ],
              )
            ],
          ),
        )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(
    double.maxFinite,
    80
  );
}
