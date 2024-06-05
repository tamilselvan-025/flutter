import 'package:flutter/material.dart';
import 'package:flutter_basics/task_given_by_senior/future/blin_cube_service/service_page.dart';

//Pending task
void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicePage()));
          },
          child: const Text("click"),
        ),
      ),
    );
  }
}
