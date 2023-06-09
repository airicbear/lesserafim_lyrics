import 'package:flutter/material.dart';
import 'dart:convert';

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
          var lyrics = json.decode(snapshot.data.toString());

          return ListView.builder(
            itemCount: lyrics == null ? 0 : lyrics.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  lyrics[index]["title"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
