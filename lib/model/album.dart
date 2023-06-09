class Album {
  final String title;
  final DateTime releaseDate;
  final String? imagePath;
  final String lyricsFolderPath;
  final List<String> lyricsPaths;

  Album({
    required this.title,
    required this.releaseDate,
    required this.imagePath,
    required this.lyricsFolderPath,
    required this.lyricsPaths,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'] as String,
      releaseDate: DateTime.parse(json['releaseDate'] as String),
      imagePath: json['imagePath'] as String?,
      lyricsFolderPath: json['lyricsFolderPath'] as String,
      lyricsPaths: List<String>.from(
        (json['lyricsPaths'] as Iterable).map((path) => path as String),
      ),
    );
  }
}
