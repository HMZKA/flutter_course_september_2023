import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double radius = 0;
  var color = Colors.blue;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (radius == 0) {
        setState(() {
          radius = 50;
          color = Colors.red;
        });
      } else {
        setState(() {
          radius = 0;
          color = Colors.blue;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    );
  }
}
