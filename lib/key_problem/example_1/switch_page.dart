import 'package:flutter/material.dart';
import 'package:flutter_basics/key_problem/example_1/screen_2.dart';
import 'const_text.dart';

void main() {
  runApp( const MaterialApp(home: Home(),));
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void toggleSwitch(bool value) {
    setState(() {
   ConstText.isSwitch=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Page"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Switch(
            value: ConstText.isSwitch,
            onChanged:(value){
              toggleSwitch(value);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Screen2()));
        },
        child: const Text("Next"),
      ),
    );
  }
}
