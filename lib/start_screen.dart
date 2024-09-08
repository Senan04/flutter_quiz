import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function(String) switchScreen;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(211, 255, 255, 255),
        ),
        Padding(
          padding: const EdgeInsets.all(45.0),
          child: Text(
            'Learn Flutter the fun way!',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: MediaQuery.of(context).size.width * 0.07),
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            switchScreen('Questionsscreen');
          },
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          label: Text(
            'Start Quiz',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
