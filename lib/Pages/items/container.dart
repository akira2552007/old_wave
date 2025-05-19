import 'package:flutter/material.dart';

Widget containerNothing(String image) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Image.asset(image, fit: BoxFit.contain, height: 150, width: 150),
      ),
    ),
  );
}
