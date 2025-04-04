import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  static const name = 'animated_screen';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double newwidth = 100;
  double newheight = 100;
  double newborder = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated container')),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeOutCubic,
          width: newwidth,
          height: newheight,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(newborder),
          ),
          duration: Duration(milliseconds: 500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cambiarforma(),
        child: Text('Next'),
      ),
    );
  }

  void cambiarforma() {
    newwidth = Random().nextInt(300).toDouble();
    newheight = Random().nextInt(300).toDouble();
    newborder = Random().nextInt(100).toDouble();
    setState(() {});
  }
}
