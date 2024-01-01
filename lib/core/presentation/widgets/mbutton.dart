import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/utils/base/extensions/extensions_export.dart';
import 'package:music_player/utils/base/helpers/music_colors.dart';
import 'package:music_player/utils/base/helpers/music_fonts.dart';

class MButton extends StatelessWidget {
   MButton({
    super.key,
    required this.alignment,
    this.backgroundColor,
    this.borderColor,
    this.borderRaduis,
    this.hPadding,
    this.vPadding,
    this.imagePath,
    this.text
  });

  Color? backgroundColor;
  Color? borderColor;
  double? vPadding, hPadding;
  double? borderRaduis;
  String? imagePath;
  String? text;
  MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: vPadding ?? 0, horizontal: hPadding ?? 0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor ?? MusicColors.transparent
        ),
        borderRadius: BorderRadius.circular(borderRaduis ?? 0)
      ),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          SvgPicture.asset(imagePath ?? ''),
          6.width,
          Text(text ?? '', style: MusicFonts.latoRegular16,)
        ],
      ),
    );
  }
}