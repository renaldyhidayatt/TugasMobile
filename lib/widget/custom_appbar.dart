import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {required this.title,
      required this.isVisible,
      this.icon,
      this.onPressed});

  final String title; // string title
  final bool isVisible;
  final IconData? icon; // object Icon
  final Function()? onPressed; // function untuk menghandle function

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back, size: 27),
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            Visibility(
              visible: isVisible,
              child: IconButton(
                  icon: Icon(icon, size: 22), onPressed: this.onPressed),
            ),
          ],
        ));
  }
}
