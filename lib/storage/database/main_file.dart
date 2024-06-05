import 'package:flutter/material.dart';
import 'package:flutter_basics/storage/database/database.dart';
import 'package:flutter_basics/storage/database/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DataBase handler;
  Future<int> addPlanets() async {
    User first =
    User(name: "A", age: 24, id: 1, salary: 10);
    User second =
    User(name: "B", age: 31, id: 2, salary: 20);
    User third =
    User(id: 3, name: 'C', age: 4, salary: 30);
    User fourth =
    User(id: 4, name: 'D', age: 5, salary: 40);

    List<User> users = [first, second,third,fourth];
    return await handler.insertUsers(users);
  }

  @override
  void initState() {
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() async {
      await addPlanets();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: handler.retrieveUsers(),
          builder:
              (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(snapshot.data![index].age.toString()),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
