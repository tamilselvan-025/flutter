import 'package:flutter/material.dart';
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
  bool _isLoading = true;

  final String _text = 'Head Request Success';

  @override
  void initState() {
    super.initState();
    _getHead();
  }

  void _getHead() async {
    int statusCode = await EmployeeService.performHeadRequest();
    debugPrint("------------------ statusCode :$statusCode------------------");
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
          : Center(
            child: Text(_text),
          ),
    );
  }
}
