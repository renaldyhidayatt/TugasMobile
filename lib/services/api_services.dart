import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugasmobile/models/employes.dart';
import 'package:tugasmobile/models/posts.dart';

class ApiService {
  final String apiUrl = "http://8113-103-217-219-154.ngrok.io";

  Future<List<Employee>> fetchEmployee() async {
    final response = await http.get(
        Uri.parse("http://8113-103-217-219-154.ngrok.io/employee"),
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
    final response = await http
        .get(Uri.parse("http://8113-103-217-219-154.ngrok.io/employee"));

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

    final response = await http.post(
      Uri.parse("${this.apiUrl}/employee"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      return Employee.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to create employee');
    }
  }
}
