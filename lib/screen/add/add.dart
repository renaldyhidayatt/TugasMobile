import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/screen/add/components/text_field.dart';
import 'package:tugasmobile/services/api_services.dart';
import 'package:tugasmobile/widget/custom_appbar.dart';

class AddNoteScreen extends StatelessWidget {
  final ApiService apiService = ApiService(); // memanggil class apiService
  late final Employee employee; // memanggil model Employee

  final _firstNameController = TextEditingController(); // handle text firstName
  final _lastNameController = TextEditingController(); // handle text lastName

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 
      body: SafeArea( // buat area safety
        child: Column(
          children: <Widget>[ // object widget array
            CustomAppBar(
              title: "Add Note",
              icon: FontAwesomeIcons.solidSave, // icon solid save dari fontAwesome package
              onPressed: () {
                print("Ikan"); // untuk print out bertulis ikan
              },
              isVisible: false,
            ),
            AddingTextField(
              maxLines: 1,
              hintText: 'firstName',
              controller: _firstNameController,
            ), // package addingTextField
            AddingTextField(
              maxLines: 1,
              hintText: 'lastName',
              controller: _lastNameController,
            ), //
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10), // 
                child: Column( // membungkus widget yang lain
                  children: <Widget>[ // object widget array
                    ElevatedButton(
                      child: Text(
                        "save", // text
                        style: TextStyle(color: Colors.white), // text yang berwarna white
                      ),
                      onPressed: () {
                        apiService.createEmployee(Employee(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text));
                        print("Bisa"); // handle api dengan parameter firstName dan lastName
                      },
                    ) // button
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
