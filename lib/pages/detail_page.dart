import 'package:flutter/material.dart';
import 'package:future_job/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DetailPage extends StatefulWidget {
  // final String jobTitle;
  // final String imageUrl;

  // const DetailPage({Key key, this.jobTitle, this.jobIcon}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;
  @override
  Widget applyButton() {
    return Center(
      child: Container(
        height: 45,
        width: 60.w,
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(66)),
            backgroundColor: Color(0xff4141A4),
          ),
          onPressed: () {
            setState(() {
              isApplied = !isApplied;
            });
          },
          child: Text(
            'Apply for Job',
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }

  Widget cancelButton() {
    return Center(
      child: Container(
        height: 45,
        width: 60.w,
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(66)),
            backgroundColor: Color(0xffFD4F56),
          ),
          onPressed: () {
            setState(() {
              isApplied = !isApplied;
            });
          },
          child: Text(
            'Cancel Apply',
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }

  Widget successAppliedMessages() {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 12),
      height: 60,
      width: 85.w,
      decoration: BoxDecoration(
        color: Color(0xffECEDF1),
        borderRadius: BorderRadius.circular(49),
      ),
      child: Center(
        child: Text(
          'You have applied this job and the \nrecruiter will contact you',
          style: GoogleFonts.poppins(
            color: Color(0xffA2A6B4),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                isApplied ? successAppliedMessages() : SizedBox(),
                Image.asset(
                  'assets/google-icon.png',
                  height: 60,
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
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About the job',
                        style: titleReqTextStyle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Full-Time On Site',
                                style: reqTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Start at \$18,000 per month',
                                style: reqTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Qualifications',
                        style: titleReqTextStyle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Candidate must possess at least a \nBachelor\'s Degree.',
                                style: reqTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Able to use Microsoft Office and Google \nbased service.',
                                style: reqTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Have an excellent time management, \ngood at organized and details',
                                style: reqTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Responsibilities',
                        style: titleReqTextStyle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Initiate and promote any programs, events, \ntraining, or activities.',
                                style: reqTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dot.png',
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Assessing and anticipating needs and \ncollaborate with Division.',
                                style: reqTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 51,
                      ),
                      isApplied ? cancelButton() : applyButton(),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Message Recruiter',
                            style: GoogleFonts.poppins(
                              color: Color(0xffB3B5C4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
