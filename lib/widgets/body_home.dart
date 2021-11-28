import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_job/theme.dart';
import 'package:future_job/widgets/job_card.dart';
import 'package:future_job/widgets/job_list.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bodyHome() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 24),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                JobCard(
                  text: 'Website Developer',
                  imageUrl: 'assets/card_category-0.png',
                ),
                SizedBox(
                  width: 16,
                ),
                JobCard(
                  text: 'Mobile Developer',
                  imageUrl: 'assets/card_category-1.png',
                ),
                SizedBox(
                  width: 16,
                ),
                JobCard(
                  text: 'App Designer',
                  imageUrl: 'assets/card_category-2.png',
                ),
                SizedBox(
                  width: 16,
                ),
                JobCard(
                  text: 'Content Writer',
                  imageUrl: 'assets/card_category-3.png',
                ),
                SizedBox(
                  width: 16,
                ),
                JobCard(
                  text: 'Video Grapher',
                  imageUrl: 'assets/card_category-4.png',
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
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
          )
        ],
      ),
    ),
  );
}
