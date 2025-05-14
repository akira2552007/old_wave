import 'package:flutter/material.dart';
import 'package:old_wave/Pages/container%20pages/page_threee.dart';
import 'package:old_wave/Pages/container%20pages/page_one.dart';
import 'package:old_wave/Pages/container%20pages/page_two.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key});

  final PageController _controller = PageController();

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: widget._controller,
        children: [
          PageOne(controller: widget._controller),
          PageTwo(controller: widget._controller),
          PageThreee(controller: widget._controller),
        ],
      ),
    );
  }
}
