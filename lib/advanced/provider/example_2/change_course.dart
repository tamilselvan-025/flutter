import 'package:flutter/cupertino.dart';

class ChangeCourse extends ChangeNotifier{
  String courseName='';

  String changeName(String newCourseName){
    courseName=newCourseName;
    notifyListeners();
    return courseName;
  }
}
