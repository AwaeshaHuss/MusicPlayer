import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_player/core/presentation/features/gateway/data/models/song_model.dart';
import 'package:music_player/utils/base/base_utils_export.dart';
import 'package:provider/provider.dart';

class MusicProvider with ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  double sliderValue = 0.0;

  List<SongModel> songs = [
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Bailando',
      songerName: 'Billy Ray Cyrus',
      time: '3 : 58',
      songPath: MusicConsts.freePalastineAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Dirty Dancer',
      songerName: 'Alec Benjamin',
      time: '2 : 46',
      songPath: MusicConsts.thakirenaAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Cuando Me Enamoron',
      songerName: 'Mabel',
      time: '4 : 12',
      songPath: MusicConsts.freePalastineAudio,
    ),
    SongModel(
      imagePath: MusicIcons.pauseIcon,
      songName: 'Finally Found You',
      songerName: 'Alec Benjamin',
      time: '4 : 12',
      songPath: MusicConsts.freePalastineAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Heart Attack',
      songerName: 'Bazzi',
      time: '3 : 12',
      songPath: MusicConsts.thakirenaAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Hero',
      songerName: 'BLACKPINK',
      time: '2 : 47',
      songPath: MusicConsts.thakirenaAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Heartbeat',
      songerName: 'Jonas Brothers',
      time: '3 : 56',
      songPath: MusicConsts.freePalastineAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Move To Miami',
      songerName: 'BLACKPINK',
      time: '2 : 47',
      songPath: MusicConsts.thakirenaAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Heart Attack',
      songerName: 'Bazzi',
      time: '3 : 12',
      songPath: MusicConsts.freePalastineAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Hero',
      songerName: 'BLACKPINK',
      time: '2 : 47',
      songPath: MusicConsts.thakirenaAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Bailando',
      songerName: 'Billy Ray Cyrus',
      time: '3 : 58',
      songPath: MusicConsts.freePalastineAudio,
    ),
    SongModel(
      imagePath: MusicIcons.playIcon,
      songName: 'Cuando Me Enamoron',
      songerName: 'Mabel',
      time: '3 : 58',
      songPath: MusicConsts.thakirenaAudio,
    ),
  ];

  static MusicProvider watch(context) => Provider.of<MusicProvider>(context);

  static MusicProvider read(context) => Provider.of<MusicProvider>(context, listen: false);

  MusicProvider() {
    _player.onPlayerStateChanged.listen((state) {
      isPlaying = state == PlayerState.playing;
      notifyListeners();
    });

    _player.onDurationChanged.listen((d) {
      duration = d;
      notifyListeners();
    });

    _player.onPositionChanged.listen((ps) {
      position = ps;
      notifyListeners();
    });
  }

  void onSliderValueChanged(double value) async {
    try {
      final ps = Duration(seconds: value.toInt());
      await _player.seek(ps);
      await _player.resume();
      sliderValue = value;
    } catch (e) {
      ShowToastSnackBar.displayToast(message: 'something went wrong');
    }
    notifyListeners();
  }

  void onPlayPauseSound({String sound = MusicConsts.freePalastineAudio}) async {
    try {
      if (isPlaying) {
        await _player.pause();
      } else {
        await _player.play(AssetSource(sound));
        await _player.resume();
      }
    } catch (e) {
      ShowToastSnackBar.displayToast(message: 'Somthing went wrong');
    }
    notifyListeners();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  void audioFastForward(){
    position += const Duration(seconds: 5);
    notifyListeners();
  }

  void audioRewind(){
    position -= const Duration(seconds: 5);
    notifyListeners();
  }
}