class SongModel{
  String? songName;
  String? songerName;
  String? imagePath;
  String? time;
  String? songPath;
  bool isPlaying;

  SongModel({
    this.imagePath,
    this.songName,
    this.songerName,
    this.time,
    this.songPath,
    this.isPlaying = false
  });
}