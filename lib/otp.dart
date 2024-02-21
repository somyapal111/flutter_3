import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_3/verification.dart'; // Import Firebase Auth

class Otp extends StatefulWidget {
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = "";
  String smsCode = "";
  bool isLoading =
      false; // Flag to track whether OTP verification is in progress

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
                      decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image 14.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
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
                          const Positioned(
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
                                _verifyPhone(); // Start OTP verification
                              },
                              child: const Text(
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
                    left: 25,
                    top: 474,
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 43,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the first TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const TextField(
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
                          SizedBox(width: 11),
                          Container(
                            width: 43,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the second TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const TextField(
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
                          SizedBox(width: 11),
                          Container(
                            width: 43,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the second TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const TextField(
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
                          SizedBox(width: 11),
                          Container(
                            width: 43,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the second TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const TextField(
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
                          SizedBox(width: 11),
                          Container(
                            width: 43,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the second TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const TextField(
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
                          SizedBox(width: 11),
                          Container(
                            width: 43,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 199, 234,
                                  178), // Color for the second TextField
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const TextField(
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
                          // Add other OTP text fields here
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: isLoading
                        ? Container(
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : SizedBox(),
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
  void _verifyPhone() async {
    setState(() {
      isLoading = true; // Show circular progress indicator
    });

    // Function to verify the phone number
    void _verifyPhone() async {
      void verificationCompleted(AuthCredential phoneAuthCredential) {
        _auth.signInWithCredential(phoneAuthCredential).then((userCredential) {
          // Verification is successful, navigate to the next page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Verify()),
          );
        }).catchError((error) {
          // Handle error
          print("Error verifying OTP: $error");
        });
      }

      void verificationFailed(FirebaseAuthException authException) {
        print('Phone number verification failed. Code: ${authException.code}');
        // Handle the verification failure
      }

      void codeSent(String verificationId, [int? forceResendingToken]) {
        this.verificationId = verificationId;
      }

      try {
        await _auth.verifyPhoneNumber(
          phoneNumber: '+91', // Replace with user's phone number input
          timeout: const Duration(seconds: 120),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: (String verificationId) {
            this.verificationId = verificationId;
          },
        );
      } catch (e) {
        print("Error verifying phone number: $e");
      }
    }
  }
}
