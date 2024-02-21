import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_3/sign-in.dart'; // Import Firebase Auth

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mediumNameController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance
  bool _isLoading = false;

  // Function to validate email address
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Function to validate phone number
  bool _isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'^[0-9]{10}$').hasMatch(phoneNumber);
  }

  // Function to validate name (only checks if it's not empty)
  bool _isValidName(String name) {
    return name.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF0EDE8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 14,
              ),
              Container(
                width: 59,
                height: 61,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image 9.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 40),
              const Center(
                child: Text(
                  'यूजर पंजीकरण',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Tiro Devanagari Hindi',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(height: 30),
              buildTextField(
                  "पहला नाम", firstNameController, TextInputType.name),
              SizedBox(height: 20),
              buildTextField(
                  "मध्य नाम", mediumNameController, TextInputType.name),
              SizedBox(height: 20),
              buildTextField(
                  "अंतिम नाम", lastNameController, TextInputType.name),
              SizedBox(height: 20),
              buildTextField(
                  "मोबाइल नंबर",
                  mobileController,
                  TextInputType
                      .number), // Set keyboardType to TextInputType.phone
              SizedBox(height: 20),
              buildTextField(
                  "ईमेल आईडी",
                  emailController,
                  TextInputType
                      .emailAddress), // You can set the keyboardType to TextInputType.emailAddress for email
              SizedBox(height: 20),
              Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: 112,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });

                            // Validate input fields
                            if (!_isValidName(firstNameController.text) ||
                                !_isValidName(lastNameController.text) ||
                                !_isValidPhoneNumber(mobileController.text) ||
                                !_isValidEmail(emailController.text)) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Invalid input(s)'),
                              ));
                              setState(() {
                                _isLoading = false;
                              });
                              return;
                            }

                            // Sign up logic
                            try {
                              UserCredential userCredential =
                                  await _auth.createUserWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: "password",
                              );
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                            } catch (e) {
                              print("Failed to sign up: $e");
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 64, 112, 88),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'आगे बढ़ें',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontFamily: 'Tiro Devanagari Hindi',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
              ),
              Container(
                width: 400,
                height: 215,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image 18.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: keyboardType, // Set the keyboardType
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 53, 53, 53),
              fontSize: 16,
              fontFamily: 'Tiro Devanagari Hindi',
              fontWeight: FontWeight.w400,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(120.0),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(120)),
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20), // Padding on the left and right
          ),
        ),
      ],
    );
  }
}
