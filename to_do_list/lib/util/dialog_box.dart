import "package:flutter/material.dart";
import "package:to_do_list/util/my_button.dart";

class DialogBox extends StatelessWidget {
  final dynamic controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      content: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add a new task..."),
              ),

              // buttons -> save + cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button
                  MyButton(onPressed: onSave, text: "Save"),

                  const SizedBox(width: 8),

                  //cancel button
                  MyButton(onPressed: onCancel, text: "Cancel"),
                ],
              )
            ],
          )),
    );
  }
}
