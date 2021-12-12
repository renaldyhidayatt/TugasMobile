import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  final int? maxLines; // banyak lines
  final String? hintText; // untuk text petunjuk
  final TextEditingController? controller; // controller text

  EditTextField({
    this.maxLines,
    this.hintText,
    this.controller,
  }); // consturctor key maxlines hint text this controller

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15), // Membuat offset di keempat sisi kotak
      child: TextField(
          maxLines: maxLines, // panjang line berdasarkan string  maxlines
          decoration: InputDecoration(hintText: hintText), // inputdecoration yang berdasarkan string hintText
          onChanged: (input) {
            if (input.isEmpty) { // jika terjadi kosong inputannya maka keluar notifikasinya
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Please enter some text'), // text
                duration: Duration(seconds: 1), // durasi notifikasi akan muncul
              ));
            }
          },
          controller: controller), // text field 
    );
  }
}
