import 'package:flutter/material.dart';

class Plants extends StatefulWidget {
  const Plants({super.key});

  @override
  State<Plants> createState() => _PlantsState();
}

class _PlantsState extends State<Plants> {
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