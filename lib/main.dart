import 'package:flutter/material.dart';
import 'package:resume_wedding/screens/about_me_screen.dart';
import 'package:resume_wedding/screens/contact.dart';
import 'package:resume_wedding/screens/experience_screen.dart';
import 'package:resume_wedding/screens/portfolio_screen.dart';
import 'package:resume_wedding/screens/splash_screen.dart';
import 'package:resume_wedding/widgets/timeline_tile.dart';

void main() {
  runApp(CVApp());
}

class CVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pinkAccent),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/about': (context) => AboutMeScreen(),
        '/contact': (context) => ContactScreen(),
        '/experience_screen': (context) => ExperienceScreen(),
        '/timeline': (context) => TimelineScreen(),
      },
    );
  }
}