import 'package:flutter/cupertino.dart';

//Alert dialog box
void main() {
  runApp(CupertinoApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:const CupertinoNavigationBar(
        middle: Text('Cupertino Example'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () => showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text('Cupertino Alert Dialog'),
                content:const Text('This is an example of a Cupertino alert dialog.'),
                actions: [
                  CupertinoDialogAction(
                    child:const Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            },
          ),
          color: CupertinoColors.activeBlue,
          child:const Text('Show Cupertino Alert Dialog'),

        ),
      ),
    );
  }
}