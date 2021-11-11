import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/models/posts.dart';

class ApiService {
  final String apiUrl = "http://f64b-103-217-219-154.ngrok.io";

  Future<List<Employee>> fetchEmployee() async {
    final response = await http.get(Uri.parse('${this.apiUrl}/employee'),
        headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      print(response.body);

      return parsed.map<Employee>((json) => Employee.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load Employee');
    }
  }

  Future<List<Posts>> fetchPosts() async {
    final response = await http.get(Uri.parse('$this.ap'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Posts>((json) => Posts.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Employee> createEmployee(Employee employee) async {
    Map data = {
      'firstName': employee.firstName,
      'lastName': employee.lastName,
    };

    print(data);

    final response = await http.post(
      Uri.parse('${this.apiUrl}/create'),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return Employee.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to create employee');
    }
  }

  Future<Employee> updateEmployee(String id, Employee employee) async {
    Map data = {'firstName': employee.firstName, 'lastName': employee.lastName};

    final response = await http.put(
      Uri.parse('${this.apiUrl}/employee/update/$id'),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Employee.fromMap(json.decode(response.body));
    } else {
      throw Exception("Failed to Update Employee");
    }
  }

  Future<void> deleteEmployee(String id) async {
    final response =
        await http.delete(Uri.parse('${this.apiUrl}/employee/delete/$id'));

    if (response.statusCode == 200) {
      print("Delete");
    } else {
      throw "Failed to delete a Employee";
    }
  }
}
