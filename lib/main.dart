import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          elevation: 20,
          leading: Icon(Icons.menu),
          title: Text("My Application"),
          actions: [Icon(Icons.call), Icon(Icons.menu_book)],
        ),
        body: Center(child: Text("Welcome to our application")),
      ),
    );
  }
}
