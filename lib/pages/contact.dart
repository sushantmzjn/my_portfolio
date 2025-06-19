import 'package:flutter/material.dart';
import 'package:portfolio/core/text_styles.dart';
import 'package:portfolio/pages/widgets/address_info.dart';
import 'package:portfolio/pages/widgets/contact_form.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 520,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get in touch',
              style: TextStyles.regularTextStyle.copyWith(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            Text(
              'CONTACT',
              style: TextStyles.boldTextStyle.copyWith(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(160, 0, 140, 0),
                child: Row(
                  children: [
                    Expanded(child: AddressInfo()),
                    Expanded(child: ContactForm()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
