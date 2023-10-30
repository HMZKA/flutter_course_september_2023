import 'package:flutter/material.dart';

class AnimationTweenScreen extends StatefulWidget {
  const AnimationTweenScreen({super.key});

  @override
  State<AnimationTweenScreen> createState() => _AnimationTweenScreenState();
}

class _AnimationTweenScreenState extends State<AnimationTweenScreen> {
  var color = Colors.blue;
  animatedColor() {
    if (color == Colors.blue) {
      color = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation Tween Screen")),
      body: Center(
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 850),
          onEnd: () {
            setState(() {
              animatedColor();
            });
          },
          tween: Tween(begin: 100, end: 400),
          builder: (BuildContext context, dynamic value, Widget? child) {
            return AnimatedContainer(
              color: color,
              width: value,
              height: value,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
            );
          },
        ),
      ),
    );
  }
}
