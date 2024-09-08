import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.dataSummary,
  });

  final List<Map<String, Object>> dataSummary;

  @override
  Widget build(context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: dataSummary.map((data) {
            final String chosenAnswer = data['chosenAnswer'] as String;
            final String correctAnswer = data['correctAnswer'] as String;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chosenAnswer == correctAnswer
                          ? Colors.green
                          : Colors.red,
                    ),
                    child: Text(((data['currentIndex'] as int) + 1).toString(),
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['currentQuestion'] as String,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        chosenAnswer,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color.fromARGB(255, 17, 85, 202)),
                      ),
                      Text(
                        correctAnswer,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color.fromARGB(255, 29, 230, 36)),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
