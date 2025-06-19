import 'package:flutter/material.dart';
import 'package:portfolio/core/text_styles.dart';
import 'package:portfolio/pages/widgets/custom_outlined_button.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {
  late AnimationController _squareController;
  late AnimationController _diamondController;
  late Animation<double> _squareAnimation;
  late Animation<double> _diamondAnimation;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();

    _squareController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _diamondController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _squareAnimation = Tween<double>(
      begin: 0.0,
      end: 1.5708, // 90 degrees clockwise
    ).animate(
      CurvedAnimation(parent: _squareController, curve: Curves.easeInOut),
    );

    _diamondAnimation = Tween<double>(
      begin: 0.785398, // 45 degrees
      end:
          -0.785398, // -45 degrees (90 degrees counter-clockwise from original)
    ).animate(
      CurvedAnimation(parent: _diamondController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _squareController.dispose();
    _diamondController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      isHovered = isHovered;
    });

    if (isHovered) {
      _squareController.forward();
      _diamondController.forward();
    } else {
      _squareController.reverse();
      _diamondController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 520,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 50),
              child: MouseRegion(
                onEnter: (_) => _onHover(true),
                onExit: (_) => _onHover(false),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/pic.jpg',
                      fit: BoxFit.contain,
                      height: 380,
                      width: 380,
                    ),
                    AnimatedBuilder(
                      animation: _squareAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _squareAnimation.value,
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 6),
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _diamondAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _diamondAnimation.value,
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 6),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 140, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: TextStyles.boldTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                        letterSpacing: 1,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey,
                        decorationThickness: 2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
                      style: TextStyles.regularTextStyle.copyWith(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem IpsumThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,',
                      style: TextStyles.regularTextStyle.copyWith(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomOutlinedButton(
                      label: 'DOWNLOAD CV',
                      onPressed: () {},
                    ),
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
