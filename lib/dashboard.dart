import 'package:flutter/material.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/bottom_bar.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/home.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.black,
              actions: [
                InkWell(
                  hoverColor: Colors.white30,
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {},
                  child: Transform.scale(
                    scale: 0.45,
                    child: Image.asset(
                      'assets/icon/menu.png',
                      width: 45,
                      height: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 15),
              ],
              leading: Icon(Icons.person_off, color: Colors.white),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(children: [Home(), About(), Contact(), BottomBar()]),
        ),
      ),
    );
  }
}
