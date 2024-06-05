import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScrollController(),
  ));
}

class HomeScrollController extends StatefulWidget {
  const HomeScrollController({super.key});

  @override
  State<HomeScrollController> createState() => _HomeState();
}

class _HomeState extends State<HomeScrollController> {
  String _scrollLocation = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    String currentLocation = 'List In Start';
    if (_scrollController.offset == _scrollController.position.minScrollExtent) {
      currentLocation = 'Start';
    } else if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
      currentLocation = "End";
    } else {
      currentLocation = "Between";
    }
    _scrollLocation = "List In $currentLocation";
    setState(() {
      debugPrint('setState called');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _scrollLocation,
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 50,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return getListTile(index + 1);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              _scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeInExpo);
            },
            child: const Icon(Icons.arrow_upward_outlined),
          ),
          FloatingActionButton(
            onPressed: () {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(seconds: 1),
                curve: Curves.bounceIn,
              );
            },
            child: const Icon(Icons.arrow_downward_outlined),
          ),
        ],
      ),
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
