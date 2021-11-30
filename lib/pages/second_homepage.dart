import 'package:flutter/material.dart';
import 'package:future_job/theme.dart';
import 'package:future_job/widgets/job_list.dart';

class SecondHomepage extends StatelessWidget {
  final String jobTitleHome;
  final String imageUrl;

  const SecondHomepage({Key key, this.jobTitleHome, this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 270,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 178, left: 24),
                  child: Text(
                    jobTitleHome,
                    style: jobTTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 216, left: 24),
                  child: Text(
                    '12.309 available',
                    style: jobATextStyle,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Big Companies',
                    style: jobTextStyle,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: JobList(
                          company: 'Google',
                          job: 'Front-End Developer',
                          imageUrl: 'assets/google-icon.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: JobList(
                          company: 'Instagram',
                          job: 'UI Designer',
                          imageUrl: 'assets/instagram-icon.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: JobList(
                          company: 'Facebook',
                          job: 'Data Scientist',
                          imageUrl: 'assets/facebook-icon.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Startups',
                    style: jobTextStyle,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: JobList(
                          company: 'Google',
                          job: 'Front-End Developer',
                          imageUrl: 'assets/google-icon.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: JobList(
                          company: 'Instagram',
                          job: 'UI Designer',
                          imageUrl: 'assets/instagram-icon.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: JobList(
                          company: 'Facebook',
                          job: 'Data Scientist',
                          imageUrl: 'assets/facebook-icon.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
