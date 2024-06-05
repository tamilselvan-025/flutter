import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

bool isSelected = false;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert box task"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: TextField(
                      controller: _textEditingController,
                    ),
                    title: const Text("Title"),
                    actions: [
                      const MyElevatedButton(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          },
                        child: const Text("Back"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {});
                        },
                        child: const Text("Ok"),

                      )
                    ],
                  ),
                );
              },
              child: const Text("Click"),
            ),
            Text(' ${_textEditingController.text}'),
            Text('color = ${isSelected ? "Blue" : "Green"}'),
          ],
        ),
      ),
    );
  }
}

class MyElevatedButton extends StatefulWidget {
  const MyElevatedButton({super.key});

  @override
  State<MyElevatedButton> createState() => _CheckedBoxState();
}

class _CheckedBoxState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isSelected = !isSelected;
        setState(() {});
      },
      style: ElevatedButton.styleFrom(backgroundColor: isSelected ? Colors.blue : Colors.green),
      child: const Text(''),
    );
  }
}
