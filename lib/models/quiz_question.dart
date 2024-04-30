class QuizQuestion {
  const QuizQuestion(
    this.question,
    this.answers,
  ); //const erlauben, da sich Objekt QuizQuestion nach Erstellung nicht mehr ändert

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
