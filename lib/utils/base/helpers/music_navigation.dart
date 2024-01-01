import 'package:flutter/material.dart';
import 'package:music_player/core/presentation/features/secondary/screens/song_details_screen.dart';

class MusicNavigation {
  MusicNavigation._();

  static Map<String, WidgetBuilder> routes = {
    SongDetailsScreen.id:(context) => const SongDetailsScreen(),
  };

  static void navigate(BuildContext context, String routeName,
      {bool replaceCurrentScreen = false, bool clearHistory = false}) {
    if (clearHistory) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        (Route<dynamic> route) => false,
      );
    } else if (replaceCurrentScreen) {
      Navigator.pushReplacementNamed(context, routeName);
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }

  static String getCurrentRouteName(BuildContext context) {
    final currentRoute = ModalRoute.of(context);
    final route = currentRoute?.settings;
    final routeName = route?.name;
    //  log('==CURRENT_ROUTE==\n$routeName\n====');
    return routeName ?? '';
  }
}
