import 'package:lesserafim_lyrics/model/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class LyricsPage extends StatefulWidget {
  final Song song;

  const LyricsPage({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage>
    with SingleTickerProviderStateMixin {
  late List<String> lyrics;
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: widget.song.lyrics.length,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {
        lyrics = widget.song.lyrics.values.toList()[tabController.index];
      });
    });
    lyrics = widget.song.lyrics.entries.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.song.lyrics.length > 1
          ? _LyricsPageTabBar(
              tabController: tabController,
              song: widget.song,
            )
          : const SizedBox.shrink(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(widget.song.title),
            pinned: true,
          ),
          _LyricsPageLyricList(
            lyrics: lyrics,
          ),
        ],
      ),
    );
  }
}

class _LyricsPageTabBar extends StatelessWidget {
  final TabController tabController;
  final Song song;

  const _LyricsPageTabBar({
    Key? key,
    required this.tabController,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: List<Tab>.generate(
        song.lyrics.length,
        (index) => Tab(
          text: song.lyrics.keys.toList()[index].toUpperCase(),
        ),
      ),
      labelStyle: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _LyricsPageLyricList extends StatelessWidget {
  final List<String> lyrics;

  const _LyricsPageLyricList({
    Key? key,
    required this.lyrics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final String line = lyrics[index];

          return _LyricsPageLyricListItem(
            line: line,
          );
        },
        childCount: lyrics.length,
      ),
    );
  }
}

class _LyricsPageLyricListItem extends StatelessWidget {
  final String line;

  const _LyricsPageLyricListItem({
    Key? key,
    required this.line,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      title: line.startsWith('[')
          ? HtmlWidget(
              line.substring(1, line.length - 1),
              textStyle: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
            )
          : HtmlWidget(line),
    );
  }
}
