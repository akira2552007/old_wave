import 'package:flutter/material.dart';
import 'package:old_wave/Pages/landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/gramophone.png', height: 400)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/letters/o.png', height: 50),
              const SizedBox(width: 5),
              Image.asset('assets/letters/l.png', height: 50),
              const SizedBox(width: 5),
              Image.asset('assets/letters/d.png', height: 50),
              const SizedBox(width: 5),
              Image.asset('assets/letters/w.png', height: 50),
              const SizedBox(width: 5),
              Image.asset('assets/letters/a.png', height: 50),
              const SizedBox(width: 5),
              Image.asset('assets/letters/v.png', height: 50),
              const SizedBox(width: 5),
              Image.asset('assets/letters/e.png', height: 50),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
