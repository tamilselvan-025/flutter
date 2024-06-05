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
  TextEditingController textEditingController =
      TextEditingController();
  UndoHistoryController undoHistoryController=UndoHistoryController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      final String text = textEditingController.text.toUpperCase();
      textEditingController.value = textEditingController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
      debugPrint('-------------------------------');
    }
    );

  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    undoHistoryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextEditingFormatter"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              undoController:undoHistoryController ,
            ),
            ElevatedButton(onPressed:(){
              undoHistoryController.undo();
            }, child: const Text('Undo')),
            ElevatedButton(onPressed:(){
              undoHistoryController.redo();
            }, child: const Text('Redo')),
          ],
        ),
      ),
    );
  }
}
