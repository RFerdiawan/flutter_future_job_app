import 'package:flutter/material.dart';
import 'package:future_job/models/job_model.dart';
import 'package:future_job/pages/detail_page.dart';
import 'package:future_job/theme.dart';

class JobList extends StatelessWidget {
  final JobModel job;

  const JobList(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage(job)));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            job.companyLogo,
            width: 44,
            height: 45,
          ),
          SizedBox(
            width: 26,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.name,
                  style: jobTextStyle,
                ),
                Text(
                  job.companyName,
                  style: companyTextStyle,
                ),
                SizedBox(
                  height: 18,
                ),
                Divider(
                  color: Color(0xffecedf1),
                  thickness: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
