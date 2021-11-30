import 'package:flutter/material.dart';
import 'package:future_job/theme.dart';

class DetailPage extends StatelessWidget {
  // final String jobTitle;
  // final String imageUrl;

  // const DetailPage({Key key, this.jobTitle, this.jobIcon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset(
                'assets/google-icon.png',
                height: 60,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Front-End Developer',
              style: jobApplyTextStyle,
            ),
            Text(
              'Google, Inc • Jakarta',
              style: companyTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
