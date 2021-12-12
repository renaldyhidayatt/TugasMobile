import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/screen/edit/components/text_field.dart';
import 'package:tugasmobile/services/api_services.dart';
import 'package:tugasmobile/widget/custom_appbar.dart';

class EditNoteScreen extends StatefulWidget {
  final Employee employee;

  EditNoteScreen({
    required this.employee,
  }); // butuh object class bernama employee

  @override
  _EditNoteScreenState createState() =>
      _EditNoteScreenState(employee: this.employee); // membuat state
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final Employee employee; // object class employee

  final ApiService apiService = ApiService(); // object class apiservice
  String id = ''; // string id

  _EditNoteScreenState({required this.employee}); 
  // membutuhkan object class bernama employee

  final _firstNameController = TextEditingController();
  // handle text firstName
  final _lastNameController = TextEditingController();
  // handle text lastName
  @override
  void initState() { // metode ketika page edit 
    super.initState();
    id = this.employee.id.toString(); // untuk convert int ke string

    print(this.employee.id); // print employe id

    _firstNameController.text = this.employee.firstName;
    // jika ada data employee firstName menjadi value firstNameController

    _lastNameController.text = this.employee.lastName;
    // jika ada data employee lastName menjadi value lastNameController
  } // 

  @override
  Widget build(BuildContext context) {
    return Scaffold( // widget scaffold
      body: SafeArea( // untuk membuat area safery
        child: Column(
          children: <Widget>[ // object Widget array
            CustomAppBar(
              title: "Edit Note", // text title
              icon: FontAwesomeIcons.solidSave, // icon solid save
              onPressed: () {
                print("Ikan"); // print out ikan
              },
              isVisible: false,
            ),
            EditTextField(
              maxLines: 1,
              hintText: 'FirstName',
              controller: _firstNameController,
            ), // sama kayak add
            EditTextField(
              maxLines: 1,
              hintText: 'LastName',
              controller: _lastNameController,
            ), // sama kayak aadd
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column( // membungkus widget yang lain
                  children: <Widget>[ // object widget array
                    ElevatedButton(
                      child: Text(
                        "save",
                        style: TextStyle(color: Colors.white),
                      ), // button
                      onPressed: () {
                        apiService.updateEmployee(
                            id,
                            Employee(
                                firstName: this._firstNameController.text,
                                lastName: this._lastNameController.text));
                                 // handle api dengan parametter id dan object class Employee
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

