import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: (settings){},
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold :AppBar",),
      ),
      body: const Text("Scaffold : body"),
    ),
    title: "Material app : title",
    debugShowCheckedModeBanner: false,
    theme: ThemeSettings.lightTheme,
    darkTheme: ThemeSettings.darkTheme,
    themeMode: ThemeMode.system,
  )
  );
}
