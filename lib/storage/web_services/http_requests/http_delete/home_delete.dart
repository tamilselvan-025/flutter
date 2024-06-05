import 'package:flutter/material.dart';
import 'package:flutter_basics/project/signup/input_decorator.dart';
import 'package:flutter_basics/storage/web_services/api_service_handlers/employee_service.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _employeeIdController = TextEditingController();

  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http delete"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter the employee id to delete"),
            TextField(
              decoration: loginInputDecorator(hintText: "Enter ID", prefixIcon: Icons.add, labelWidgetText: "ID"),
              keyboardType: TextInputType.phone,
              controller: _employeeIdController,
            ),
            ElevatedButton(
                onPressed: () async{
                 final int statusCode=await EmployeeService.deleteEmployee(int.parse(_employeeIdController.text));
                  if(statusCode==100){
                    errorText="Employee with id : ${int.parse(_employeeIdController.text)} deleted successfully";
                  }
                  else{
                    errorText="Employee with id : ${int.parse(_employeeIdController.text)} not deleted";

                  }
                  },
                child: const Text("Delete")),
            Text(errorText),
          ],
        ),
      ),
    );
  }
}
