import 'package:flutter/material.dart';
import 'package:flutter_basics/project/signup/input_decorator.dart';
import 'package:flutter_basics/storage/web_services/model_classes/employee.dart';
import 'package:flutter_basics/storage/web_services/api_service_handlers/employee_service.dart';
import 'package:flutter_basics/storage/web_services/http_requests/http_get/http_get.dart';

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
  Employee? employee;
  String errorText = '';

  Future<void> _getEmployee(int employeeId) async {
    employee = await EmployeeService.getEmployee(employeeId);
    debugPrint("_getEmployee() called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Get"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter the employee id to find"),
            TextField(
              decoration: loginInputDecorator(hintText: "Enter ID", prefixIcon: Icons.add, labelWidgetText: "ID"),
              keyboardType: TextInputType.phone,
              controller: _employeeIdController,
            ),
            ElevatedButton(
                onPressed: () async {
                  await _getEmployee(int.parse(_employeeIdController.text)).then((_) {
                    if (employee == null) {
                      errorText = "Employee not found with id :"
                          " ${int.parse(_employeeIdController.text)}";
                      setState(() {});
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HttpGetEmployee(
                                    employee: employee!,
                                  )
                          ));
                    }
                  }
                  );
                },
                child: const Text("Find")),
            Text(errorText),
          ],
        ),
      ),
    );
  }
}
