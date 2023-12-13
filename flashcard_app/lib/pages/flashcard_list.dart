import 'package:flashcard_app/models/flashcard.dart';
import 'package:flutter/material.dart';

class FlashcardList extends StatelessWidget {
  final List<Flashcard> flashcards;

  const FlashcardList({Key? key, required this.flashcards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Flashcard Quiz'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 20,
      ),
      body: Stack(children: <Widget>[
        PageView.builder(
          itemCount: flashcards.length,
          itemBuilder: (context, index) {
            return FlashcardItem(flashcard: flashcards[index]);
          },
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Handle Button Press
                  },
                  child: const Icon(Icons.add), // Add Icon,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Button Press
                  },
                  child: const Icon(Icons.delete), // Remove Icon,
                )
              ],
            ),
          ),
        )
      ]),
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
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.8,
        child: Card(
          elevation: 20,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    showAnswer
                        ? widget.flashcard.answer
                        : widget.flashcard.question,
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: toggleCard,
                    child: Text(showAnswer ? 'Show Question' : 'Show Answer'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
