import 'dart:io';
import 'package:flutter/material.dart';
import 'package:old_wave/Pages/landing_page.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handlePermissionsAndNavigate();
  }

  Future<void> _handlePermissionsAndNavigate() async {
    await Future.delayed(Duration(milliseconds: 500)); // brief splash wait

    if (Platform.isAndroid) {
      // Android 13+ → use READ_MEDIA_AUDIO
      if (await _isAndroid13OrAbove()) {
        var audioStatus = await Permission.audio.request();
        print('Audio permission: $audioStatus');

        if (!audioStatus.isGranted) {
          await openAppSettings();
          return;
        }
      } else {
        // Android 12 or below → use storage permission
        var storageStatus = await Permission.storage.request();
        print('Storage permission: $storageStatus');

        if (!storageStatus.isGranted) {
          await openAppSettings();
          return;
        }
      }
    }

    // Wait and move to next page
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LandingPage()),
    );
  }

  Future<bool> _isAndroid13OrAbove() async {
    // Workaround using PlatformVersion
    var version = (await Permission.mediaLibrary.status);
    return version != PermissionStatus.denied; // crude check
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
    );
  }
}
