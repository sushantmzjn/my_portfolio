import 'package:flutter/material.dart';

class FontStyles {
  static const String montserrat = 'Montserrat';
  static const String montserratBold = 'Montserrat-Bold';
  static const String montserratSemibold = 'Montserrat-Semibold';
}

class TextStyles {
  static TextStyle regularTextStyle = TextStyle(
    fontFamily: FontStyles.montserrat,
  );
  static TextStyle boldTextStyle = TextStyle(
    fontFamily: FontStyles.montserratBold,
  );
  static TextStyle semiboldTextStyle = TextStyle(
    fontFamily: FontStyles.montserratSemibold,
  );
}
