import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/core/presentation/features/gateway/data/models/song_model.dart';
import 'package:music_player/core/presentation/features/gateway/state_management/provider/music_provider.dart';
import 'package:music_player/utils/base/base_utils_export.dart';
import 'package:music_player/utils/base/extensions/extensions_export.dart';
import 'package:provider/provider.dart';

class SongsTileWidget extends StatelessWidget {
  SongsTileWidget({
    super.key,
    required this.index,
  });

  int index;

  @override
  Widget build(BuildContext context) {
    double width = getScreenWidth(context);
    return Column(
      children: [
        Consumer<MusicProvider>(
          builder: (context, provider, child) {
            return GestureDetector(
              onTap: () {
                provider.songs[index].isPlaying =
                    !provider.songs[index].isPlaying;
                provider.onPlayPauseSound(sound: provider.songs[index].songPath!);
                // MusicNavigation.navigate(context, SongDetailsScreen.id);
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                decoration: BoxDecoration(
                    color: provider.songs[index].isPlaying
                        ? MusicColors.white.withOpacity(.075)
                        : MusicColors.transparent,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(12.0))),
                child: ListTile(
                  style: ListTileStyle.list,
                  leading: Container(
                    width: width * .11,
                    height: width * .11,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: provider.songs[index].isPlaying
                            ? MusicColors.pink
                            : MusicColors.white,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                        provider.songs[index].isPlaying
                            ? MusicIcons.pauseIcon
                            : MusicIcons.playIcon,
                        width: width * .05,
                        height: width * .0425),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(provider.songs[index].songName!,
                          style: MusicFonts.poppinsBold16),
                      8.height,
                      Text(provider.songs[index].songerName!,
                          style: MusicFonts.poppinsThin13),
                    ],
                  ),
                  trailing: Text(
                    provider.songs[index].time!,
                    style: MusicFonts.poppinsThin13,
                  ),
                ),
              ),
            );
          },
        ),
        12.height,
      ],
    );
  }
}
