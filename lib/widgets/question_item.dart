import 'package:flutter/material.dart';
import 'package:quiz_app_fellowship/data/models/trivia.dart';

class QuestionItem extends StatefulWidget {

  final Question question;
  final Function(String answer) onSelectedAnswer;

  QuestionItem({
    required this.question,
    required this.onSelectedAnswer
  });

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  String selectedAnswer = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.question.question,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        const SizedBox(height: 24),

        ...widget.question.possibleAnswers
          .map((answer) {
            return Container(
              margin: const EdgeInsets.only(
                bottom: 18
              ),
              child: _answerCheck(
                answer, selectedAnswer == answer
              ),
            );
          }).toList()
      ],
    );
  }

  Widget _answerCheck(String answer, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = answer;
          widget.onSelectedAnswer(answer);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 750),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 8
        ),
        decoration: BoxDecoration(
          color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.white,
          border: Border.all(
            color: Theme.of(context).primaryColor 
          )
        ),
        child: Center(
          child: Text(
            answer,
            style: TextStyle(
              color: isSelected
                      ? Colors.white
                      : Theme.of(context).primaryColor
            ),
          ),
        ),
      ),
    );
  }
}