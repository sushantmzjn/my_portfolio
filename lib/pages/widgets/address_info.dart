import 'package:flutter/material.dart';
import 'package:portfolio/core/text_styles.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contacts',
          style: TextStyles.boldTextStyle.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Address',
          style: TextStyles.boldTextStyle.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Text(
          'Bungmati, Lalitpur 22, Nepal',
          style: TextStyles.regularTextStyle.copyWith(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Phone',
          style: TextStyles.boldTextStyle.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Text(
          '+977 9840000000',
          style: TextStyles.regularTextStyle.copyWith(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        Text(
          '+977 9840000000',
          style: TextStyles.regularTextStyle.copyWith(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Email',
          style: TextStyles.boldTextStyle.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Text(
          'sushantmaharjan123@gmail.com',
          style: TextStyles.regularTextStyle.copyWith(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Container(
              color: Colors.pinkAccent,
              child: Center(child: Text('Map here>')),
            ),
          ),
        ),
      ],
    );
  }
}
