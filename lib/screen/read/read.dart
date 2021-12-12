import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/screen/edit/edit.dart';
import 'package:tugasmobile/screen/read/components/text_field.dart';
import 'package:tugasmobile/widget/custom_appbar.dart';

class ReadNoteScreen extends StatelessWidget {
  final Employee employee; // class Employee
  ReadNoteScreen({required this.employee});
  // constrocutor

  @override
  Widget build(BuildContext context) {
    return Scaffold( // membuat widget
      body: SafeArea( // membuat area aman
        child: SingleChildScrollView( // membuat singlescroll
          physics: BouncingScrollPhysics(), // membuat scorll pychics
          child: Column( // membungkus widget dan membuat object widget array
            children: <Widget>[
              CustomAppBar(
                title: employee.firstName,
                isVisible: true,
              ), // membuat appbar 
              ReadingTextField(
                text: employee.lastName,
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ), // component widget readding
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditNoteScreen(employee: employee))),
                              // push ke edit note screen
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white), // membuat text edit
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
