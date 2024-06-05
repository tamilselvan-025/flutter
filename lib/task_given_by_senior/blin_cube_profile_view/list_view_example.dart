import 'package:flutter/material.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     // physics: const NeverScrollableScrollPhysics(),
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        return getListTile(index + 1);
        },
      shrinkWrap: true,

      );

  }
}

ListTile getListTile(int count) {
  return ListTile(
    title: Text(
      "Product $count",
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    dense: true,
    splashColor: Colors.black12,
    horizontalTitleGap: 20,
    leading: const Icon(Icons.production_quantity_limits),
    trailing: const Icon(Icons.arrow_forward_sharp),
    iconColor: count % 2 != 0 ? Colors.blue[300] : Colors.yellow[300],
    tileColor: count % 2 == 0 ? Colors.blue[300] : Colors.yellow[300],
  );
}
