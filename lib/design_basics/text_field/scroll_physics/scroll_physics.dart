import 'package:flutter/material.dart';

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
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text =
        '''Use SingleChildScrollView when you have a small, fixed number of children and want them to be scrollable.
It's suitable for cases where the content size is relatively small and won't impact performance significantly.
It's not recommended for large lists or grids where rendering all items at once would lead to performance issues. 
In such cases, consider using ListView or GridView with a builder constructor.''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollPhysics'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
            TextFieldWithName("No ScrollPhysics", null, textEditingController),
            TextFieldWithName("BouncingScrollPhysics",
                const BouncingScrollPhysics(), textEditingController),
            TextFieldWithName("ClampingScrollPhysics",
                const ClampingScrollPhysics(), textEditingController),
            TextFieldWithName("AlwaysScrollableScrollPhysics",
                const AlwaysScrollableScrollPhysics(), textEditingController),
            TextFieldWithName("NeverScrollableScrollPhysics",
                const NeverScrollableScrollPhysics(), textEditingController),
            TextFieldWithName("PageScrollPhysics", const PageScrollPhysics(),
                textEditingController),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }
}

class TextFieldWithName extends StatelessWidget {
  final String _text;
  final TextEditingController _textEditingController;
  final ScrollPhysics? _scrollPhysics;

  const TextFieldWithName(
      this._text, this._scrollPhysics, this._textEditingController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(_text),
      TextField(
        controller: _textEditingController,
        scrollPhysics: _scrollPhysics,
        maxLines: 3,
      ),
    ]);
  }
}
