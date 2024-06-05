import 'package:flutter/material.dart';
import 'package:flutter_basics/material_app/routes/on_generate_and_unknown/error.dart';
import 'package:flutter_basics/material_app/routes/on_generate_and_unknown/first_page.dart';
import 'package:flutter_basics/material_app/routes/on_generate_and_unknown/home_page.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    var uri = settings.name;
    if (uri == '/') {
      return MaterialPageRoute(builder: (context) => const HomePage());
    }
    else if (uri == '/next') {
      final String name = (settings.arguments) as String;
      return MaterialPageRoute(builder: (context) => FirstPage(name));
    }

  }
  static Route<dynamic>? generateUnknown(RouteSettings settings) {
    final data=settings.arguments;
    return MaterialPageRoute(builder: (context) => ErrorScreen(data));
  }
}
