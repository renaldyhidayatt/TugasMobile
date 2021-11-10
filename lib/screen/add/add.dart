import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/screen/add/components/text_field.dart';
import 'package:tugasmobile/widget/custom_appbar.dart';

class AddNoteScreen extends StatelessWidget {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomAppBar(
              title: "Add Note",
              icon: FontAwesomeIcons.solidSave,
              onPressed: () {
                print("Ikan");
              },
              isVisible: false,
            ),
            AddingTextField(
              maxLines: 1,
              hintText: 'firstName',
              controller: _firstNameController,
            ),
            AddingTextField(
              maxLines: 1,
              hintText: 'lastName',
              controller: _lastNameController,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      child: Text(
                        "save",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        print(
                            "Bisa ${_firstNameController.text} ${_lastNameController.text}");
                      },
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
