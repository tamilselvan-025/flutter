import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  )
  );
}

class Home extends StatelessWidget {
 final String longString="""In Flutter, there isn't a specific maximum length for printing text using the print() 
 function. However, the maximum length of a single line of output might be limited by various factors:

Console or Terminal Width: When printing to a console or terminal, the maximum length of a line may be limited by the width of the console or terminal window. If the text exceeds this width, it might wrap onto multiple lines, making it harder to read.

Logging Libraries or Output Handlers: If you're using a logging library or output handler that wraps around print(), it might impose its own limits on the maximum length of the message it can handle.

Debugging Tools: In development environments, debugging tools may have their own limitations on the maximum length of messages they can display or handle efficiently.

Memory and Performance: Extremely long strings might consume significant memory and affect performance, especially on memory-constrained devices. Therefore, it's generally advisable to avoid excessively long messages.

If you need to handle long strings or debug large amounts of data, consider alternatives such as logging to a file or using specialized debugging tools. Additionally, if you find that long messages are causing issues or becoming unreadable, you can split them into smaller chunks or use techniques like pagination or summarization to make them more manageable.
""";
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Box'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                     // backgroundColor: Colors.black26,
                      title: const Text("Alert box Title"),
                      elevation: 50,
                      content:  Text(longString),
                      iconColor: Colors.green,
                      contentPadding: const EdgeInsets.all(30),
                      icon: const Icon(Icons.dangerous_outlined),
                      surfaceTintColor: Colors.yellow,
                      scrollable: true,
                      shadowColor: Colors.black12,
                      //alignment: Alignment.topCenter,
                      insetPadding:const EdgeInsets.only(top: 100,left: 30,right: 50,bottom: 70),
                      // actionsPadding:const EdgeInsets.only(right: 70),
                      // iconPadding: const EdgeInsets.only(top: 70),
                      //buttonPadding:const EdgeInsets.only(top: 70),
                      actions: [
                        TextButton(
                          onPressed: () {
                            //pop the alert dialog box
                            Navigator.of(context).pop();
                          },
                          child: const Text("Back"),
                        )
                      ],
                    ),
            );
          },
          child: const Text("Click..!"),
        ),
      ),
    );
  }
}
