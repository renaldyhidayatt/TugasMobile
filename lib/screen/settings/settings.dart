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
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 45),
            child: CustomAppBar(
              title: "Settings",
              isVisible: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              SettingsListTile(
                  title: "NightMode",
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
