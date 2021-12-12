import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget myFlatButton(title, color, value) { 
      // widget myflatbutton dengan parameter title color, value
      return TextButton( // widget textbuttoj
        child: Text( // text 
          title,
          style: TextStyle(color: color), // color white
        ),
        onPressed: () => Navigator.of(context).pop(value),
      );
    }

    return AlertDialog( // membuat widget alert dialog
      title: Text('Confirm delete'),
      content: Text('Are you sure you want to delete this note?'), //
      actions: <Widget>[ // object Widget array
        myFlatButton('Delete', Colors.redAccent, true),
        myFlatButton('Cancel', Colors.grey, false),
      ],
      contentPadding: EdgeInsets.fromLTRB(25, 15, 25, 5), // pixel left, top, right, bottom
      insetPadding: EdgeInsets.symmetric(horizontal: 20), // pixel horizontal
    );
  }
}
