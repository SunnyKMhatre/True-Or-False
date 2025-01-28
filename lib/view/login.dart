import 'package:flutter/material.dart';
import 'package:true_false/view/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Image.asset(
            "assets/bg.png",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/true false icon.png"),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => True_False()));
                      },
                      child: Text("Start")),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
