import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/models/posts.dart';
import 'package:tugasmobile/screen/home/components/list_tile.dart';

class CustomDismissible extends StatelessWidget {
  final Employee employee;
  final int index;

  CustomDismissible({required this.employee, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(employee.id.toString()),
      child: Card(child: CustomListTile(employee: this.employee)),
      background: Padding(
        padding: EdgeInsets.only(right: 30),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            FontAwesomeIcons.trashAlt,
            color: Color(0xFFFA8182),
            size: 28,
          ),
        ),
      ),
    );
  }
}
