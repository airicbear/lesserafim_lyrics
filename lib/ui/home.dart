import 'package:flutter/material.dart';

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
      body: const Center(),
    );
  }
}
