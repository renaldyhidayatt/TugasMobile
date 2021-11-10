import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/screen/settings/settings.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 8, 5, 8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.cog,
                size: 22,
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen())),
            )
          ]),
    );
  }
}
