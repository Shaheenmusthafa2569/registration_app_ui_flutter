import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/login.dart';

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
    return Flexible(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 138, 209, 56),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(55.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Text(
                    "Sign up",
                    style: GoogleFonts.arima(
                      // fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Create an account to enter",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 32, 81, 30),
                      fontSize: 16,
                      // fontStyle: FontStyle.italic,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Username",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  TextFormField(
                    controller: username,
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
                      fillColor: const Color.fromARGB(255, 194, 252, 127),
                      filled: true,
                    ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  TextFormField(
                    controller: email,
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
                      fillColor: const Color.fromARGB(255, 194, 252, 127),
                      filled: true,
                    ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  TextFormField(
                    obscureText: visiblepassword,
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the Passsword";
                      }
                      if (value.length > 6 || value.length < 6) {
                        return "Password must be 6 characters";
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visiblepassword = !visiblepassword;
                          });
                        },
                        icon: visiblepassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      fillColor: const Color.fromARGB(255, 194, 252, 127),
                      filled: true,
                    ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Confirm Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  TextFormField(
                    obscureText: visibleConfirmedpassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the Passsword";
                      }
                      if (value != password.text) {
                        return "Password does not match";
                      }
                      return null;
                    },
                    controller: confirmpassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibleConfirmedpassword =
                                !visibleConfirmedpassword;
                          });
                        },
                        icon: visibleConfirmedpassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 162, 14, 255),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      fillColor: const Color.fromARGB(255, 194, 252, 127),
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        print("valid");
                      }
                    },
                    child: Text("Sign up"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 180, 42, 222),
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.black, width: 0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyLoginpage(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
