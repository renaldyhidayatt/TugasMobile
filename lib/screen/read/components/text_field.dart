import 'package:flutter/material.dart';

class ReadingTextField extends StatelessWidget {
  final String? text; // text
  final double? fontSize; // ukuran font

  final FontWeight? fontWeight; // keterangan font

  ReadingTextField({
    required this.text,
    this.fontSize,
    this.fontWeight,
  }); // constractor 

  @override
  Widget build(BuildContext context) {
    return Padding( // padding
      padding: EdgeInsets.symmetric(horizontal: 20), // membuat pixel secara horizontal
      child: TextField(
        enabled: false,
        maxLines: null,
        controller: TextEditingController(text: text),
        decoration: InputDecoration(fillColor: Colors.transparent),
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
