import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/utils/base/helpers/music_colors.dart';
import 'package:music_player/utils/base/helpers/music_icons.dart';

class SongerAnimationWidget extends StatelessWidget {
  const SongerAnimationWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: SizedBox(
              width: width,
              child: SvgPicture.asset(MusicIcons.soundWaveIcon)),
        ),
        Container(
          height: height * .325,
          width: width * .75,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: MusicColors.white.withOpacity(.11),
                    offset: const Offset(2, 4),
                    blurStyle: BlurStyle.inner,
                    blurRadius: 3.0,
                    spreadRadius: 3.0)
              ],
              image: const DecorationImage(
                  image: AssetImage(MusicIcons.songerRoundedIcon))),
        ),
      ],
    );
  }
}