import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String text = "Welcome to our application";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            elevation: 10,
            leading: Icon(Icons.menu),
            title: Text("My Application"),
            actions: [Icon(Icons.call), Icon(Icons.menu_book)],
          ),
          body: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(100)),
              width: 300,
              height: 200,
              child: const Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.amber,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )),
    );
  }
}
