import 'package:flutter/material.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/back_with_result/second_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: FirstScreen(),
  ));
}



class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Map<String, String> dataMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstScreen"),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: Column(

        children: [
          ..._toList(dataMap),
          ElevatedButton(onPressed: ()async{
           dataMap= await Navigator.push(context,MaterialPageRoute(builder: (context)=>const SecondPage()));
            setState(() {});
           },
            child: const Text("Next Page"),
          ),
        ],

      )),
    );
  }
}
List<Widget> _toList( Map<String, String> map){
  debugPrint('_toList called');
  if(map.isEmpty){
    return const [Text("No Data")];
  }
  List<Widget> returnList=[];
   map.forEach((key, value) =>returnList.add( Text('$key : $value')) ,);
  return returnList;
}