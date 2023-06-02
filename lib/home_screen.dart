import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Learn Flutter my g',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
              textStyle:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            icon: const Icon(Icons.arrow_right_alt, size: 32),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
