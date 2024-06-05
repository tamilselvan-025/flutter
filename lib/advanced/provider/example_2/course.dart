import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/provider/example_2/change_course.dart';
import 'package:provider/provider.dart';

class MyCourse extends StatelessWidget {
  final String course;
  const MyCourse({required this.course,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        String retValue=Provider.of<ChangeCourse>(context,listen: false).changeName(course);
        debugPrint("retValue : $retValue");
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height / 10,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red[300],
          borderRadius: const BorderRadius.all(Radius.elliptical(10, 20)),
          border: Border.all(color: Colors.black,width: 2),
        ),
        alignment: Alignment.center,
        child:  Text(course),
      ),
    );
  }
}
