import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/screen/read/read.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  CustomListTile({required this.employee});
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        employee.firstName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          employee.lastName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReadNoteScreen(
                    employee: employee,
                  ))),
      contentPadding: EdgeInsets.all(17),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
