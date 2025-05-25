import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:just_audio/just_audio.dart';
import 'package:old_wave/Pages/music_main_screen_player.dart';
import 'package:path/path.dart' as p;

class Audiolibrary extends StatefulWidget {
  const Audiolibrary({super.key});

  @override
  State<Audiolibrary> createState() => _AudiolibraryState();
}

class _AudiolibraryState extends State<Audiolibrary> {
  final AudioPlayer _player = AudioPlayer();
  List<AudioFile> audioFiles = [];

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
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: Colors.black,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(20),
              title: Text(
                'AUDIO LIBRARY',
                style: TextStyle(
                  fontFamily: 'Nothing_Font',
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final audio = audioFiles[index];
                return Card(
                  color: Colors.black,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(
                      audio.title,

                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      audio.artist,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    leading: Icon(Icons.music_note, color: Colors.white),
                    onTap: () => playAudio(audio.path),

                    onLongPress:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    MusicMainScreenPlayer(audioFile: audio),
                          ),
                        ),
                  ),
                );
              }, childCount: audioFiles.length),
            ),
          ),
        ],
      ),
    );
  }
}

class AudioFile {
  final String path;
  final String title;
  final String artist;
  final Uint8List albumart;

  AudioFile({
    required this.path,
    required this.title,
    required this.artist,
    required this.albumart,
  });
}
