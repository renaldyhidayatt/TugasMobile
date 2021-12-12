import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  SettingsListTile({required this.title, required this.trailing});
  // constator 
  final String title; // title string
  final Widget trailing; // object Widget bernama trailling

  @override
  Widget build(BuildContext context) {
    return ListTile( // membuat listtile widget
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      trailing: trailing,
    );
  }
}
