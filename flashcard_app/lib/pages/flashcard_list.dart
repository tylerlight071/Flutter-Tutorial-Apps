import 'package:flashcard_app/models/flashcard.dart';
import 'package:flutter/material.dart';

class FlashcardList extends StatelessWidget {
  final List<Flashcard> flashcards;

  const FlashcardList({Key? key, required this.flashcards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Quiz'),
      ),
      body: PageView.builder(
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return FlashcardItem(flashcard: flashcards[index]);
        },
      ),
    );
  }
}

class FlashcardItem extends StatefulWidget {
  final Flashcard flashcard;

  const FlashcardItem({Key? key, required this.flashcard}) : super(key: key);

  @override
  _FlashcardItemState createState() => _FlashcardItemState();
}

class _FlashcardItemState extends State<FlashcardItem> {
  bool showAnswer = false;

  void toggleCard() {
    setState(() {
      showAnswer = !showAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              showAnswer ? widget.flashcard.answer : widget.flashcard.question,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: toggleCard,
              child: Text(showAnswer ? 'Show Question' : 'Show Answer'),
            ),
          ],
        ),
      ),
    );
  }
}
