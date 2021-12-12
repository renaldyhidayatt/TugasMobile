import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/screen/home/components/list_tile.dart';
import 'package:tugasmobile/services/api_services.dart';
import 'package:tugasmobile/widget/custom_alert.dart';

class CustomListView extends StatefulWidget {
  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final ApiService apiService = ApiService(); // membuat api service

  late Future<List<Employee>> futureEmployee; // membuat list employee

  @override
  void initState() {
    super.initState();
    this.apiService.fetchEmployee(); 
    futureEmployee = apiService.fetchEmployee();
  } // memanggil ketika dipakai 

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: FutureBuilder<List<Employee>>( // futurebuilder buat ketika data dimasa depan
            future: futureEmployee,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.all(10), // pixel berukuran 10
                  physics: BouncingScrollPhysics(), // membuat scroll 
                  itemCount: snapshot.data!.length, // data panjang snaphshot
                  itemBuilder: (_, index) => Dismissible(
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) => showDialog(
                        context: context,
                        builder: (context) => CustomAlertDialog()),
                    onDismissed: (direction) => apiService
                        .deleteEmployee(snapshot.data![index].id.toString()), // untuk menghanlde api dengan parametter id
                    key: Key(snapshot.data![index].id.toString()),
                    child: Card(
                      child: CustomListTile(employee: snapshot.data![index]),
                      // membuat listile dengan parameter snapshot data berdasarkan index
                    ),
                    background: Padding( // membuat padding
                        padding: EdgeInsets.only(right: 30), // membuat ukuran
                        child: Align( // letak widget
                          alignment: Alignment.centerRight, // center kanan
                          child: Icon(FontAwesomeIcons.trash,
                              color: Color(0xFFFA8182), size: 28),
                        )),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                ); // untuk menghandle jika terjadi data kosong 
              }
            }));
  }
}
