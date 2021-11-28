import 'package:flutter/material.dart';
import 'package:future_job/pages/second_homepage.dart';
import 'package:future_job/pages/signin_page.dart';
import 'package:future_job/pages/signup_page.dart';
import 'package:future_job/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        // '/onboarding': (context) => OnboardingPage(),
        '/sign-in': (context) => SigninPage(),
        '/sign-up': (context) => SignupPage(),
        // '/home': (context) => HomePage(),
        '/secondhome': (context) => SecondHomepage(),
      },
    );
  }
}
