import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/project/signup/input_decorator.dart';
import 'package:flutter_basics/storage/shared_pref/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  SharedPreferences? preferences;
  String stringField = '';
  int integerField = 0;
  double doubleField = 0;
  bool booleanField = false;
  bool _isLoading = true;
  List<String> listField = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    preferences = await SharedPreferences.getInstance();
    // stringField = preferences!.getString('stringField') ?? '';
    // integerField = preferences!.getInt('integerField') ?? 0;
    // doubleField = preferences!.getDouble('doubleField') ?? 0;
    // booleanField = preferences!.getBool('booleanField') ?? false;
    // listField = preferences!.getStringList('listField') ?? [];

    debugPrint("stringField  $stringField");
    debugPrint("integerField  $integerField");
    debugPrint("doubleField  $doubleField");
    debugPrint("booleanField  $booleanField");

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Pref'),
        backgroundColor: Colors.red,
      ),
      body: _isLoading
          ? const LinearProgressIndicator()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
                child: Column(
                  children: [
                    Text('stringField : $stringField'),
                    Text('integerField :$integerField'),
                    Text('doubleField :$doubleField'),
                    Text('booleanField :$booleanField'),
                    TextField(
                      decoration: loginInputDecorator(
                          hintText: "String", prefixIcon: Icons.abc, labelWidgetText: "Enter String"),
                      onChanged: (value) {
                        stringField = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: loginInputDecorator(
                          hintText: "Integer", prefixIcon: Icons.abc, labelWidgetText: "Enter Integer"),
                      onChanged: (value) {
                        integerField = int.parse(value);
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: loginInputDecorator(
                          hintText: "Double", prefixIcon: Icons.abc, labelWidgetText: "Enter Double"),
                      onChanged: (value) {
                        doubleField = double.parse(value);
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [DoubleInputFormatter()],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CheckboxListTile(
                      value: booleanField,
                      onChanged: (value) {
                        booleanField = value ?? false;
                        setState(() {});
                      },
                      title: const Text("Boolean"),
                      contentPadding: const EdgeInsets.all(10),
                      dense: true,
                      tileColor: Colors.redAccent,
                      splashRadius: 20,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(listField.toString()),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Data successfully Saved"),
                            duration: const Duration(seconds: 4),
                            showCloseIcon: true,
                            padding: const EdgeInsets.all(15),
                            elevation: 50,
                            backgroundColor: Colors.red[300],
                          ));
                          listField.add(stringField);
                          listField.add(integerField.toString());
                          listField.add(doubleField.toString());
                          listField.add(booleanField.toString());

                          debugPrint('listField : ${listField.toString()}');

                          preferences!.setString("stringField", stringField);
                          preferences!.setInt('integerField', integerField);
                          preferences!.setDouble('doubleField', doubleField);
                          preferences!.setBool('booleanField', booleanField);
                          preferences!.setStringList('listField', listField);
                          setState(() {});
                        },
                        child: const Text("Save")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SecondPage()));
                        },
                        child: const Text("SecondPage"))
                  ],
                ),
              ),
            ),
    );
  }
}

class DoubleInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only digits, dot, and a single leading minus sign
    final RegExp regExp = RegExp(r'^-?\d*\.?\d*$');
    if (!regExp.hasMatch(newValue.text)) {
      // If the new value doesn't match the pattern, revert to the old value
      return oldValue;
    }
    // If the value matches the pattern, return the new value
    return newValue;
  }
}
