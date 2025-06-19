import 'package:flutter/material.dart';
import 'package:portfolio/core/custom_text_field.dart';
import 'package:portfolio/core/text_styles.dart';
import 'package:portfolio/pages/widgets/custom_outlined_button.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Contact Form',
          style: TextStyles.boldTextStyle.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(child: CustomTextField(hintText: 'Name')),
            SizedBox(width: 20),
            Expanded(child: CustomTextField(hintText: 'Your Email')),
          ],
        ),
        SizedBox(height: 25),
        Row(
          children: [
            Expanded(child: CustomTextField(hintText: 'Your Phone')),
            SizedBox(width: 20),
            Expanded(child: CustomTextField(hintText: 'Address')),
          ],
        ),
        SizedBox(height: 25),
        CustomTextField(hintText: 'Your Message', maxLines: 6, vertical: 10),
        SizedBox(height: 35),
        CustomOutlinedButton(label: 'SEND MESSAGE', onPressed: () {}),
      ],
    );
  }
}
