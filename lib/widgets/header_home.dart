import 'package:flutter/material.dart';

import '../theme.dart';

Widget headerHome() {
  return SafeArea(
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
                'Jason Powell',
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
  );
}
