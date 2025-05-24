import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:just_audio/just_audio.dart';
import 'package:old_wave/Pages/audioLibrary.dart';
import 'dart:io';
import 'package:old_wave/Pages/searchpage.dart';

import 'package:old_wave/Pages/items/container.dart';

class MusicMainScreenPlayer extends StatefulWidget {
  const MusicMainScreenPlayer({super.key});

  @override
  State<MusicMainScreenPlayer> createState() => _MusicMainScreenPlayerState();
}

class _MusicMainScreenPlayerState extends State<MusicMainScreenPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/albumcover.jpg', fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
