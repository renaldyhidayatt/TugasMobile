import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  final int? maxLines;
  final String? hintText;
  final TextEditingController? controller;

  EditTextField({
    this.maxLines,
    this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(hintText: hintText),
        onChanged: (input) {
          if (input.isEmpty) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Please enter some text'),
              duration: Duration(seconds: 1),
            ));
          }
        },
        controller: controller,
      ),
    );
  }
}
