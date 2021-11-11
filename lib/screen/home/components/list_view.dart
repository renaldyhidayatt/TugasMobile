import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/models/posts.dart';
import 'package:tugasmobile/screen/home/components/dismissible.dart';
import 'package:tugasmobile/screen/home/components/list_tile.dart';
import 'package:tugasmobile/services/api_services.dart';
import 'package:tugasmobile/widget/custom_alert.dart';

class CustomListView extends StatefulWidget {
  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final ApiService apiService = ApiService();

  late Future<List<Employee>> futureEmployee;

  @override
  void initState() {
    super.initState();
    this.apiService.fetchEmployee();
    futureEmployee = apiService.fetchEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: FutureBuilder<List<Employee>>(
            future: futureEmployee,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Dismissible(
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) => showDialog(
                        context: context,
                        builder: (context) => CustomAlertDialog()),
                    onDismissed: (direction) => apiService
                        .deleteEmployee(snapshot.data![index].id.toString()),
                    key: Key(snapshot.data![index].id.toString()),
                    child: Card(
                      child: CustomListTile(employee: snapshot.data![index]),
                    ),
                    background: Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            FontAwesomeIcons.trash,
                            color: Colors.white,
                          ),
                        )),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
