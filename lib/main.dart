import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            elevation: 10,
            leading: const Icon(Icons.menu),
            title: const Text("My Application"),
            actions: [const Icon(Icons.call), const Icon(Icons.menu_book)],
          ),
          body: Container(
            color: Colors.amber,
            height: double.infinity,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "First Text",
                  style: TextStyle(fontSize: 20),
                ),
                Text("Second Text", style: TextStyle(fontSize: 20)),
                Text("Third Text", style: TextStyle(fontSize: 20)),
                // Text("Fourth Text", style: TextStyle(fontSize: 20)),
              ],
            ),
          )),
    );
  }
}
