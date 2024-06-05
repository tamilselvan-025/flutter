import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(home: Home(),));
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Margin"),backgroundColor: Colors.cyan,),
    body: Container(
      color: Colors.black,
      height: 500,
      width: 500,
      child: Container(
        color: Colors.red,

        padding:const EdgeInsets.all(20),
        margin:const  EdgeInsets.fromLTRB(20,40,60,100),
        child:const  Text('Child Widget'),

      ),
    ),
    );
  }
}
