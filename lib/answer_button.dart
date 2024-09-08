import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.onTap, required this.answer, super.key});

  final void Function() onTap;
  final String answer;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 4, 76, 94),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
        ),
        child: Text(
          answer,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
