import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/provider/example_2/change_course.dart';
import 'package:flutter_basics/advanced/provider/example_2/course.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ChangeCourse(),
    child: const MaterialApp(
      home: Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 10,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: const BorderRadius.all(Radius.elliptical(10, 20)),
                border: Border.all(color: Colors.black, width: 2),
              ),
              alignment: Alignment.center,
              child: Selector<ChangeCourse,String>(
                  builder: (context, changeCourseObject, child) {
                    debugPrint("changeCourseObject in builder: $changeCourseObject");
                    return Text("Current learning course :${changeCourseObject.toString()}");
                  },
                  selector: (context, changeCourseObject) {
                    debugPrint("changeCourseObject in selector: ${changeCourseObject.toString()}");
                    return changeCourseObject.courseName;
                  }),
            ),
            const MyCourse(course: "Dart"),
            const MyCourse(course: "Flutter"),
            const MyCourse(course: "Java"),
          ],
        ),
      ),
    );
  }
}
