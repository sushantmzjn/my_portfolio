import 'package:flutter/material.dart';

class SocialContainer extends StatefulWidget {
  final String imagePath;
  final void Function()? onPressed;

  const SocialContainer({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  State<SocialContainer> createState() => _SocialContainerState();
}

class _SocialContainerState extends State<SocialContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        onTap: widget.onPressed,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[700],
          ),
          child: Image.asset(
            widget.imagePath,
            width: 18,
            height: 18,
            color: _isHovered ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
