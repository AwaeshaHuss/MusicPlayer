
import 'package:flutter/material.dart';
import 'package:music_player/core/presentation/features/gateway/state_management/provider/music_provider.dart';
import 'package:music_player/core/presentation/features/gateway/widgets/allsongs_appbar.dart';
import 'package:music_player/core/presentation/features/gateway/widgets/songslist_widget.dart';
import 'package:music_player/utils/base/base_utils_export.dart';

class AllSongsScreen extends StatelessWidget {
  AllSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = getScreenHeight(context);
    MusicProvider provider = MusicProvider.watch(context);
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * .125),
            child: SizedBox(
              height: kBottomNavigationBarHeight * 1.125,
              child: AllSongsAppBar(onSearch: (){},))),
          body: ListView(
        children: [
          SizedBox(
            height: height,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: provider.songs.length,
              itemBuilder: (context, index) {
              return SongsTileWidget(index: index);
            }),
          ),
        ],
      )),
    );
  }
}



