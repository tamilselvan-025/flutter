import 'package:flutter/material.dart';

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
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFormField'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              validator: (value){
                if(value!='Tamil'){
                  return "Name is incorrect";
                }
                else {
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              
            ),
          ],
        ),
      ),
    );
  }
}
