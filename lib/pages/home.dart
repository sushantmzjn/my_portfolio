import 'package:flutter/material.dart';
import 'package:portfolio/core/text_styles.dart';
import 'package:portfolio/pages/widgets/custom_outlined_button.dart';
import 'package:portfolio/pages/widgets/social_side_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 575,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          SocialSidebar(),
          Expanded(
            child: Container(
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I AM SUSHANT MAHARJAN',
                      style: TextStyles.regularTextStyle.copyWith(
                        fontSize: 22,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Flutter Developer',
                      style: TextStyles.boldTextStyle.copyWith(
                        fontSize: 55,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomOutlinedButton(label: 'CONTACT ME', onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
