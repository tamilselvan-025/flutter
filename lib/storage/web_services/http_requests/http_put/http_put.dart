import 'package:flutter/material.dart';
import 'package:flutter_basics/project/signup/input_decorator.dart';
import 'package:flutter_basics/storage/web_services/api_service_handlers/employee_service.dart';
import 'package:flutter_basics/storage/web_services/model_classes/employee.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http put"),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _employeeIdController,
                          keyboardType: TextInputType.phone,
                          decoration: loginInputDecorator(
                              hintText: "Enter Id to be updated", prefixIcon: Icons.abc, labelWidgetText: "Id"),
                          validator: (value) {
                            if (value == null || value.isEmpty) return "enter the Id";
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                          decoration: loginInputDecorator(
                              hintText: "Enter name", prefixIcon: Icons.abc, labelWidgetText: "Name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) return "enter the name";
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _ageController,
                          keyboardType: TextInputType.phone,
                          decoration: loginInputDecorator(
                              hintText: "Enter age", prefixIcon: Icons.numbers, labelWidgetText: "Age"),
                          validator: (value) {
                            if (value == null || value.isEmpty) return "enter the age";
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _salaryController,
                          keyboardType: TextInputType.number,
                          decoration: loginInputDecorator(
                              hintText: "Enter salary", prefixIcon: Icons.abc, labelWidgetText: "salary"),
                          validator: (value) {
                            if (value == null || value.isEmpty) return "enter the salary";
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Employee employee = Employee(
                                    employeeAge: int.parse(_ageController.text),
                                    employeeName: _nameController.text,
                                    employeeSalary: int.parse(_salaryController.text));
                                int statusCode =
                                    await EmployeeService.
                                    putEmployee(employee, int.parse(_employeeIdController.text));
                                if (statusCode == 200) {
                                  resultText = "Employee updated successfully";
                                } else {
                                  resultText = "Employee not updated !";
                                }
                                setState(() {});
                              }
                            },
                            child: const Text("update")),
                        Text(resultText),
                      ],
                    ),
                ),
              ))),
    );
  }
}
