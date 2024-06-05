import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/project/signup/input_decorator.dart';
import 'package:flutter_basics/tasks_given_by_tl/encrypted_shared_preferences/second_page.dart';


const key1="123456789asdfghj";
const key2="123456789lkjhgfd";

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
  EncryptedSharedPreferences? preferences;
  String stringField = '';
  int integerField = 0;
  double doubleField = 0;
  bool booleanField = false;
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {

    await EncryptedSharedPreferences.initialize(key1);
    preferences = EncryptedSharedPreferences.getInstance();


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

              ElevatedButton(
                  onPressed: () async{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Data successfully Saved"),
                      duration: const Duration(seconds: 4),
                      showCloseIcon: true,
                      padding: const EdgeInsets.all(15),
                      elevation: 50,
                      backgroundColor: Colors.red[300],
                    ));
                    await preferences!.setBoolean('isPremium', true, notify: false);
                    await preferences!.setString("stringField", stringField);
                    await preferences!.setInt('integerField', integerField);
                    await preferences!.setDouble('doubleField', doubleField);
                    await preferences!.setBoolean('booleanField', booleanField);
                    debugPrint("isPremium ${preferences!.getBoolean('isPremium')}");
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
