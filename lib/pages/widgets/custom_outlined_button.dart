import 'package:flutter/material.dart';
import 'package:portfolio/core/text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(150, 50)),
        textStyle: WidgetStateProperty.all(TextStyle(fontSize: 14)),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.white;
          }
          return Colors.transparent;
        }),
        side: WidgetStateProperty.all(BorderSide(color: Colors.white)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.black;
          }
          return Colors.grey;
        }),
      ),
      child: Text(
        label,
        style: TextStyles.regularTextStyle.copyWith(letterSpacing: 1),
      ),
    );
  }
}
