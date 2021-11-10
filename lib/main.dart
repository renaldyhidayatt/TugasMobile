import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasmobile/screen/home/home.dart';
import 'package:tugasmobile/services/shared_pref.dart';
import 'package:tugasmobile/themes/dark_theme.dart';
import 'package:tugasmobile/themes/light_theme.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => SharedPref(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SharedPref>(context);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: data.isNight ? darkTheme : lightTheme,
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
