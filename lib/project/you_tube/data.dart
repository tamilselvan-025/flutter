import 'package:flutter/material.dart';

class SearchData extends StatelessWidget {
  final String data;
  const SearchData(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(data),),);
  }
}
