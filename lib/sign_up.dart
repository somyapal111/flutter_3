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
  TextEditingController mediumNameController =
      TextEditingController(); // Corrected variable name

  FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

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
                height: 59,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image 9.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
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
              buildTextField("पहला नाम", firstNameController),
              SizedBox(height: 20),
              buildTextField("मध्य नाम", mediumNameController),
              SizedBox(height: 20),
              buildTextField("अंतिम नाम", lastNameController),
              SizedBox(height: 20),
              buildTextField("मोबाइल नंबर", mobileController),
              SizedBox(height: 20),
              buildTextField("ईमेल आईडी", emailController),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 112,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate input fields
                      if (!_isValidName(firstNameController.text)) {
                        // Show error message for invalid name
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Invalid first name'),
                        ));
                        return;
                      }

                      if (!_isValidName(mediumNameController.text)) {
                        // Show error message for invalid name
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Invalid middle name'),
                        ));
                        return;
                      }

                      if (!_isValidName(lastNameController.text)) {
                        // Show error message for invalid name
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Invalid last name'),
                        ));
                        return;
                      }

                      if (!_isValidPhoneNumber(mobileController.text)) {
                        // Show error message for invalid phone number
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Invalid phone number'),
                        ));
                        return;
                      }

                      if (!_isValidEmail(emailController.text)) {
                        // Show error message for invalid email
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Invalid email address'),
                        ));
                        return;
                      }

                      // Sign up logic
                      try {
                        UserCredential userCredential =
                            await _auth.createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password:
                              "password", // Provide a default password for now
                        );
                        // Navigate to the sign-in page or the next screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      } catch (e) {
                        // Handle sign-up errors
                        print("Failed to sign up: $e");
                        // Show an error dialog or snackbar
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 64, 112, 88),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
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
                height: 230,
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

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
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
