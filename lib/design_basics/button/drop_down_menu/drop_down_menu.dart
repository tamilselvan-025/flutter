import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _location = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDownMenu"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Selected location : $_location'),
            DropdownMenu(
              dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                DropdownMenuEntry(
                  value: "India",
                  label: "India",
                ),
                DropdownMenuEntry(
                  value: "USA",
                  label: "USA",
                ),
                DropdownMenuEntry(
                    value: "Afghanistan",
                    label: "Afghanistan",// this value cant be seen in UI because the labelWidget overrides this
                    labelWidget: Text("Label Widget"),
                    leadingIcon: Text("leadingIcon Widget"),
                    trailingIcon: Text("trailingIcon Widget")),
                DropdownMenuEntry(value: "", label: "None", enabled: false),
              ],
              enableFilter: true,
              enableSearch: true,
              requestFocusOnTap: true,
              helperText: "helperText",// errorText overrides helperText
              hintText: "hintText",// this value cant be seen in UI because the 'label' property overrides this
              initialSelection: "India",
              trailingIcon: const Text("trailingIcon"),
              label: const Text("Label widget"),
              leadingIcon: const Text("LeadingIcon widget"),

              onSelected: (value) {
                if (value != null) {
                  _location = value;
                }
                setState(() {});
              },

            ),
          ],
        ),
      ),
    );
  }
}
