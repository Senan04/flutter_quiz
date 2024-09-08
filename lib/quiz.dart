import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/start_screen.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/answers_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  void switchScreen(String screen) {
    setState(() {
      if (screen == 'Questionsscreen') {
        selectedAnswers = [];
        activeScreen = QuestionsScreen(addAnswer: addAnswer);
      } else if (screen == 'Endscreen') {
        activeScreen = AnswersScreen(
          chosenAnswers: selectedAnswers,
          switchScreen: switchScreen,
        );
      }
    });
  }

  List<String> selectedAnswers = [];

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      switchScreen('Endscreen');
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: activeScreen,
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme().apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        ),
      ),
    );
  }
}