import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/tasks_given_by_tl/encrypted_shared_preferences/home_page.dart';
import 'package:flutter_basics/user_intimation/snack_bar.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool loading = true;
  EncryptedSharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    getSharedPref();
  }

  void getSharedPref() async {
    sharedPreferences =  EncryptedSharedPreferences.getInstance();
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
            const Text("Key 1 : $key1"),
            SharedBuilder(
              listenKeys:const {key1},
              builder: (sharedPreferences){
                return Column(
                  children: [
                    Text(sharedPreferences.getString('stringField') ?? 'Empty String'),
                    Text(sharedPreferences.getInt('integerField')?.toString() ?? 'Empty Integer'),
                    Text(sharedPreferences.getDouble('doubleField')?.toString() ?? 'Empty double'),
                    Text(sharedPreferences.getBoolean('booleanField')?.toString() ?? 'Empty boolean'),
                    Text(sharedPreferences.getBoolean('isPremium')?.toString() ?? 'Empty isPremium'),

                    ElevatedButton(
                        onPressed: () {
                          sharedPreferences.remove('stringField');
                          sharedPreferences.remove('integerField');
                          sharedPreferences.remove('doubleField');
                          sharedPreferences.remove('booleanField');

                          ScaffoldMessenger.of(context)
                              .showSnackBar(getSnackBar(const
                          Text("All data deleted successfully..!"), context));
                          Future.delayed(const Duration(seconds:3),()=> Navigator.of(context).pop());
                        },
                        child: const Text("Delete all and Back")),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
