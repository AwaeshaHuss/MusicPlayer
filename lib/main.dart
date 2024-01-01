import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/data/cache_helper.dart';
import 'package:music_player/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:music_player/utils/base/base_utils_export.dart';
import 'package:music_player/utils/config/config_export.dart';
import 'package:music_player/utils/config/providers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return blocProviders(
      child: providers(
        child: MaterialApp(
            title: MusicConsts.appName,
            debugShowCheckedModeBanner: false,
            theme: MusicThemes.darkTheme,
            routes: MusicNavigation.routes,
            home: const BottomNavBar(),
        ),
      ),
    );
  }
}
