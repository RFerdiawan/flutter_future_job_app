import 'package:flutter/material.dart';
import 'package:future_job/models/category_model.dart';
import 'package:future_job/models/job_model.dart';
import 'package:future_job/providers/category_provider.dart';
import 'package:future_job/providers/job_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:future_job/theme.dart';
import 'package:future_job/widgets/job_card.dart';
import 'package:future_job/widgets/job_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

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
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 24, right: 24),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy",
                          style: titleTextStyle,
                        ),
                        Text(
                          userProvider.user.name,
                          style: subtitleTextStyle,
                        )
                      ],
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/user_pic.png',
                      width: 58,
                      height: 58,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            //bodyHome(),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hot Categories',
                      style: GoogleFonts.poppins(
                        color: Color(0xff272c2f),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FutureBuilder<List<CategoryModel>>(
                        future: categoryProvider.getCategories(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: snapshot.data
                                    .map((category) => JobCard(category))
                                    .toList(),
                              ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Just Posted',
                      style: GoogleFonts.poppins(
                        color: Color(0xff272c2f),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FutureBuilder<List<JobModel>>(
                      future: jobProvider.getJobs(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Column(
                            children: snapshot.data
                                .map((job) => JobList(job))
                                .toList(),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
