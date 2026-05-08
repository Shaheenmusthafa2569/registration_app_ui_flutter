import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myhomepage extends StatelessWidget {
  const Myhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 60, 65),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Home!",
              style: GoogleFonts.azeretMono(fontSize: 25, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}
