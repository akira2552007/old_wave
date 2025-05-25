import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:typed_data';
import 'audioLibrary.dart'; // Make sure this contains your AudioFile class

class MusicMainScreenPlayer extends StatefulWidget {
  final AudioFile audioFile;

  const MusicMainScreenPlayer({super.key, required this.audioFile});

  @override
  State<MusicMainScreenPlayer> createState() => _MusicMainScreenPlayerState();
}

class _MusicMainScreenPlayerState extends State<MusicMainScreenPlayer> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    try {
      await _player.setFilePath(widget.audioFile.path);
      _player.play();
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.audioFile.title,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
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
                child:
                    widget.audioFile.albumart.isNotEmpty
                        ? Image.memory(
                          widget.audioFile.albumart,
                          fit: BoxFit.cover,
                        )
                        : Image.asset(
                          'assets/albumcover.jpg',
                          fit: BoxFit.cover,
                        ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.audioFile.title,
              style: TextStyle(color: Colors.white, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              widget.audioFile.artist,
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onLongPress: () {
                    _player.seekToPrevious();
                  },
                  onPressed: () {
                    _player.seek(Duration.zero);
                  },
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_player.playing) {
                      _player.pause();
                    } else {
                      _player.play();
                    }
                  },
                  icon: Icon(
                    _player.playing
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _player.seekToNext();
                  },
                  icon: Icon(Icons.skip_next_outlined),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
