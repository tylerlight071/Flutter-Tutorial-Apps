import 'package:flashcard_app/models/flashcard.dart';
import 'package:flashcard_app/pages/flashcard_list.dart'; // Ensure the correct import path
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard Quiz',
      home: FlashcardList(flashcards: flashcards),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
