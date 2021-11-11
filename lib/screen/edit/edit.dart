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
  });

  @override
  _EditNoteScreenState createState() =>
      _EditNoteScreenState(employee: this.employee);
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final Employee employee;

  final ApiService apiService = ApiService();
  String id = '';

  _EditNoteScreenState({required this.employee});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    id = this.employee.id.toString();

    print(this.employee.id);

    _firstNameController.text = this.employee.firstName;
    _lastNameController.text = this.employee.lastName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomAppBar(
              title: "Edit Note",
              icon: FontAwesomeIcons.solidSave,
              onPressed: () {
                print("Ikan");
              },
              isVisible: false,
            ),
            EditTextField(
              maxLines: 1,
              hintText: 'FirstName',
              controller: _firstNameController,
            ),
            EditTextField(
              maxLines: 1,
              hintText: 'LastName',
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
                        apiService.updateEmployee(
                            id,
                            Employee(
                                firstName: this._firstNameController.text,
                                lastName: this._lastNameController.text));
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

// class EditNoteScreen extends StatelessWidget {
//   final Employee employee;

//   EditNoteScreen({
//     required this.employee,
//   });
// }
