import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          leading: Icon(
            Icons.menu,
            color: Colors.amber,
          ),
          title: Text("First Project"),
          actions: [Icon(Icons.call), Icon(Icons.video_call)],
        ),
      ),
    );
  }
}
