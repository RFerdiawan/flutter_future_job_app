import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.png'),
                  fit: BoxFit.cover,
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Build Your Next \nFuture Career Like \na Master',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('18.000 jobs available',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 400),
                    child: Container(
                      width: 200,
                      height: 45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66)
                          )
                        ),
                          onPressed: (){},
                          child: Text('Get Started',
                          style: GoogleFonts.poppins(
                            color: Color(0xff4141A4),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          )
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      width: 200,
                      height: 45,
                      child: OutlinedButton(
                          onPressed: (){},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(66)
                            ),
                            side: BorderSide(color: Colors.white,
                            )
                          ),
                          child: Text(
                              'Sign In',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
