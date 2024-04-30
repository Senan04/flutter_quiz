import 'package:flutter/material.dart';

class AnswersScreen extends StatelessWidget {
  AnswersScreen({super.key});

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Test'),
        SizedBox(
          height: 20,
        ),
        Text('Data'),
        SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Restart Quiz',
          ),
        ),
      ],
    );
  }
}
