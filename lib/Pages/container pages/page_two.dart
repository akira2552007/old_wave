import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffb2ceb7),
      body: Stack(
        children: [
          Positioned(
            top: 420,
            left: 10,

            child: Column(
              children: [Image.asset('assets/two.png', height: 500)],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
          
            child: Text(
              'IN CAOSE,',
              style: TextStyle(
                fontSize: 65,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Nothing_Font',)
            ),
          ),
          Positioned(
            top: 190,
            left: 20,
            child: Text(
              'A SINGLE NOTE,',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Nothing_Font',)
            ),
          ),
          Positioned(
            top: 250,
            left: 20,
            child: Text(
              'CAN BRING PEACE',
              style:TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Nothing_Font',)
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
