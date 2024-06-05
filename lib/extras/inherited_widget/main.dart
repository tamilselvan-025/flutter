import 'package:flutter/material.dart';
import 'package:flutter_basics/extras/inherited_widget/inherited_widget.dart';

void main() {
  runApp(const MyInheritedWidget(data: "Tamil", child: MaterialApp(home:Home(),)));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text("InheritedWidget"),
      backgroundColor: Colors.red,
    ),
      body: Center(child: Text(MyInheritedWidget
          .of(context)
          .data),),

    );
  }
}
