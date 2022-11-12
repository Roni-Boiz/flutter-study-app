import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/configs/themes/ui_parameters.dart';

class AnswerCard extends StatelessWidget {

  final String answer;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerCard({Key? key,
    required this.answer,
    this.isSelected = false,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParaqmeters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: UIParaqmeters.cardBorderRadius,
          color: isSelected?answerSelectedColor():Theme.of(context).cardColor,
          border: Border.all(
            color: isSelected?answerSelectedColor():answerBorderColor(),
          )
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected?onSurfaceTextColor:null,
          ),
        ),
      ),
    );
  }
}
