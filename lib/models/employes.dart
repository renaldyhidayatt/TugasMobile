import 'dart:convert';

List<Employee> postFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromMap(x)));

class Employee {
  int? id;
  String firstName;
  String lastName;

  Employee({
    this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );
}
