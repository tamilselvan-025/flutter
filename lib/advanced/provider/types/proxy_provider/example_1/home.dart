import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/provider/types/proxy_provider/example_1/model_class.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) {
        debugPrint("ChangeNotifierProvider called");
        return Counter();
      }),
      ProxyProvider<Counter, Logger>(
        update: (_, counterObject, loggerObject) {
          debugPrint("ProxyProvider called");
          return Logger(counterObject);
        },
      )
    ],
    child: const MaterialApp(
      home: Home(),
    ),
  )
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    final logger = Provider.of<Logger>(context);
    final counter = logger.counter;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProxyProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '${counter.value}',
            ),
            ElevatedButton(
              onPressed: () {
                counter.increment();
                logger.log();
                debugPrint("---------------------");
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
