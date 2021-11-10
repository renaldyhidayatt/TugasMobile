import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/screen/edit/edit.dart';
import 'package:tugasmobile/screen/read/components/text_field.dart';
import 'package:tugasmobile/widget/custom_appbar.dart';

class ReadNoteScreen extends StatelessWidget {
  final Employee employee;

  ReadNoteScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              CustomAppBar(
                title: employee.firstName,
                isVisible: true,
              ),
              ReadingTextField(
                text: employee.lastName,
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditNoteScreen(employee: employee))),
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
