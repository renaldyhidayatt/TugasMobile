

class Employee {
  int? id; //
  String firstName;
  String lastName;

  Employee({
    this.id,
    required this.firstName,
    required this.lastName,
  }); // constructor Employee pake atau ditidak this.id dan yang lain required jika tidak error

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

      // menghandel object json
}
