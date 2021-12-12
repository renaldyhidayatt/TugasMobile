import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasmobile/services/shared_pref.dart';
import 'package:tugasmobile/widget/custom_appbar.dart';
import 'package:tugasmobile/screen/settings/components/list_tile.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SharedPref>(context);
    // package provider memanggil localstorage 
    return Scaffold(
        body: SafeArea( // membuat safearea
      child: Column( // membungkus widget lalu dengan object Widget array
        children: <Widget>[
          Padding( // padding
            padding: EdgeInsets.only(right: 45), // membuat pixel right
            child: CustomAppBar(
              title: "Settings",
              isVisible: false,
            ),
          ),
          Padding( // padding
            padding: EdgeInsets.all(20), // membuat pixel all 
            child: Column(children: <Widget>[
              SettingsListTile(
                  title: "NightMode", // titlte
                  trailing: Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        value: data.isNight,
                        onChanged: (value) {
                          data.enableDarkMode();
                          data.setTheme();
                        }),
                  ))
            ]),
          )
        ],
      ),
    ));
  }
}
