import 'package:flutter/material.dart';
import 'package:old_wave/Pages/container%20pages/page_one.dart';
import 'package:old_wave/Pages/container%20pages/page_three.dart';
import 'package:old_wave/Pages/container%20pages/page_two.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: [PageThree(), PageTwo(), PageOne()]),
    );
  }
}
