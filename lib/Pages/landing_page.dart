import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:old_wave/Pages/container%20pages/page_threee.dart';
import 'package:old_wave/Pages/container%20pages/page_one.dart';
import 'package:old_wave/Pages/container%20pages/page_two.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key});

  final PageController _controller = PageController();

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  Future<void> requestStoragePermission() async {
    if (await Permission.audio.isDenied) {
      await Permission.audio.request();
    }
    if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: widget._controller,
        children: [
          PageOne(controller: widget._controller),
          PageTwo(controller: widget._controller),
          PageThreee(controller: widget._controller),
        ],
      ),
    );
  }
}
