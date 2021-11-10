import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  SettingsListTile({required this.title, required this.trailing});
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      trailing: trailing,
    );
  }
}
