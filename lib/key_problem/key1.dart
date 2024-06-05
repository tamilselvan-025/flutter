import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({super.key});

  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    const StatefulColorfulTile(
      Colors.red,
      key: Key("Tile1"),
    ),
    const StatefulColorfulTile(
      Colors.green,
      key: Key("Tile2"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swap Using Keys"),
        backgroundColor: Colors.cyan,
      ),
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.swap_horiz_rounded),
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatefulColorfulTile extends StatefulWidget {
  final Color myColor;

  const StatefulColorfulTile(this.myColor, {super.key});

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.myColor,
        child: const Padding(padding: EdgeInsets.all(70)));
  }
}

