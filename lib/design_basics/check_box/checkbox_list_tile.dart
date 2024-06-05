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
  bool? isChecked;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckBoxListView"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: CheckboxListTile(
          onChanged: (value) {
            isChecked = value;
            if (value != null &&value) {
                isSelected=true;
            }
            else {
              isSelected=false;
            }
            setState(() {});
          },
          value: isChecked,
          title: const Text("Title Widget"),
          splashRadius: 40,
          tristate: true,
          activeColor: Colors.pink,
          //checkboxSemanticLabel: "checkboxSemanticLabel text",//doubt
          checkColor: Colors.deepPurple,
          secondary:
              const Text("Secondary Widget \n second line \n third line"),
          subtitle: const Text("SubTitle Widget \n second line for subtitle "
              "\n third line \n fourth line \n fifth line \n sixth line"),
          dense: true,
          tileColor: Colors.cyan,
          isThreeLine: true,
          selected: isSelected,
          selectedTileColor: Colors.orange,
        ),
      ),
    );
  }
}
