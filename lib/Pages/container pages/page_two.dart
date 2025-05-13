import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
              style: GoogleFonts.ibmPlexSans(
                fontSize: 65,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 20,
            child: Text(
              'A SINGLE NOTE,',
              style: GoogleFonts.ibmPlexSans(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 20,
            child: Text(
              'CAN BRING PEACE',
              style: GoogleFonts.ibmPlexSans(
                fontSize: 30  ,
                
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
