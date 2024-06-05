import 'package:flutter/material.dart';
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
  bool _isLoading = true;
  List<Employee>? _employees;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _getEmployees();
  }

  void _getEmployees() async {
    _employees = await EmployeeService.getEmployees();
    if (_employees == null) {
      _text = "No Employee present";
    } else {
      _text = _employees.toString();
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Get Employees"),
        backgroundColor: Colors.red,
      ),
      body: _isLoading
          ? const LinearProgressIndicator()
          : SingleChildScrollView(
            child: Center(
                child: Text(_text),
              ),
          ),
    );
  }
}
