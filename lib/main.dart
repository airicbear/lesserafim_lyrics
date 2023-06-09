import 'package:flutter/material.dart';
import 'package:lesserafim_lyrics/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LE SSERAFIM Lyrics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(
        title: 'LE SSERAFIM Lyrics',
      ),
    );
  }
}
