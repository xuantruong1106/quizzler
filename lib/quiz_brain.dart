class Question {
  String questionText;
  bool answer;

  Question(this.questionText, this.answer);
}

class QuizBrain {
  int _questionIndex = 0;
  final List<Question> _questions = [
    Question('Flutter is developed by Google.', true),
    Question('Dart is a compiled language.', true),
    Question('Flutter only supports Android.', false),
  ];

  String getQuestionText() {
    return _questions[_questionIndex].questionText;
  }

  bool getCorrectAnswer() {
    return _questions[_questionIndex].answer;
  }

  void nextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
    }
  }

  bool isFinished() {
    return _questionIndex >= _questions.length - 1;
  }

  void reset() {
    _questionIndex = 0;
  }

  
}
