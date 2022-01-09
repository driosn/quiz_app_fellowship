import 'package:flutter/material.dart';
import 'package:quiz_app_fellowship/data/models/trivia.dart';
import 'package:quiz_app_fellowship/pages/trivia_play_page.dart';

class TriviaItem extends StatelessWidget {

  final Trivia trivia;

  TriviaItem({
    required this.trivia
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Are you sure to start this trivia?'
              ),
              actions: [
                TextButton(
                  child: const Text('No'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    Navigator.pop(context);
                    _goToPlay(context);
                  }
                )
              ],
            );
          }
        );
      },
      title: Text('Trivia: ${trivia.name}'),
      trailing: const Icon(Icons.chevron_right)
    );
  }

  void _goToPlay(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TriviaPlayPage(
          trivia: trivia
        )
      )
    );
  }
}