import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignScreen extends StatefulWidget {
  const AnimatedAlignScreen({super.key});

  @override
  State<AnimatedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen> {
  bool isTapped = false;
  int index = 0;
  List alignmnts = [
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.center,
    Alignment.centerRight,
    Alignment.centerLeft,
  ];
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        index = Random().nextInt(8);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Align")),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: AnimatedAlign(
            alignment: alignmnts[index],
            duration: Duration(seconds: 3),
            child: GestureDetector(
              onTap: () {
                // setState(() {
                //   index = Random().nextInt(8);
                // });
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
              ),
            ),
          )),
    );
  }
}
