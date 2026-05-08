import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/login.dart';
import 'package:login_page/service.dart';

class Mysignuppage extends StatefulWidget {
  @override
  State<Mysignuppage> createState() => _MysignuppageState();
}

class _MysignuppageState extends State<Mysignuppage> {
  final formkey = GlobalKey<FormState>();

  bool visiblepassword = true;
  bool visibleConfirmedpassword = true;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Removed Flexible from here as it's the top-level return
    return Scaffold(
      backgroundColor: const Color(0xFF0A192F),
      body: Center(
        child: SingleChildScrollView( // Added to prevent overflow on small screens
          child: Padding(
            padding: const EdgeInsets.all(55.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign up",
                    style: GoogleFonts.playfairDisplay( // Updated to playfairDisplay
                      color: const Color(0xFFE6F1FF),
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Create an account to enter",
                    style: TextStyle(
                      color: Color(0xFF8892B0),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Username",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Color(0xFF8892B0)),
                    ),
                  ),
                  TextFormField(
                    controller: username,
                    style: const TextStyle(color: Colors.white), // Input text color
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      fillColor: const Color(0xFF112240),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Email",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Color(0xFF8892B0)),
                    ),
                  ),
                  TextFormField(
                    controller: email,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is Required";
                      }
                      if (!value.contains("@") || !value.contains(".com")) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      fillColor: const Color(0xFF112240),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Color(0xFF8892B0)),
                    ),
                  ),
                  TextFormField(
                    obscureText: visiblepassword,
                    controller: password,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the Passsword";
                      }
                      if (value.length != 6) {
                        return "Password must be 6 characters";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visiblepassword = !visiblepassword;
                          });
                        },
                        icon: visiblepassword
                            ? const Icon(Icons.visibility, color: Color(0xFF8892B0))
                            : const Icon(Icons.visibility_off, color: Color(0xFF8892B0)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      fillColor: const Color(0xFF112240),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Confirm Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Color(0xFF8892B0)),
                    ),
                  ),
                  TextFormField(
                    obscureText: visibleConfirmedpassword,
                    controller: confirmpassword,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the Passsword";
                      }
                      if (value != password.text) {
                        return "Password does not match";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibleConfirmedpassword = !visibleConfirmedpassword;
                          });
                        },
                        icon: visibleConfirmedpassword
                            ? const Icon(Icons.visibility, color: Color(0xFF8892B0))
                            : const Icon(Icons.visibility_off, color: Color(0xFF8892B0)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      fillColor: const Color(0xFF112240),
                      filled: true,
                    ),
                  ),

                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity, // Button spans width
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Signup(
                            username.text,
                            email.text,
                            password.text,
                            context,
                          );
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD4AF37), // Deep Gold
                        foregroundColor: const Color(0xFF0A192F), // Midnight Navy text
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Color(0xFF8892B0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyLoginpage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            color: Color(0xFF8892B0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}