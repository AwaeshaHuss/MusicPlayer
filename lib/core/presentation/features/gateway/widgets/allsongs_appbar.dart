
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/utils/base/helpers/music_fonts.dart';
import 'package:music_player/utils/base/helpers/music_icons.dart';

class AllSongsAppBar extends StatelessWidget {
  const AllSongsAppBar({
    super.key,
    required this.onSearch
  });

  final Function() onSearch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('ALL SONGS', style: MusicFonts.poppinsBold18),
        ),
        GestureDetector(
          onTap: onSearch,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(MusicIcons.searchIcon),
          ),
        )
      ],
    );
  }
}