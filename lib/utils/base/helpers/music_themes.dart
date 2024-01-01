import 'package:flutter/material.dart';
import 'package:music_player/utils/base/base_utils_export.dart';

class MusicThemes{

  MusicThemes._();

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: MusicColors.black_1,
    textTheme: const TextTheme(
       bodyLarge:TextStyle(
           fontSize: 26.0,
           fontFamily: MusicConsts.poppinsBold,
           color: Color(0xff2E2B2A),
           height: 2.0
       ),
       bodyMedium:TextStyle(
         fontSize: 14.0,
         fontFamily: MusicConsts.latoRegular,
         fontWeight: FontWeight.w700,
         color: Color(0xff2E2B2A),
         height: 1.8,
       ),
       bodySmall:TextStyle(
         fontSize: 10.0,
         fontFamily: MusicConsts.poppinsThin,
         color: Color(0xFF7A3FE1),
         height: 1.3,
       ),
     ),
     elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: MusicFonts.latoRegular16,
        foregroundColor: MusicColors.transparent,
        backgroundColor: MusicColors.pink,
        minimumSize: const Size(130.0, 34.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
       splashColor: MusicColors.pink,
       buttonColor: MusicColors.pink,
       height: 34.0,
       highlightColor: MusicColors.pink,
       textTheme: ButtonTextTheme.normal,
     ),
  );
}