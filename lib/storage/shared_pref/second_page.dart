import 'package:flutter/material.dart';
import 'package:flutter_basics/user_intimation/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool loading = true;
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    getSharedPref();
  }

  void getSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondPage"),
        backgroundColor: Colors.red,
      ),
      body: loading
          ? const LinearProgressIndicator()
          : Center(
              child: Column(
                children: [
                  Text(sharedPreferences!.getString('stringField') ?? 'Empty String'),
                  Text(sharedPreferences!.getInt('integerField')?.toString() ?? 'Empty Integer'),
                  Text(sharedPreferences!.getDouble('doubleField')?.toString() ?? 'Empty double'),
                  Text(sharedPreferences!.getBool('booleanField')?.toString() ?? 'Empty boolean'),
                  Text(sharedPreferences!.getStringList('listField')?.toString() ?? 'Empty list'),
                  ElevatedButton(
                      onPressed: () {
                        sharedPreferences!.remove('stringField');
                        sharedPreferences!.remove('integerField');
                        sharedPreferences!.remove('doubleField');
                        sharedPreferences!.remove('booleanField');
                        sharedPreferences!.remove('listField');
                        ScaffoldMessenger.of(context)
                            .showSnackBar(getSnackBar(const
                        Text("All data deleted successfully..!"), context));
                      Future.delayed(const Duration(seconds:3),()=> Navigator.of(context).pop());

                      },
                      child: const Text("Delete all and Back")),
                ],
              ),
            ),
    );
  }
}
