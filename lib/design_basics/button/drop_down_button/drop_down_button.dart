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
  String location = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDownButton'),
      ),
      body: Center(
        child: Row(
          children: [
            Text(location.isEmpty ? 'Choose Location' : 'Selected location : $location'),
            DropdownButton(
                elevation: 25,
                menuMaxHeight: 150,
                items: [
                  DropdownMenuItem(
                    value: "India",
                    child: const Text('India'),
                    onTap: () {
                      debugPrint('DropdownMenuItem (onTap()) called');
                    },
                  ),
                  const DropdownMenuItem(
                    value: "USA",
                    child: Text('USA'),
                  ),
                  const DropdownMenuItem(
                    value: "Afghanistan",
                    child: Text('Afghanistan'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    location = value;
                    setState(() {});
                  }
                }),
          ],
        ),
      ),
    );
  }
}
