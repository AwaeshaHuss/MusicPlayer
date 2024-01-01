import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/core/presentation/features/gateway/state_management/provider/music_provider.dart';
import 'package:music_player/core/presentation/features/secondary/widgets/songeranimation_widget.dart';
import 'package:music_player/core/presentation/widgets/mbutton.dart';
import 'package:music_player/utils/base/base_utils_export.dart';
import 'package:music_player/utils/base/extensions/extensions_export.dart';
import 'package:provider/provider.dart';

class SongDetailsScreen extends StatefulWidget {
  const SongDetailsScreen({super.key});
  static const String id = '/SongDetailsScreen';

  @override
  State<SongDetailsScreen> createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {
  
  @override
  Widget build(BuildContext context) {
    double height = getScreenHeight(context);
    double width = getScreenWidth(context);
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      colors: [
                        MusicColors.white.withOpacity(.185),
                        MusicColors.white.withOpacity(.1),
                        MusicColors.grey,
                        MusicColors.grey,
                        // MusicColors.white.withOpacity(.25),
                      ]),
                  image: const DecorationImage(
                      image: AssetImage(MusicIcons.songBG))),
            ),
            Consumer<MusicProvider>(builder: (context, provider, child) {
              return Column(
              children: [
                (height * .065).height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          onPop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: MusicColors.white,
                        )),
                    const Text(
                      'NOW PLAYING\t',
                      style: MusicFonts.poppinsBold16,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 12.0, bottom: 4.5),
                      child: SvgPicture.asset(MusicIcons.searchIcon,
                          width: 18, height: 18),
                    ),
                  ],
                ),
                (height * .036).height,
                SongerAnimationWidget(width: width, height: height),
                (height * .04).height,
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        10.width,
                        Expanded(
                          child: MButton(
                            alignment: MainAxisAlignment.center,
                            backgroundColor: MusicColors.black_1,
                            borderColor: MusicColors.white,
                            borderRaduis: 24.0,
                            vPadding: 8.0,
                            hPadding: 16.0,
                            imagePath: MusicIcons.favoriteIcon,
                            text: 'FOLLOW',
                          ),
                        ),
                        8.width,
                        Expanded(
                          child: MButton(
                            alignment: MainAxisAlignment.spaceBetween,
                            backgroundColor: MusicColors.pink,
                            borderColor: MusicColors.pink,
                            borderRaduis: 24.0,
                            vPadding: 8.0,
                            hPadding: 12.0,
                            imagePath: MusicIcons.shuffleIcon,
                            text: 'SHUFFLE PLAY',
                          ),
                        ),
                        10.width,
                      ],
                    ),
                  ),
                ),
                (height * .06125).height,
                const Text(
                  'Finally Found You',
                  style: MusicFonts.poppinsBold18,
                ),
                12.height,
                Text(
                  'enrique iglesias',
                  style: MusicFonts.poppinsThin13.copyWith(fontSize: 14),
                ),
                (height * .05).height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(provider.formatTime(provider.position), style: MusicFonts.poppinsThin13,),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Slider(
                          min: 0,
                          max: provider.duration.inSeconds.toDouble(),
                          value: provider.position.inSeconds.toDouble(),
                          activeColor: MusicColors.pink,
                          thumbColor: MusicColors.pink,
                          inactiveColor: MusicColors.white.withOpacity(.5),
                          onChanged: provider.onSliderValueChanged)),
                       Text(provider.formatTime(provider.duration - provider.position), style: MusicFonts.poppinsThin13,),
                    ],
                  ),
                ),
                (height * .04125).height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(MusicIcons.skipBackward),
                    GestureDetector(
                      onTap: () => provider.audioRewind(),
                      child: SvgPicture.asset(MusicIcons.rewindIcon)),
                    GestureDetector(
                      onTap: provider.onPlayPauseSound,
                      child: Container(
                        width: width * .1525,
                        height: width * .1525,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                            color: MusicColors.white, shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          provider.isPlaying
                          ?MusicIcons.pauseIcon
                          :MusicIcons.playIcon,
                          width: width * .065,
                          height: width * .065,
                          color: MusicColors.black_1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => provider.audioFastForward(),
                      child: SvgPicture.asset(MusicIcons.fastForwardIcon)),
                    SvgPicture.asset(
                      MusicIcons.nextIcon,
                      width: 14.45,
                      height: 14.45,
                    ),
                  ],
                ),
              ],
            );
            },)
            ],
        ),
      ),
    );
  }
}

// OldSoundSlider
/*

Container(
                        height: 2.0,
                        color: MusicColors.white,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const PositionedDirectional(
                              top: 0,
                              bottom: 0,
                              start: 220,
                              end: 0,
                              child: Divider(
                                  color: MusicColors.pink, thickness: 3.0),
                            ),
                            PositionedDirectional(
                              bottom: -7.65,
                              end: 127,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: MusicColors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            MusicColors.white.withOpacity(.125),
                                        offset: const Offset(0, 2),
                                        blurStyle: BlurStyle.inner,
                                        blurRadius: 3.0,
                                        spreadRadius: 4.0),
                                    BoxShadow(
                                        color:
                                            MusicColors.white.withOpacity(.125),
                                        offset: const Offset(0, -2),
                                        blurStyle: BlurStyle.inner,
                                        blurRadius: 3.0,
                                        spreadRadius: 4.0)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

*/