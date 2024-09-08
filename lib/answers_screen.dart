import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_summary.dart';

class AnswersScreen extends StatelessWidget {
  const AnswersScreen(
      {super.key, required this.chosenAnswers, required this.switchScreen});

  final List<String> chosenAnswers;
  final void Function(String) switchScreen;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'currentIndex': i,
        'currentQuestion': questions[i].question,
        'correctAnswer': questions[i].answers[0],
        'chosenAnswer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final numQuestions = questions.length;
    final correctAnswers = summaryData.where((data) => data['correctAnswer'] == data['chosenAnswer']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $numQuestions Questions correct',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
                dataSummary: summaryData), //Soll die Daten anzeigen
            const SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
              onPressed: () {
                switchScreen('Questionsscreen');
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: Text(
                'Restart Quiz!',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Alternative zum Button aus Kurs:
TextButton.icon(
  onPressed: onRestart,
  style: TextButton.styleFrom(
    foregroundColor: Colors.white,
  ),
  icon: const Icon(Icons.refresh),
  label: const Text('Restart Quiz!'),
)
*/
