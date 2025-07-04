import 'package:flutter/material.dart';
import 'package:portfolio/core/text_styles.dart';
import 'package:portfolio/pages/widgets/custom_outlined_button.dart';
import 'package:portfolio/pages/widgets/social_side_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _typewriterController;
  late AnimationController _cursorController;
  late Animation<int> _typewriterAnimation;
  final String _fullText = 'Flutter Developer';

  @override
  void initState() {
    super.initState();

    _typewriterController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _cursorController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _typewriterAnimation = IntTween(begin: 0, end: _fullText.length).animate(
      CurvedAnimation(parent: _typewriterController, curve: Curves.easeInOut),
    );

    // Start cursor blinking immediately
    _cursorController.repeat(reverse: true);

    // Start the animation after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _typewriterController.forward().then((_) {
          // Stop cursor blinking when typing is complete
          _cursorController.stop();
        });
      }
    });
  }

  @override
  void dispose() {
    _typewriterController.dispose();
    _cursorController.dispose();
    super.dispose();
  }

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
                    AnimatedBuilder(
                      animation: _typewriterAnimation,
                      builder: (context, child) {
                        String displayText = _fullText.substring(
                          0,
                          _typewriterAnimation.value,
                        );
                        return Row(
                          children: [
                            Text(
                              displayText,
                              style: TextStyles.boldTextStyle.copyWith(
                                fontSize: 55,
                                color: Colors.white,
                              ),
                            ),
                            // Blinking cursor
                            AnimatedBuilder(
                              animation: _cursorController,
                              builder: (context, child) {
                                return Opacity(
                                  opacity:
                                      _typewriterAnimation.value ==
                                              _fullText.length
                                          ? 0.0
                                          : _cursorController.value,
                                  child: Text(
                                    '_',
                                    style: TextStyles.boldTextStyle.copyWith(
                                      fontSize: 55,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
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
