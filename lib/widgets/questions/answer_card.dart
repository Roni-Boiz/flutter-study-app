import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/configs/themes/ui_parameters.dart';

enum AnswerStatus{
  correct,
  wrong,
  answered,
  notanswered,
}

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
            fontWeight: FontWeight.w500,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({Key? key, required this.answer}) : super(key: key);
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParaqmeters.cardBorderRadius,
        color: correctAnswerColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Text(
        answer,
        style: TextStyle(
          color: correctAnswerColor,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({Key? key, required this.answer}) : super(key: key);
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParaqmeters.cardBorderRadius,
        color: wrongAnswerColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Text(
        answer,
        style: const TextStyle(
            color: wrongAnswerColor,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class NotAnswer extends StatelessWidget {
  const NotAnswer({Key? key, required this.answer}) : super(key: key);
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParaqmeters.cardBorderRadius,
        color: notAnsweredColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Text(
        answer,
        style: const TextStyle(
            color: notAnsweredColor,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

