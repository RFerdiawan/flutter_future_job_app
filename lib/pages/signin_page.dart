import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_job/models/user_model.dart';
import 'package:future_job/pages/home_page.dart';
import 'package:future_job/providers/auth_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:future_job/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool isEmailValid = true;

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: titleTextStyle,
              ),
              Text(
                'Build Your Career',
                style: subtitleTextStyle,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/ilustrasisatu.png',
                      width: 262,
                      height: 240,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
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
                    onChanged: (value) {
                      print(value);
                      bool isValid = EmailValidator.validate(value);
                      print(isValid);
                      if (isValid) {
                        setState(() {
                          isEmailValid = true;
                        });
                      } else {
                        setState(() {
                          isEmailValid = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                            color: isEmailValid ? Colors.purple : Colors.red),
                      ),
                    ),
                    style: TextStyle(
                        color: isEmailValid ? Colors.purple : Colors.red),
                  ),
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
                      fillColor: Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
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
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            showError('Semua field harus diisi');
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            UserModel user = await authProvider.Login(
                                emailController.text, passwordController.text);

                            setState(() {
                              isLoading = false;
                            });

                            if (user == null) {
                              showError('email atau password salah');
                            } else {
                              userProvider.user = user;
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            }
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: buttonTextStyle,
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    child: Text(
                      'Create New Account',
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
