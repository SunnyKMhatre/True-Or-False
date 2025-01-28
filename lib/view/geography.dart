import 'package:flutter/material.dart';

class Geography extends StatefulWidget {
  const Geography({super.key});

  @override
  State<Geography> createState() => _GeographyState();
}

class _GeographyState extends State<Geography> {
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