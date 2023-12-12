import 'package:flashcard_app/models/flashcard.dart';
import 'package:flashcard_app/pages/flashcard_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final List<Flashcard> flashcards = [
    Flashcard(
        question: 'What is Flutter?',
        answer: 'A UI toolkit for building natively compiled applications.'),
    Flashcard(
        question: 'What is Dart?',
        answer: 'The programming language used for Flutter development.'),
    // Add more flashcards as needed
  ];

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard Quiz',
      home: FlashcardList(flashcards: flashcards),
    );
  }
}

// ToDo Add Database