import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 800,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Color(0xFFFFFBF9)),
              child: Stack(
                children: [
                  Positioned(
                    left: 285,
                    top: 14,
                    child: Container(
                      width: 59,
                      height: 59,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image 9.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 103,
                    child: Container(
                      width: 360,
                      height: 297,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image 16.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 102,
                    top: 390,
                    child: Text(
                      'सफलतापूर्वक',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Tiro Devanagari Hindi',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 38,
                    top: 433,
                    child: SizedBox(
                      width: 299,
                      child: Text(
                        'आपका खाता साइन इन हो गया है',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Tiro Devanagari Hindi',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -21,
                    top: 583,
                    child: Container(
                      width: 417,
                      height: 258,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image 18.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
