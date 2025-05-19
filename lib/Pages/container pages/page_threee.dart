import 'package:flutter/material.dart';
import 'package:old_wave/Pages/home_page.dart';

class PageThreee extends StatelessWidget {
  const PageThreee({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9eabc),
      body: Stack(
        children: [
          Positioned(
            top: 420,
            left: 10,

            child: Column(
              children: [Image.asset('assets/three.png', height: 400)],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,

            child: Text(
              'TO PAUSE,',
              style: TextStyle(
                fontSize: 65,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Nothing_Font',
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 20,
            child: Text(
              'TO LISTEN,',
              style: TextStyle(
                fontSize: 65,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Nothing_Font',
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 20,
            child: Text(
              'TO BEGIN AGAIN,',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Nothing_Font',
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('                    Next                 '),
            ),
          ),
        ],
      ),
    );
  }
}
