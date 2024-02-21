import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_3/sign_up.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 282,
          height: 121,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image 29.png'),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
