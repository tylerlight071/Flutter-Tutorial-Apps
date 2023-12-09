import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
