import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flashcard_app/models/flashcard.dart';
import 'package:flashcard_app/pages/flashcard_list.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FlashcardAdapter());
  await Hive.openBox<Flashcard>('flashcards');

  var flashcardsBox = Hive.box<Flashcard>("flashcards");

  if (flashcardsBox.isEmpty) {
    flashcardsBox.add(Flashcard(
        question: "Default Question",
        answer: "Default Answer",
        key: DateTime.now().millisecondsSinceEpoch));
    flashcardsBox.add(Flashcard(
        question: "Default Question 2",
        answer: "Default Answer 2",
        key: DateTime.now().millisecondsSinceEpoch + 1));
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Box<Flashcard> flashcardsBox = Hive.box<Flashcard>('flashcards');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard Quiz',
      home: FlashcardList(flashcards: flashcardsBox.values.toList()),
    );
  }
}

// ToDo Add Database