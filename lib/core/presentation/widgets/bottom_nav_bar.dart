import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/core/presentation/features/gateway/screens/allsongs_screen.dart';
import 'package:music_player/core/presentation/features/gateway/state_management/provider/music_provider.dart';
import 'package:music_player/core/presentation/features/secondary/screens/song_details_screen.dart';
import 'package:music_player/core/presentation/widgets/mindicator.dart';
import 'package:music_player/utils/base/base_utils_export.dart';
import 'package:music_player/utils/base/extensions/extensions_export.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  int _selectedItemPosition = 0;
  //----
  List<Widget> screens = [
    AllSongsScreen(),
    Scaffold(
        body: Center(
            child: Text('Search..',
                style: MusicFonts.poppinsBold18
                    .copyWith(color: MusicColors.white)))),
    Scaffold(
        body: Center(
            child: Text('Listen',
                style: MusicFonts.poppinsBold18
                    .copyWith(color: MusicColors.white)))),
    Scaffold(
        body: Center(
            child: Text('Podcasts',
                style: MusicFonts.poppinsBold18
                    .copyWith(color: MusicColors.white)))),
    Scaffold(
        body: Center(
            child: Text('Settings',
                style: MusicFonts.poppinsBold18
                    .copyWith(color: MusicColors.white))))
  ];
  //----
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MusicColors.black_1,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _selectedItemPosition = index;
              });
            },
            children: screens,
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                  onTap: () =>
                      MusicNavigation.navigate(context, SongDetailsScreen.id),
                  child: Consumer<MusicProvider>(
                    builder: (context, provider, child) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Opacity(
                            opacity: .88,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadiusDirectional.all(
                                      Radius.circular(12.0)),
                                  gradient: LinearGradient(
                                      tileMode: TileMode.mirror,
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        MusicColors.pink.withOpacity(.1),
                                        MusicColors.grey,
                                        MusicColors.grey,
                                        MusicColors.pink.withOpacity(.1),
                                        MusicColors.pink.withOpacity(.1),
                                        MusicColors.pink.withOpacity(.1),
                                        MusicColors.pink.withOpacity(.1),
                                      ])),
                              width: getScreenWidth(context) * .975,
                              height: kBottomNavigationBarHeight * 1.125,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(MusicIcons.songerIcon),
                                      ),
                                      Text(
                                        'Finaly Fouond You',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: MusicColors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  const Spacer(
                                    flex: 4,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              provider.onPlayPauseSound();
                                            },
                                            child: SvgPicture.asset(
                                              provider.isPlaying
                                              ?MusicIcons.pauseIcon:MusicIcons.playIcon,
                                              color: MusicColors.white,
                                              width: 21,
                                              height: 21,
                                            )),
                                        16.width,
                                        GestureDetector(
                                            onTap: () {},
                                            child: SvgPicture.asset(
                                                MusicIcons.nextIcon)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: -1,
                              child: Stack(
                                children: [
                                  Container(
                                    color: MusicColors.black_1.withOpacity(.85),
                                    width: getScreenWidth(context),
                                    height: 3,
                                  ),
                                  MIndicator(
                                      isExpanded: false,
                                      lineWidth: (provider.isPlaying) ? ((provider.sliderValue > 5) ?getScreenWidth(context) * (provider.sliderValue/(provider.duration.inSeconds-provider.position.inSeconds) ): 43):65),
                                ],
                              ))
                        ],
                      );
                    },
                  )),
              Container(
                height: kBottomNavigationBarHeight * 1.425,
                color: MusicColors.black_1.withOpacity(.5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      5,
                      (index) => _buildItems(index, context),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItems(
    int index,
    BuildContext context,
  ) {
    return index == 2
        ? GestureDetector(
            onTap: () => _onSelectItem(index),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                  color: MusicColors.pink, shape: BoxShape.circle),
              child: SvgPicture.asset(MusicIcons.listenIcon,
                  width: 21, height: 21),
            ),
          )
        : index == 0
            ? GestureDetector(
                onTap: () => _onSelectItem(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    4.height,
                    SvgPicture.asset(MusicIcons.homeIcon,
                        width: 21, height: 21),
                    8.height,
                    index == _selectedItemPosition
                        ? MIndicator(
                            isExpanded: false,
                            lineWidth: getScreenWidth(context) * .04)
                        : 1.width,
                  ],
                ),
              )
            : index == 1
                ? GestureDetector(
                    onTap: () => _onSelectItem(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        4.height,
                        SvgPicture.asset(MusicIcons.searchIcon,
                            width: 21, height: 21),
                        8.height,
                        index == _selectedItemPosition
                            ? MIndicator(
                                isExpanded: false,
                                lineWidth: getScreenWidth(context) * .04)
                            : 1.width,
                      ],
                    ),
                  )
                : index == 3
                    ? GestureDetector(
                        onTap: () => _onSelectItem(index),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            4.height,
                            SvgPicture.asset(MusicIcons.podcastsIcon,
                                width: 21, height: 21),
                            8.height,
                            index == _selectedItemPosition
                                ? MIndicator(
                                    isExpanded: false,
                                    lineWidth: getScreenWidth(context) * .04)
                                : 1.width,
                          ],
                        ),
                      )
                    : index == 4
                        ? GestureDetector(
                            onTap: () => _onSelectItem(index),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                4.height,
                                SvgPicture.asset(MusicIcons.settingsIcon,
                                    width: 21, height: 21),
                                8.height,
                                index == _selectedItemPosition
                                    ? MIndicator(
                                        isExpanded: false,
                                        lineWidth:
                                            getScreenWidth(context) * .04)
                                    : 1.width,
                              ],
                            ),
                          )
                        : 1.width;
  }

  void _onSelectItem(int index) {
    return setState(() {
      _selectedItemPosition = index;
      _pageController.animateToPage(index,
          duration: Durations.medium2, curve: Curves.linear);
    });
  }
}
