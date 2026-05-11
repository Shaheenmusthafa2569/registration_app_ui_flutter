import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/login.dart';

class Myprofilepage extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  final String imageurl;

  Myprofilepage({
    required this.username,
    required this.email,
    required this.password,
    required this.imageurl,
  });
  @override
  State<Myprofilepage> createState() => _MyprofilepageState();
}

class _MyprofilepageState extends State<Myprofilepage> {
  String? imageurl;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    username.text = widget.username;
    email.text = widget.email;
    password.text = widget.password;
  }

  Future<void> UpdateDetails() async {
    setState(() {
      isLoading = true;
    });
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection("datas").doc(uid).update({
        'Name': username.text,
        'Password': password.text,
        'Image': imageurl!,
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Successfully Updated!")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ONLY COLORS + FONTS CHANGED

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F19),

      /// AppBar
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF0B0F19),
        elevation: 0,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Avatar
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 58,
                    backgroundColor: const Color(0xFF6366F1).withOpacity(0.25),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 3,
                    top: 2,
                    left: 3,
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundImage:
                            (widget.imageurl.isNotEmpty &&
                                widget.imageurl != "No Image")
                            ? NetworkImage(widget.imageurl)
                            : null,
                        radius: 54,
                        backgroundColor: const Color(0xFF111827),
                        child:
                            (widget.imageurl.isEmpty ||
                                widget.imageurl == "No Image")
                            ? Icon(
                                Icons.add_a_photo_outlined,
                                color: Color(0xFF818CF8),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Email
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Email",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
            ),
            TextFormField(
              readOnly: true,
              controller: email,
              style: GoogleFonts.poppins(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF111827),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF1F2937)),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF6366F1)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// Username
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Username",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
            ),
            TextFormField(
              controller: username,
              style: GoogleFonts.poppins(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF111827),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF1F2937)),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF6366F1)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// Password
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Password",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
            ),
            TextFormField(
              controller: password,
              style: GoogleFonts.poppins(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF111827),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF1F2937)),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF6366F1)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  UpdateDetails();
                },
                child: Text(
                  "Edit",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 25),

            /// Logout Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyLoginpage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
