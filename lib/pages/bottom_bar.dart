import 'package:flutter/material.dart';
import 'package:portfolio/core/url_launcher.dart';
import 'package:portfolio/pages/widgets/social_container.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      // color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          SocialContainer(
            imagePath: 'assets/images/linkedin.png',
            onPressed: () {
              urlLaunch(
                'https://www.linkedin.com/in/sushant-maharjan-58043b246/',
                context,
              );
            },
          ),
          SocialContainer(
            imagePath: 'assets/images/github.png',
            onPressed: () {
              urlLaunch('https://github.com/sushantmzjn', context);
            },
          ),
          SocialContainer(
            imagePath: 'assets/images/gmail.png',
            onPressed: () {
              urlLaunch('mailto:sushantmaharjan08@gmail.com', context);
            },
          ),
        ],
      ),
    );
  }
}
