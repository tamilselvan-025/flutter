import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

enum Course { java, flutter, sql, python }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Course _currentCourse = Course.java;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RadioButton"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  activeColor: Colors.blue,
                  splashRadius: 30,
                  value: Course.java,
                  groupValue: _currentCourse,
                  onChanged: (value) {
                    _currentCourse = value as Course;
                    setState(() {});
                  },
                ),
                const Text("JAVA"),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: Colors.blue,
                  splashRadius: 30,

                  value: Course.flutter,
                  groupValue: _currentCourse,
                  onChanged: (value) {
                    _currentCourse = value as Course;
                    setState(() {});
                  },
                ),
                const Text("FLUTTER"),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: Colors.blue,
                  splashRadius: 30,

                  value: Course.sql,
                  groupValue: _currentCourse,
                  onChanged: (value) {
                    _currentCourse = value as Course;
                    setState(() {});
                  },
                ),
                const Text("SQL"),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: Colors.blue,
                  splashRadius: 30,
                  value: Course.python,
                  groupValue: _currentCourse,
                  onChanged: (value) {
                    _currentCourse = value as Course;
                    setState(() {});
                  },
                ),
                const Text("PYTHON"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
