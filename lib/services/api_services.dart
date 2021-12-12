import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugasmobile/models/employes.dart';

class ApiService {
  final String apiUrl = "http://46aa-103-217-219-154.ngrok.io"; 
  // address server

  Future<List<Employee>> fetchEmployee() async {
    final response = await http.get(Uri.parse('${this.apiUrl}/employee'),
        headers: {'Accept': 'application/json'});
        // membuat response berdasarkan json

    if (response.statusCode == 200) { // jika 200 maka akan keluar seperti yang dibawah
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>(); // parsing json decode menjadi objek bertipe string dan dynamic

      print(response.body); // membuat response berdasarkan body

      return parsed.map<Employee>((json) => Employee.fromMap(json)).toList();
      // konvert object ke list atau array
    } else { // jika gagal makaa keluar print out
      throw Exception('Failed to load Employee');
    }
  }

  Future<Employee> createEmployee(Employee employee) async {
    Map data = {
      'firstName': employee.firstName,
      'lastName': employee.lastName,
    }; // menbuat object 

    print(data); // print out object data

    final response = await http.post(
      Uri.parse('${this.apiUrl}/create'),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, // membuat request berdasakan json dan waktu utf
    );
    if (response.statusCode == 200) { // 
    //jika statuscode 200 make keluar berupa object json
      print(response.body); // print out body
      return Employee.fromMap(json.decode(response.body));
      // untuk menghandle object json 
    } else { // jika gagal maka akan print out ini
      throw Exception('Failed to create employee');
    }
  }

  Future<Employee> updateEmployee(String id, Employee employee) async {
    // function employee dengan parameter id dan object class Employee 
    // dengan async

    Map data = {'firstName': employee.firstName, 'lastName': employee.lastName};
    // object data

    final response = await http.put(
      Uri.parse('${this.apiUrl}/employee/update/$id'),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, // membuat response berdasarkan json dan waktu utf
    ); // membuat http dengan metode put

    if (response.statusCode == 200) { // jika statuscode 200 make keluar berupa object json
      return Employee.fromMap(json.decode(response.body));
    } else { // jika gagal maka akan print 
      throw Exception("Failed to Update Employee");
    }
  }

  Future<void> deleteEmployee(String id) async {
    final response =
        await http.delete(Uri.parse('${this.apiUrl}/employee/delete/$id'));
    // membuat response api
    if (response.statusCode == 200) { //jika statuscode 200 make keluar berupa object json
      print("Delete"); // printout delete
    } else { // // jika gagal maka akan print 
      throw "Failed to delete a Employee";
    }
  }
}
