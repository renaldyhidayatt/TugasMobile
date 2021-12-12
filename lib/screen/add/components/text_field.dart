import 'package:flutter/material.dart';

class AddingTextField extends StatelessWidget {
  final int? maxLines; // banyak lines
  final String? hintText; // untuk text petunjuk
  final TextEditingController? controller; // controller text

  AddingTextField({Key? key, this.maxLines, this.hintText, this.controller})
      : super(key: key);

      // consturctor key maxlines hint text this controller

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
