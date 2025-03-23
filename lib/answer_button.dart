import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AnswerButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(text),
      ),
    );
  }
}

