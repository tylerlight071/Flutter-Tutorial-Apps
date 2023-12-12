import 'package:hive/hive.dart';

part 'flashcard.g.dart';

@HiveType(typeId: 0)
class Flashcard {
  @HiveField(0)
  String question;

  @HiveField(1)
  String answer;

  @HiveField(2)
  int? key;

  Flashcard({required this.question, required this.answer, required this.key});
}
