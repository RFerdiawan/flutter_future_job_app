import 'package:flutter/material.dart';
import 'package:future_job/models/user_model.dart';
import 'package:future_job/providers/auth_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isUploaded = false;
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
        ),
      );
    }

    Widget uploadedImages() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/upload_pic.png',
                height: 120,
                width: 120,
              ),
            ],
          ),
        ),
      );
    }

    Widget showedImages() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/show_image.png',
                height: 120,
                width: 120,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: titleTextStyle,
              ),
              Text(
                'Begin New Journey',
                style: subtitleTextStyle,
              ),
              SizedBox(
                height: 40,
              ),
              isUploaded ? showedImages() : uploadedImages(),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Color(0xfff1f0f5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Color(0xfff1f0f5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Color(0xfff1f0f5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Goals',
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: goalController,
                    decoration: InputDecoration(
                      fillColor: Color(0xfff1f0f5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 450,
                height: 50,
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff4141a4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(66))),
                        onPressed: () async {
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              goalController.text.isEmpty) {
                            showError('semua field harus diisi');
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            UserModel user = await authProvider.register(
                                emailController.text,
                                passwordController.text,
                                nameController.text,
                                goalController.text);

                            setState(() {
                              isLoading = false;
                            });

                            if (user == null) {
                              showError('email sudah terdaftar');
                            } else {
                              userProvider.user = user;
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            }
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: buttonTextStyle,
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 70,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-in');
                    },
                    child: Text(
                      'Back to Sign In',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Color(0xffb3b5c4),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
