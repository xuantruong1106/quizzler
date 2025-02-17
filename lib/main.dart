import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,  
    home: QuizApp(),
  ));
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizBrain quizBrain = QuizBrain();
  int score = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (correctAnswer == userPickedAnswer) {
        score++;
      }
      if (quizBrain.isFinished()) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Quiz Completed'),
            content: Text('Your Score: $score'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    quizBrain.reset();
                    score = 0;
                  });
                },
                child: Text('Restart'),
              ),
            ],
          ),
        );
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 

      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () => checkAnswer(true),
                  child: Text('True', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => checkAnswer(false),
                  child: Text('False', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
