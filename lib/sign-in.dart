import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_3/otp.dart'; // Assuming this is your Otp widget import

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController phoneNumberController = TextEditingController();

  Future<void> signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Otp()), // Pass verificationId here
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Failed to verify phone number: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(), // Pass verificationId here
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print(
              "Code auto-retrieval timed out with verification ID: $verificationId");
        },
      );
    } catch (e) {
      print("Error signing in with phone number: $e");
    }
  }

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
                    left: 285,
                    top: 14,
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
                  const Positioned(
                    left: 79,
                    top: 159,
                    child: Text(
                      ' साइन इन करें ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'Tiro Devanagari Hindi',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 24,
                    top: 258,
                    child: Text(
                      'अपना मोबाइल नंबर दर्ज करें',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Tiro Devanagari Hindi',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(left: 25, top: 361, child: Container()),
                  const Positioned(
                    left: 25,
                    top: 285,
                    child: Text(
                      '\nहम आपको एक पुष्टिकरण कोड भेजेंगे\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Tiro Devanagari Hindi',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 375,
                    child: Container(
                      width: 302,
                      child: TextField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "+91",
                          hintStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 44, 44, 44),
                            fontFamily: 'Tiro Devanagari Hindi',
                            fontWeight: FontWeight.w400,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 80,
                    top: 443,
                    child: ElevatedButton(
                      onPressed: () {
                        String phoneNumber = phoneNumberController.text.trim();
                        if (phoneNumber.isNotEmpty) {
                          signInWithPhone(context, phoneNumber);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please enter a valid phone number'),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 64, 112, 88),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'ओटीपी उत्पन्न करें',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Tiro Devanagari Hindi',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -24,
                    top: 569,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
