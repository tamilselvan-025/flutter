import 'package:flutter/material.dart';
import 'package:flutter_basics/design_basics/list_view/list_view_builder.dart';

void main() {
  runApp(const MaterialApp(home: Home(),));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text("Text 1"),
            Container(
              height: 390,
              width: MediaQuery.of(context).size.width,
              color: Colors.teal,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (_,index){
                    return getWidget(index+1);
                  },
                itemCount: 4,
                padding: const EdgeInsets.all(20),
                //physics: const PageScrollPhysics(),
                shrinkWrap: true,
                  ),
            ),
            const Text("Text 2"),
          ],
        ),
      ),
    );
  }
}
