import 'package:flutter/material.dart';
import 'package:flashcard_app/models/flashcard.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FlashcardList extends StatefulWidget {
  final List<Flashcard> flashcards;

  const FlashcardList({Key? key, required this.flashcards}) : super(key: key);

  @override
  _FlashcardListState createState() => _FlashcardListState();
}

class _FlashcardListState extends State<FlashcardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Quiz'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 20,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: PageView.builder(
                itemCount: widget.flashcards.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: IntrinsicHeight(
                      child: FlashcardItem(
                          flashcard: widget.flashcards[index],
                          onDelete: () {
                            setState(() {
                              widget.flashcards.removeAt(index);
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _showAddFlashcardDialog(context, (Flashcard newFlashcard) {
                  setState(() {
                    widget.flashcards.add(newFlashcard);
                  });
                });
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  Box<Flashcard> flashcardsBox = Hive.box<Flashcard>('flashcards');

  void _showAddFlashcardDialog(
      BuildContext context, Function(Flashcard) addFlashcard) {
    TextEditingController questionController = TextEditingController();
    TextEditingController answerController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Flashcard'),
          content: Column(
            children: [
              TextField(
                controller: questionController,
                decoration: const InputDecoration(labelText: 'Question'),
              ),
              TextField(
                controller: answerController,
                decoration: const InputDecoration(labelText: 'Answer'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Flashcard newFlashcard = Flashcard(
                  question: questionController.text,
                  answer: answerController.text,
                  key: DateTime.now().millisecondsSinceEpoch,
                );

                addFlashcard(newFlashcard);
                flashcardsBox.add(newFlashcard);

                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class FlashcardItem extends StatefulWidget {
  final Flashcard flashcard;
  final VoidCallback onDelete;

  const FlashcardItem(
      {Key? key, required this.flashcard, required this.onDelete})
      : super(key: key);

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

  void removeFlashcard() {
    widget.onDelete();

    Hive.box<Flashcard>('flashcards').delete(widget.flashcard.key);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Flashcard Removed"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      showAnswer
                          ? widget.flashcard.answer
                          : widget.flashcard.question,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: toggleCard,
                      child: Text(showAnswer ? 'Show Question' : 'Show Answer'),
                    ),
                    ElevatedButton(
                        onPressed: removeFlashcard,
                        child: const Icon(Icons.delete))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
