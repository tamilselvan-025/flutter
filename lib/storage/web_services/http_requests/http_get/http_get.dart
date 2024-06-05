import 'package:flutter/material.dart';
import 'package:flutter_basics/storage/web_services/model_classes/employee.dart';

class HttpGetEmployee extends StatelessWidget {
  final Employee employee;

  const HttpGetEmployee( {required this.employee,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee details"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(employee.toString()),
      ),
    );
  }
}
