import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/screen/add/add.dart';
import 'package:tugasmobile/screen/home/components/appbar.dart';
import 'package:tugasmobile/screen/home/components/list_view.dart';
import 'package:tugasmobile/widget/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[HomeAppBar(), CustomListView()]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddNoteScreen()),
        ),
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
