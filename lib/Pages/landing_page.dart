import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PageView(
      children: [
        Container(
          color: Colors.red,
          child: Center(child: Text('Page 1')),
        ),
        Container(
          color: Colors.green,
          child: Center(child: Text('Page 2')),
        ),
        Container(
          color: Colors.blue,
          child: Center(child: Text('Page 3')),
        ),
      ],
    ));
  }
}
