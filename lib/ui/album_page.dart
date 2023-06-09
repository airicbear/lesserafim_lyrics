import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  final String title;

  const AlbumPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
