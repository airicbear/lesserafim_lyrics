import 'package:flutter/material.dart';
import 'package:lesserafim_lyrics/model/album.dart';
import 'dart:convert';

import 'package:lesserafim_lyrics/ui/album_page.dart';

class Home extends StatelessWidget {
  final String title;

  const Home({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/albums.json'),
        builder: (context, snapshot) {
          final lyrics = json.decode(snapshot.data.toString());

          return ListView.builder(
            itemCount: lyrics == null ? 0 : lyrics.length,
            itemBuilder: (context, index) {
              final album = Album.fromJson(lyrics[index]);

              return Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlbumPage(
                          album: album,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(album.title),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
