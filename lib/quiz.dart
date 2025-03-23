import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  void moveScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuestionsScreen()), // Navigate to QuestionsScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/quiz-logo.png', width: 300, color: Colors.white),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: moveScreen,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                icon: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.blue),
                label: const Text(
                  'Start',
                  style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

