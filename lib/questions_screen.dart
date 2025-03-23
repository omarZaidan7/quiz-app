import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_question.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/results_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentIndex = 0;
  final List<String> userAnswers = []; // Store user answers

  void answerQuestion(String selectedAnswer) {
    userAnswers.add(selectedAnswer); // Save answer

    if (currentIndex + 1 < questions.length) {
      setState(() {
        currentIndex++;
      });
    } else {
      // Move to Results Screen when all questions are answered
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(userAnswers: userAnswers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Questions',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffleAnswers().map(
                  (answer) => AnswerButton(
                text: answer,
                onPressed: () => answerQuestion(answer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




