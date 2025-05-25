import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:just_audio/just_audio.dart';
import 'package:old_wave/Pages/audioLibrary.dart';
import 'package:old_wave/Pages/music_main_screen_player.dart';
import 'package:path/path.dart' as p;

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final AudioPlayer _player = AudioPlayer();
  List<AudioFile> audioFiles = [];
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    scanForAudio();
  }

  Future<void> scanForAudio() async {
    final List<Directory> directories = [
      Directory('/storage/emulated/0/Music'),
      Directory('/storage/emulated/0/Download'),
      Directory('/storage/emulated/0/Audio'),
      Directory('/storage/emulated/0/WhatsApp/Media/WhatsApp Audio'),
    ];

    List<AudioFile> foundFiles = [];

    for (final dir in directories) {
      if (await dir.exists()) {
        final files = dir.listSync(recursive: true);
        for (final file in files) {
          if (file is File && file.path.endsWith('.mp3')) {
            final metaData = await MetadataRetriever.fromFile(file);
            foundFiles.add(
                AudioFile(
                path: file.path,
                title: metaData.trackName ?? p.basename(file.path),
                artist: metaData.albumArtistName ?? 'Unknown Artist',
                albumart: metaData.albumArt ?? Uint8List(0),
              ),
            );
          }
        }
      }
    }

    setState(() {
      audioFiles = foundFiles;
    });
  }

  void playAudio(String path) async {
    await _player.setFilePath(path);
    _player.play();
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Search',
          style: TextStyle(
            fontFamily: 'Nothing_Font',
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.grey[800]!, blurRadius: 10),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nothing_Font',
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Search for songs, artists, or albums',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 10,
            right: 10,
            child: Container(
              height: 670,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.grey[800]!, blurRadius: 10),
                ],
              ),
              child: ListView.builder(
                itemCount: audioFiles.length,
                itemBuilder: (context, index) {
                  final audio = audioFiles[index];
                  if (_controller.text.isEmpty ||
                      audio.title.toLowerCase().contains(_controller.text) ||
                      audio.title.toUpperCase().contains(_controller.text) ||
                      audio.artist.toLowerCase().contains(_controller.text)) {
                    return Card(
                      color: Colors.black,
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(
                          audio.title,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          audio.artist,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        leading: Icon(
                          Icons.music_note,
                          color: Colors.grey[500],
                        ),
                        onTap: () => playAudio(audio.path),

                        onLongPress:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                builder: (context) => MusicMainScreenPlayer(
                  audioFile: audio,
                ),
                              ),
                            ),
                      ),
                    );
                  } else {
                    return Container(); // Return an empty container if no match
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
