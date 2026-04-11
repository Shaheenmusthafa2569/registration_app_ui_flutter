import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Sign_up_page.dart';
import 'package:lottie/lottie.dart';

class MyLoginpage extends StatelessWidget {
  final formkeykey = GlobalKey<FormState>();

  @override
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 209, 56),
      body: Padding(
        padding: const EdgeInsets.all(55.0),
        child: Center(
          child: Form(
            key: formkeykey,
            child: Column(
              children: [
                Text(
                  "Login",
                  style: GoogleFonts.arima(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Login to your account",
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 32, 81, 30),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text("Email", style: TextStyle(fontSize: 15)),
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is Required";
                    }
                    if (!value.contains("@") || !value.contains(".com")) {
                      return "invalid email";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    fillColor: const Color.fromARGB(255, 194, 252, 127),
                    filled: true,
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text("Password", style: TextStyle(fontSize: 15)),
                ),
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length > 6 || value.length < 6) {
                      return "Password should be 6 characters";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    fillColor: const Color.fromARGB(255, 194, 252, 127),
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkeykey.currentState!.validate()) {
                        print("valid");
                      }
                    },
                    child: Text("Login", style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 180, 42, 222),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mysignuppage(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Flexible(child: Center(child: Lottie.asset("assets/login.json"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
