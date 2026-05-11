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
    // ONLY COLORS + FONTS CHANGED

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F19),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F19),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            /// Title
            Text(
              "Find your account",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            /// Subtitle
            Text(
              "Enter your email",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: const Color(0xFF94A3B8),
              ),
            ),

            const SizedBox(height: 30),

            /// Email Field
            TextField(
              controller: email,
              style: GoogleFonts.poppins(color: Colors.white),
              decoration: InputDecoration(
                hintText: "example@gmail.com",
                hintStyle: const TextStyle(color: Color(0xFF6B7280)),
                filled: true,
                fillColor: const Color(0xFF111827),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1F2937)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6366F1), width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Forgot(email.text, context);
                },
                child: Text(
                  "Send code",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
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
