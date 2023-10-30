import 'package:flutter/material.dart';
import 'package:flutter_application_course/animated_align.dart';
import 'package:flutter_application_course/animated_container_screen.dart';
import 'package:flutter_application_course/animation_tween_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: AnimatedAlignScreen());
  }
}
