
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Page1(),
  ));
}

class Page1 extends StatefulWidget {
 final String? demo;
   const Page1({super.key, this.demo});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  String? demo2;

  @override
  void initState() {
    demo2=widget.demo;
    debugPrint("demo2-----$demo2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page1"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async{
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>const Page2()));

                },
                child: const Text("Page2")),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) =>const Page3()));
            }, child: const Text("Page3")),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page3"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Page1(demo: "Vignesh"
                  ,)), (route)
                => false);

                },
                child: const Text("Page1")),
          ],
        ),
      ),
    );
  }
}

// Future<Object> popUntil(BuildContext context, Object object) {
//
//   while(routeName =="/first"){
//     Navigator.pop(context,"object");
//   }
//   return Future.value(object);
// }

Future<Object> popUntil(BuildContext context, RoutePredicate predicate,Object object) async{
   Navigator.of(context).popUntil(predicate);
    return Future.value(object);
}
