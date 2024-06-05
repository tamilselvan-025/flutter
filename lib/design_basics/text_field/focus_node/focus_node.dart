import 'package:flutter/material.dart';
import 'package:flutter_basics/design_basics/text_field/focus_node/second_page.dart';

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
  String dataFromTextField = '';
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FocusNode"),
      ),
      body: Center(
        child: TextField(
          focusNode: focusNode,
        onChanged: (data){dataFromTextField=data;},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (dataFromTextField.isEmpty) {
            focusNode!.requestFocus();
            debugPrint("if called . data:$dataFromTextField");
          } else {
            debugPrint("else called. data:$dataFromTextField");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchPage()));
          }
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
