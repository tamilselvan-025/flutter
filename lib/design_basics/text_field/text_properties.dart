import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("value : $value"),
            TextField(
              autofocus: true,
              onTapOutside: (_){
                debugPrint('onTapOutside called');
              },
              //dragStartBehavior:DragStartBehavior.down ,//doubt
              //enabled: false,
              //enableIMEPersonalizedLearning:false ,
              //enableInteractiveSelection: false,
              keyboardAppearance: Brightness.light, //works only on IOS
              obscuringCharacter: '*',
              // autofillHints:const [AutofillHints.password],//won't work until we upload it on play store or app store
              onChanged: (data) {
                debugPrint('Text field onChanged called');
                value = data;
                setState(() {});
                debugPrint('value $value');
              },
              onTap: () {
                debugPrint('Text field tapped');
              },
              onSubmitted: (data) {
                debugPrint('Text field submitted .');
                debugPrint('data : $data');
              },
              autocorrect: true,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              //maxLength: 20,

              decoration: const InputDecoration(
                label: Text("label widget"),
                hintText: "hint text",
                hintTextDirection: TextDirection.rtl,
                icon: Icon(Icons.security),
                prefixIcon: Icon(Icons.add_call),
                prefixText: "prefix text",
                //  suffix: Icon(Icons.account_box_sharp),
                counterText: "counter text",
                //replaces max value text with empty string
                suffixIcon: Icon(Icons.account_tree),
                suffixText: "Suffix text",
                border: OutlineInputBorder(
                  gapPadding: 20,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30),
                    right: Radius.circular(30),
                  ),
                ),
                error: Text("Error widget"),
                fillColor: Colors.yellow,
                filled: true,
                hintFadeDuration: Duration(seconds: 2),
                alignLabelWithHint: true,
                focusColor: Colors.deepOrangeAccent,
                hoverColor: Colors.green,
              ),
                textInputAction: TextInputAction.search,
              // readOnly: true,// check the use of context.readOnly in TextFieldBloc
              
              obscureText: true,
              //readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
