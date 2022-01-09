class Trivia {

  final String name;
  final String category;
  List<Question> questions;

  Trivia({
    required this.name,
    required this.category,
    required this.questions
  });

  factory Trivia.fromMap(Map<String, dynamic> data) {
    return Trivia(
      name: data['name'], 
      category: data['category'], 
      questions: data['questions'].map<Question>((x) => Question.fromMap(x)).toList()
    );
  }

 }

class Question {

  final String question;
  final List<String> possibleAnswers;
  final String correctAnswer;

  Question({
    required this.question,
    required this.possibleAnswers,
    required this.correctAnswer
  });

  factory Question.fromMap(Map<String, dynamic> data) {
    return Question(
      question: data['question'],
      possibleAnswers: data['possibleAnswers'],
      correctAnswer: data['correctAnswer']
    );
  }
}