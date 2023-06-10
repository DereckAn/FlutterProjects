class QuizQuestion {

  QuizQuestion({required this.question, required this.answers});
  
  final String question;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
