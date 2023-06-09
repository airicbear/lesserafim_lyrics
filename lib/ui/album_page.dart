import 'package:flutter/material.dart';
import 'package:lesserafim_lyrics/model/album.dart';

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
    );
  }
}
