import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter_3/verification.dart';
// Import the page you want to navigate to

class Otp extends StatefulWidget {
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = "";

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
              decoration: BoxDecoration(color: Color(0xFFFFFCFA)),
              child: Stack(
                children: [
                  Positioned(
                    left: 284,
                    top: 12,
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
                    left: 4,
                    top: 94,
                    child: Container(
                      width: 356,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image 14.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 31,
                    top: 425,
                    child: SizedBox(
                      width: 324,
                      height: 28,
                      child: Text(
                        'ओटीपी दर्ज करें',
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
                    left: 56,
                    top: 543,
                    child: Container(
                      width: 246,
                      height: 21,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'ओटीपी प्राप्त नहीं हुआ ?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Tiro Devanagari Hindi',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 149,
                            top: 0,
                            child: GestureDetector(
                              onTap: () {
                                // Handle onTap action here
                              },
                              child: Text(
                                'ओटीपी पुनः भेजें',
                                style: TextStyle(
                                  color: Color(0xFF407058),
                                  fontSize: 16,
                                  fontFamily: 'Tiro Devanagari Hindi',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 31,
                    top: 474,
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 56,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the first TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              maxLength: 1, // Allow only one character input
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                counterText: '', // Hide the character counter
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide.none, // Remove border line
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: TextStyle(
                                  fontSize: 20), // Adjust font size as needed
                            ),
                          ),
                          SizedBox(width: 25),
                          Container(
                            width: 56,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the second TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(width: 25),
                          Container(
                            width: 56,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the third TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(width: 25),
                          Container(
                            width: 56,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the fourth TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: TextStyle(fontSize: 20),
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

  // Function to verify the phone number
  Future<void> _verifyPhone() async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      // Navigate to the next page after verification is completed
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Verify()),
      );
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Phone number verification failed. Code: ${authException.code}');
      // Handle the verification failure
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      this.verificationId = verificationId;
      // Navigate to the screen where user can enter the OTP
      // For example:
      // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpInputScreen()));
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
      phoneNumber: '+911234567890', // Replace with user's phone number input
      timeout: const Duration(seconds: 5),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}
