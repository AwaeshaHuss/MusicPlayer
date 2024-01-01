import 'package:flutter/widgets.dart';
import 'package:music_player/core/presentation/features/gateway/state_management/provider/music_provider.dart';
import 'package:provider/provider.dart';

MultiProvider providers({Widget? child}) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<MusicProvider>(create:(_)=>MusicProvider()),
    ],
    child: child!,
  );
}