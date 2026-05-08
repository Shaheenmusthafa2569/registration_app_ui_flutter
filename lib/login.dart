import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Sign_up_page.dart';
import 'package:login_page/forgotpassword.dart';
import 'package:login_page/service.dart';
// import 'package:lottie/lottie.dart'; // Animation removed

class MyLoginpage extends StatefulWidget {
  @override
  State<MyLoginpage> createState() => _MyLoginpageState();
}

class _MyLoginpageState extends State<MyLoginpage> {
  final formkeykey = GlobalKey<FormState>();
  bool visible = true;
  
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Match Signup Background: Midnight Navy
      backgroundColor: const Color(0xFF0A192F), 
      body: Padding(
        padding: const EdgeInsets.all(55.0),
        child: Center(
          child: SingleChildScrollView( // Added scroll to prevent overflow
            child: Form(
              key: formkeykey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: GoogleFonts.playfairDisplay( // Match Signup Font
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFE6F1FF),
                    ),
                  ),
                  Text(
                    "Login to your account",
                    style: GoogleFonts.poppins( // Match Signup Body Font
                      fontSize: 16,
                      color: const Color(0xFF8892B0),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email", 
                      style: TextStyle(fontSize: 15, color: Color(0xFF8892B0))
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
                      fillColor: const Color(0xFF112240), // Match Signup Input Color
                      filled: true,
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password", 
                      style: TextStyle(fontSize: 15, color: Color(0xFF8892B0))
                    ),
                  ),
                  TextFormField(
                    obscureText: visible,
                    controller: password,
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length != 6) {
                        return "Password should be 6 characters";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon: visible
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
                    width: double.infinity, // Set to match button width style
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkeykey.currentState!.validate()) {
                          login(email.text, password.text, context);
                        }
                      },
                      child: Text(
                        "Login", 
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        )
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD4AF37), // Deep Gold
                        foregroundColor: const Color(0xFF0A192F), // Dark Navy text
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Myforgotpassword()),
                    ),
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Color(0xFF8892B0), decoration: TextDecoration.underline),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Color(0xFF8892B0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mysignuppage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            color: Color(0xFF8892B0)
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Animation removed using comments as requested
                  /*
                  Flexible(
                    child: Center(child: Lottie.asset("assets/login.json")),
                  ),
                  */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}