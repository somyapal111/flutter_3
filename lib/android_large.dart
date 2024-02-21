import 'package:flutter/material.dart';

class android extends StatefulWidget {
  @override
  State<android> createState() => _androidState();
}

class _androidState extends State<android> {
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
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: 284,
                    top: 11,
                    child: Container(
                      width: 59,
                      height: 59,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image 9.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -28,
                    top: 572,
                    child: Container(
                      width: 417,
                      height: 230,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image 18.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 46,
                    top: 106,
                    child: Text(
                      'थोक विक्रता को जानिए',
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
                    left: 81,
                    top: 212,
                    child: Container(
                      width: 198,
                      height: 256,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 61,
                            top: 0,
                            child: Container(
                              width: 77,
                              height: 78,
                              decoration: const ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      ""),
                                  fit: BoxFit.fill,
                                ),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 17,
                            top: 109,
                            child: SizedBox(
                              width: 163,
                              child: Text(
                                'मोहन राजपूत',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontFamily: 'Tiro Devanagari Hindi',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 23,
                            top: 172,
                            child: Text(
                              '93999XXXXX',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: 'Tiro Devanagari Hindi',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 0,
                            top: 224,
                            child: Text(
                              'पता : प्रताप विहार मंडी',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: 'Tiro Devanagari Hindi',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
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
