import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/models/employes.dart';

import 'package:tugasmobile/screen/home/components/list_tile.dart';

class CustomDismissible extends StatelessWidget {
  final Employee employee; // object class Employee
  final int index; // index

  CustomDismissible({required this.employee, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible( // widget dissmie
      direction: DismissDirection.endToStart,
      key: Key(employee.id.toString()), // key lalu employe id ke string
      child: Card(child: CustomListTile(employee: this.employee)), // card
      background: Padding(
        padding: EdgeInsets.only(right: 30), //Membuat sisipan dengan hanya nilai yang diberikan bukan nol.
        child: Align(
          alignment: Alignment.centerRight, // kanan tengah
          child: Icon(
            FontAwesomeIcons.trashAlt, // icon transh
            color: Color(0xFFFA8182), // warna 
            size: 28, // ukuran text
          ), // align letak widget
        ),
      ),
    );
  }
}
