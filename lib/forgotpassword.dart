import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/service.dart';

class Myforgotpassword extends StatefulWidget {
  Myforgotpassword({super.key});

  @override
  State<Myforgotpassword> createState() => _MyforgotpasswordState();
}

class _MyforgotpasswordState extends State<Myforgotpassword> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Match the dark theme background
      backgroundColor: const Color(0xFF0A192F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A192F),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFE6F1FF)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Find your account",
              style: GoogleFonts.playfairDisplay(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFE6F1FF),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Enter your email",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color(0xFF8892B0),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: email,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "example@gmail.com",
                hintStyle: const TextStyle(color: Color(0xFF495670)),
                fillColor: const Color(0xFF112240),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Color(0xFFD4AF37), width: 1),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37), // Deep Gold
                  foregroundColor: const Color(0xFF0A192F), // Midnight Navy text
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  Forgot(email.text, context);
                },
                child: Text(
                  "Send code",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}