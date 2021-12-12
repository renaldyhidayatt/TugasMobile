import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/screen/read/read.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  CustomListTile({required this.employee});
  final Employee employee; // object class employee

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        employee.firstName,
        maxLines: 2, // maksimal text 2 line
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
      ), // title
      subtitle: Padding(
        padding: EdgeInsets.only(top: 8), 
        //Memungkinkan Anda memilih di sisi mana untuk membuat offset
        child: Text(
          employee.lastName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
      ), // padding 
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReadNoteScreen(
                    employee: employee,
                  ))),
      contentPadding: EdgeInsets.all(17),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

    ); // push ke read note
  }
}
