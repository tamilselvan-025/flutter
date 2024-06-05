import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  String contents='';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var url = Uri.https(
      'blingcubedev.quikallot.com', // Host
      '/api/v1/product/user-products/04d20fa6-0b63-488a-ae52-ae0ef83ff6d5', );


    final response = await http.get(url);
    if (response.statusCode == 200) {
      debugPrint('----------response.statusCode == 200----------');
      String string=response.body;
      debugPrint(string,wrapWidth:100000);//doubt ask to TL
      List list=jsonDecode(response.body)["data"]["list"] as List ;
      for(int i=0;i<list.length;i++){
        contents="$contents ${list[i]["categoryId"]} : ${list[i]["categoryName"]} \n";
      }
      //myPrint(screen:"MyScreen" , data:jsonDecode(response.body));
      //debugPrint('${jsonDecode(response.body)}',wrapWidth:30000);
      setState(() {
        _isLoading=false;
      });
    } else {
      throw Exception("Failed to load Data ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HttpPage"),
          backgroundColor: Colors.red,
        ),
        body: _isLoading
            ? const LinearProgressIndicator()
            : Center(
                child: Text(contents),
              ));
  }
}
