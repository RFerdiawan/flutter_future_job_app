import 'package:flutter/material.dart';
import 'package:future_job/models/category_model.dart';
import 'package:future_job/pages/second_homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatelessWidget {
  final CategoryModel category;
  const JobCard(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SecondHomepage(category)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        height: 200,
        width: 150,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 14, bottom: 14, right: 14),
            child: Text(
              category.name,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(category.imageUrl),
          ),
        ),
      ),
    );
  }
}
