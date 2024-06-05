import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Formatter"),
      ),
      body: Center(
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(19),
            FilteringTextInputFormatter.digitsOnly,
            CardNumberFormatter(),
          ],
        ),
      ),
    );
  }
}


class CardNumberFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String oldText = oldValue.text;
    String newText = newValue.text;


     StringBuffer formattedNewText = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i!=0&&i % 4 == 0 ) {
        formattedNewText.write(' ');
      }
      formattedNewText.write(newText[i]);
    }
    debugPrint('----------oldText : $oldText , newText :$newText , formattedNewText : $formattedNewText ---------- ');
    return TextEditingValue(
      text: formattedNewText.toString(),
    );

  }

}


