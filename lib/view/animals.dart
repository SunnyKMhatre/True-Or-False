import 'package:flutter/material.dart';

class Animals extends StatefulWidget {
  const Animals({super.key});

  @override
  State<Animals> createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/bg.png",
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,)
        ],
      ),
    );
  }
}