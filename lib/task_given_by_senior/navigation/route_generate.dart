import 'package:flutter/material.dart';
import 'package:flutter_basics/task_given_by_senior/navigation/screen_four.dart';
import 'package:flutter_basics/task_given_by_senior/navigation/screen_one.dart';
import 'package:flutter_basics/task_given_by_senior/navigation/screen_three.dart';
import 'package:flutter_basics/task_given_by_senior/navigation/screen_two.dart';


class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    var uri = settings.name;
    if (uri == '/') {
      final String? navigation = (settings.arguments) as String?;
      return MaterialPageRoute(
          builder: (context) => FirstScreen(navigation: navigation,)
      );
    }
    else if (uri == '/second') {
      final String? navigation = (settings.arguments) as String?;
      return MaterialPageRoute(
          builder: (context) => SecondScreen( navigation: navigation,)
      );
    }
    else if (uri == '/third') {
      final String? navigation = (settings.arguments) as String?;
      return MaterialPageRoute(
          builder: (context) => ThirdScreen( navigation: navigation,)
      );
    }
    else if (uri == '/fourth') {
      final String? navigation = (settings.arguments) as String?;
      return MaterialPageRoute(
          builder: (context) => FourthScreen( navigation: navigation,)
      );
    }
    return null;
  }
}
