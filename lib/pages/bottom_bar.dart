import 'package:flutter/material.dart';
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
            onPressed: () {},
          ),
          SocialContainer(
            imagePath: 'assets/images/github.png',
            onPressed: () {},
          ),
          SocialContainer(imagePath: 'assets/images/fb.png', onPressed: () {}),
        ],
      ),
    );
  }
}
