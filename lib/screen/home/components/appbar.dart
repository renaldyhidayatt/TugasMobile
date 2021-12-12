import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/screen/settings/settings.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( // untuke membungkus widget
      padding: EdgeInsets.fromLTRB(20, 8, 5, 8), // yang digunakan untuk mengatur offset dari masing-masing dari empat sisi a kotak
      child: Row( // 
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Membagi ruang ekstra secara merata di antara children
          children: <Widget>[ // object Widget array
            Text(
              'Home',
              style: TextStyle(
                fontSize: 20, // ukuran text
                fontWeight: FontWeight.bold, // text yang tebal
              ),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.cog, // icon cog
                size: 22, // size icon
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen())), // routing push ke settingsScreen
            )
          ]),
    );
  }
}
