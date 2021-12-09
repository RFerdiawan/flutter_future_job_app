import 'package:flutter/material.dart';
import 'package:future_job/models/category_model.dart';
import 'package:future_job/models/job_model.dart';
import 'package:future_job/providers/job_provider.dart';
import 'package:future_job/theme.dart';
import 'package:future_job/widgets/job_list.dart';
import 'package:provider/provider.dart';

class SecondHomepage extends StatelessWidget {
  final CategoryModel category;

  SecondHomepage(this.category);
  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

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
                    child: Image.network(
                      category.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 178, left: 24),
                  child: Text(
                    category.name,
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
                  SizedBox(
                    height: 16,
                  ),
                  FutureBuilder<List<JobModel>>(
                    future: jobProvider.getJobsByCategory(category.name),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children:
                              snapshot.data.map((job) => JobList(job)).toList(),
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
            Container(
              padding: EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Startups',
                    style: jobTextStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FutureBuilder<List<JobModel>>(
                    future: jobProvider.getJobs(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children:
                              snapshot.data.map((job) => JobList(job)).toList(),
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
          ],
        ),
      ),
    );
  }
}
