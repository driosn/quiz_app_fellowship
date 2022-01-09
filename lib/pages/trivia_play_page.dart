import 'package:flutter/material.dart';
import 'package:quiz_app_fellowship/data/models/trivia.dart';
import 'package:quiz_app_fellowship/pages/home_page.dart';
import 'package:quiz_app_fellowship/widgets/question_item.dart';

class TriviaPlayPage extends StatefulWidget {

  final Trivia trivia;

  TriviaPlayPage({
    required this.trivia
  });

  @override
  State<TriviaPlayPage> createState() => _TriviaPlayPageState();
}

class _TriviaPlayPageState extends State<TriviaPlayPage> {
  Map<String, String> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trivia: ${widget.trivia.name}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _finishTrivia
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 18
        ),
        child: ListView.builder(
          itemCount: widget.trivia.questions.length,
          itemBuilder: (context, index) {
            final question = widget.trivia.questions[index];
  
            return QuestionItem(
              question: question, 
              onSelectedAnswer: (answer) {
                setState(() {
                  selectedAnswers[question.question] = answer;
                }); 
              }
            );
          }
        ),
      )
    );
  }

  void _finishTrivia() {
    if (selectedAnswers.length == widget.trivia.questions.length) {
      _showTriviaResult();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text('You must answer all questions to finish trivia'),
            actions: [
              TextButton(
                child: const Text('Accept'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
      );
    }
  }

  void _showTriviaResult() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Trivia Result'),
          content: Container(
            height: 400,
            width: 400,
            child: ListView.builder(
              itemCount: widget.trivia.questions.length,
              itemBuilder: (context, index) {
                final question = widget.trivia.questions[index];
                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 24
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 10
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        question.question,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text('Your answer'),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: question.correctAnswer == selectedAnswers[question.question]
                                  ? Colors.green
                                  : Colors.red
                        ),
                        child: Text(
                          selectedAnswers[question.question]!,
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Correct answer is: ' + question.correctAnswer
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Go home'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(
                    builder: (_) => HomePage()
                  ), (route) => false
                );
              },
            )
          ],
        );
      }
    );
  }
}