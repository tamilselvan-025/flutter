import 'package:flutter/material.dart';
import 'package:flutter_basics/storage/future/http_response/customer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  User? user;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      debugPrint('if called');
      debugPrint('${jsonDecode(response.body)[1]}');
      setState(() {
        user = User.fromJson(jsonDecode(response.body)[1]);
        debugPrint('setState called');
      });
    } else {
      throw Exception("Failed to load Data of customer");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HttpPage"),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: user != null ? Text(user.toString()) : const LinearProgressIndicator(),
        ));
  }
}
