import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
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
  bool isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String? imageurl;
  Future<void> Pickimage() async {
    final ImagePicker picktheimage = ImagePicker();
    final XFile? image = await picktheimage.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        isLoading = true;
      });
    }
    try {
      final cloudinary = CloudinaryPublic("dyo8wxjsx", "images", cache: false);
      CloudinaryFile cloudfile;
      if (kIsWeb) {
        //to get images on web
        final bytes = await image!.readAsBytes();
        cloudfile = CloudinaryFile.fromByteData(
          bytes.buffer.asByteData(),
          identifier: image.name,
          resourceType: CloudinaryResourceType.Image,
        );
      } else {
        //to get images on phone
        cloudfile = CloudinaryFile.fromFile(
          image!.path,
          resourceType: CloudinaryResourceType.Image,
        );
      }
      CloudinaryResponse response = await cloudinary.uploadFile(cloudfile);
      setState(() {
        imageurl = response.secureUrl;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Image upload failed! Try again.")),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // ONLY COLORS + FONTS CHANGED — NOTHING ELSE

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F19), // dark background
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Title
                  Text(
                    "Sign up",
                    style: GoogleFonts.poppins(
                      // changed font
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// Subtitle
                  Text(
                    "Create an account to enter",
                    style: GoogleFonts.poppins(
                      // consistent font
                      color: const Color(0xFF94A3B8),
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Avatar
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: const Color(
                            0xFF6366F1,
                          ).withOpacity(0.25),
                        ),
                        Positioned(
                          bottom: 2,
                          right: 3,
                          top: 2,
                          left: 3,
                          child: GestureDetector(
                            onTap: () {
                              Pickimage();
                            },
                            child: CircleAvatar(
                              backgroundImage: imageurl != null
                                  ? NetworkImage(imageurl!)
                                  : null,
                              radius: 42,
                              backgroundColor: const Color(0xFF111827),
                              child: imageurl == null
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

                  const SizedBox(height: 20),

                  /// Username
                  _buildField("Username", username),

                  const SizedBox(height: 15),

                  /// Email
                  _buildField("Email", email),

                  const SizedBox(height: 15),

                  /// Password
                  _buildPasswordField("Password", password, true),

                  const SizedBox(height: 15),

                  /// Confirm Password
                  _buildPasswordField(
                    "Confirm Password",
                    confirmpassword,
                    false,
                  ),

                  const SizedBox(height: 30),

                  /// Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Signup(
                            username.text,
                            email.text.trim(),
                            password.text,
                            imageurl!,
                            context,
                          );
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
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
                      Text(
                        "Already have an account? ",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF94A3B8),
                        ),
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
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF818CF8),
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

  /// Reusable field
  /// Reusable field
  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF9CA3AF),
          ),
        ),

        TextFormField(
          controller: controller,
          style: GoogleFonts.poppins(color: Colors.white),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "$label is required";
            }
            if (label == "Email") {
              
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF111827),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
      ],
    );
  }

  Widget _buildPasswordField(
    String label,
    TextEditingController controller,
    bool isMain,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF9CA3AF),
          ),
        ),

        TextFormField(
          obscureText: isMain ? visiblepassword : visibleConfirmedpassword,
          controller: controller,
          style: GoogleFonts.poppins(color: Colors.white),

          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF111827),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  if (isMain) {
                    visiblepassword = !visiblepassword;
                  } else {
                    visibleConfirmedpassword = !visibleConfirmedpassword;
                  }
                });
              },
              icon: Icon(
                isMain
                    ? (visiblepassword
                          ? Icons.visibility
                          : Icons.visibility_off)
                    : (visibleConfirmedpassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                color: const Color(0xFF9CA3AF),
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
      ],
    );
  }
}
