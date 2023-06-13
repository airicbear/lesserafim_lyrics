import 'package:flutter/material.dart';
import 'package:lesserafim_lyrics/model/song.dart';

class LyricsPage extends StatelessWidget {
  final Song song;

  const LyricsPage({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
    );
  }
}
