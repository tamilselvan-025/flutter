import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home:const Home(),
  theme: ThemeData(focusColor: Colors.pink),
  )
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckBox'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Checkbox(
              tristate: true,

              activeColor: Colors.cyan,
              value: isChecked,
              splashRadius: 30,

              onChanged: (value) {
                isChecked = value;
                setState(() {});
              },

              checkColor: Colors.red,

            ),


          ],
        ),
      ),
    );
  }
}
