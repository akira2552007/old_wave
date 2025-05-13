import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5DEB3),
      body: Stack(
        children: [
          Positioned(
            top: 420,
            left: 10,

            child: Column(
              children: [Image.asset('assets/three.png', height: 500)],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
          
            child: Text(
              'TO PAUSE,',
              style: GoogleFonts.ibmPlexSans(
                fontSize: 65,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 20,
            child: Text(
              'TO LISTEN,',
              style: GoogleFonts.ibmPlexSans(
                fontSize: 55,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 20,
            child: Text(
              'TO BEGIN AGAIN,',
              style: GoogleFonts.ibmPlexSans(
                fontSize: 35,
                
                fontWeight: FontWeight.w600,
                color: Colors.white,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
