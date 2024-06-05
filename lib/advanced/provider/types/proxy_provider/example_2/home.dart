import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/provider/types/proxy_provider/example_2/model_class.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      FutureProvider<String>(create: (_) {
        debugPrint("getName() future called");
        return getName();
      } , initialData: "Loading..."),
      FutureProvider<int>(create: (_){
        debugPrint("getId() future called");
        return getId();
      }, initialData: -1),
      ProxyProvider2<String, int, User>(update: (context, name, id, _) {
        debugPrint("ProxyProvider2 called");
        return User(name, id);
      })
    ],
    child: const MaterialApp(
      home: Home(),
    ),
  ));
}

Future<String> getName() {
  return Future.delayed(const Duration(seconds: 3), () => "Tamil");
}

Future<int> getId() {
  return Future.delayed(const Duration(seconds: 4), () => 2);
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    User user=Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProxyProvider"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text("UserName : ${user.name}"),
            Text("UserId : ${user.id}"),
          ],
        ),
      ),
    );
  }
}
