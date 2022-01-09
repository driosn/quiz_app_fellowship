import 'package:flutter/material.dart';
import 'package:quiz_app_fellowship/data/dummy_data.dart';
import 'package:quiz_app_fellowship/data/models/trivia.dart';
import 'package:quiz_app_fellowship/widgets/trivia_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz Fellowship App'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 18
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trivias',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: trivias.length,
                itemBuilder: (context, index) {
                  final triviaElement = trivias[index];
                  final trivia = Trivia.fromMap(triviaElement);
                  return TriviaItem(
                    trivia: trivia
                  );
                }
              ),
            ),
          ],
        ),
      )
    );
  }
}