import 'package:flutter/material.dart';
import 'package:flutter_basics/storage/web_services/api_service_handlers/employee_service.dart';

void main() => runApp(const MaterialApp(home: Home(),));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _response = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getResponse();
  }

  void getResponse() async {
    _response = await EmployeeService.performReadRequest();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Read '),
        backgroundColor: Colors.red,
      ),
      body: _isLoading
          ? const LinearProgressIndicator()
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Center(
                  child: Text(_response),
                ),
              ),
          ),
    );
  }
}
