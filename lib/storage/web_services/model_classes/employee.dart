
import 'package:flutter/cupertino.dart';

class Employee {

  num? _id;
  String? _employeeName;
  num? _employeeSalary;
  num? _employeeAge;
  String? _profileImage;

  Employee({
    num? id,
    String? employeeName,
    num? employeeSalary,
    num? employeeAge,
    String? profileImage,
  }) {
    _id = id;
    _employeeName = employeeName;
    _employeeSalary = employeeSalary;
    _employeeAge = employeeAge;
    _profileImage = profileImage;
  }

  Employee.fromJson(dynamic json) {
    if(json['id']==null){
      debugPrint("Id is received as null");
    }
    _id = json['id'];

    _employeeName = json['employee_name'];
    _employeeSalary = json['employee_salary'];
    _employeeAge = json['employee_age'];
    _profileImage = json['profile_image'];
  }



  Employee copyWith({
    num? id,
    String? employeeName,
    num? employeeSalary,
    num? employeeAge,
    String? profileImage,
  }) =>
      Employee(
        id: id ?? _id,
        employeeName: employeeName ?? _employeeName,
        employeeSalary: employeeSalary ?? _employeeSalary,
        employeeAge: employeeAge ?? _employeeAge,
        profileImage: profileImage ?? _profileImage,
      );

  num? get id => _id;

  String? get employeeName => _employeeName;

  num? get employeeSalary => _employeeSalary;

  num? get employeeAge => _employeeAge;

  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['employee_name'] = _employeeName;
    map['employee_salary'] = _employeeSalary;
    map['employee_age'] = _employeeAge;
    map['profile_image'] = _profileImage;
    return map;
  }

  @override
  String toString() {
    return 'Employee{_id: $_id, _employeeName: $_employeeName, _employeeSalary: $_employeeSalary, _employeeAge: $_employeeAge, _profileImage: $_profileImage}';
  }
}


