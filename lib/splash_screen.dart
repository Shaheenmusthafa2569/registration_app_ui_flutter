import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Sign_up_page.dart';
import 'package:login_page/login.dart';
import 'package:lottie/lottie.dart';

class Mysplash extends StatelessWidget {
  const Mysplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 209, 56),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "Welcome",
              style: GoogleFonts.arima(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 65,
                fontWeight: FontWeight.bold,
                // fontStyle: FontStyle.italic,
              ),
            ),
            Center(child: Lottie.asset("assets/flying.json")),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLoginpage()),
                );
              },
              child: SizedBox(
                width: 50,
                child: Text("Login", textAlign: TextAlign.center),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 202, 128, 227),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mysignuppage()),
                );
              },
              child: SizedBox(
                width: 50,
                child: Text("Sign up", textAlign: TextAlign.center),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 180, 42, 222),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
