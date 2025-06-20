import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/text_styles.dart';
import 'package:portfolio/core/url_launcher.dart';

class SocialSidebar extends StatelessWidget {
  const SocialSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        // color: Colors.amber,
        width: 60,
        height: 260,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.rotate(
              angle: -pi / 2,
              child: Text(
                'SOCIAL',
                style: TextStyles.regularTextStyle.copyWith(
                  color: Colors.grey,
                  letterSpacing: 2,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 70),
            Transform.rotate(
              angle: -pi / 2,
              child: Container(height: 1.5, width: 60, color: Colors.grey),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                urlLaunch('mailto:sushantmaharjan08@gmail.com', context);
              },
              child: Image.asset(
                'assets/images/gmail.png',
                width: 18,
                height: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                urlLaunch('https://github.com/sushantmzjn', context);
              },
              child: Image.asset(
                'assets/images/github.png',
                width: 18,
                height: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                urlLaunch(
                  'https://www.linkedin.com/in/sushant-maharjan-58043b246/',
                  context,
                );
              },
              child: Image.asset(
                'assets/images/linkedin.png',
                width: 18,
                height: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
