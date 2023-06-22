import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lesserafim_lyrics/model/album.dart';
import 'package:lesserafim_lyrics/model/song.dart';
import 'package:lesserafim_lyrics/ui/lyrics_page.dart';

class AlbumPage extends StatelessWidget {
  final Album album;

  const AlbumPage({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: album.lyricsPaths.length,
          (context, index) => FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString(_songPath(index)),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const ListTile();
              }

              final song = Song.fromJson(jsonDecode(snapshot.data.toString()));

              return ListTile(
                title: Text(
                  song.title,
                  style: TextStyle(
                    color: song.lyrics.isEmpty
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  if (song.lyrics.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LyricsPage(
                          song: song,
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  String _songPath(int index) {
    return '${album.lyricsFolderPath}/${album.lyricsPaths[index]}';
  }
}
