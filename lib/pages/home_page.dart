import 'package:flutter/material.dart';
import 'package:future_job/theme.dart';
import 'package:future_job/widgets/body_home.dart';
import 'package:future_job/widgets/header_home.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        //margin: EdgeInsets.only(top: 30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          unselectedItemColor: Color(0xffb3b5c4),
          selectedItemColor: Color(0xff272c2f),
          currentIndex: 0,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_one.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_two.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_three.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_four.png'),
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerHome(),
            SizedBox(
              height: 16,
            ),
            bodyHome(),
          ],
        ),
      ),
    );
  }
}
