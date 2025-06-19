// core/url_launcher.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLaunch(String url, BuildContext context) async {
  final Uri uri = Uri.parse(url);

  try {
    // This works for both web and mobile
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank', // For web: opens in new tab
    )) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: Text('Could not open $url'),
          backgroundColor: Colors.red,
        ),
      );
    }
    log('Error launching URL: $e'); // For debugging
  }
}
