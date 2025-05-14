import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8d7fa),
      body: Stack(
        children: [
          Positioned(
            top: 490,
            right: 70,

            child: Column(
              children: [Image.asset('assets/one.png', height: 500)],
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
            bottom: 50,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Text('   Next  '),
            ),
          ),
        ],
      ),
    );
  }
}
