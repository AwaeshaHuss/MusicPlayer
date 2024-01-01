import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/presentation/features/gateway/state_management/bloc/music_bloc_bloc.dart';

MultiBlocProvider blocProviders({Widget? child}) => MultiBlocProvider(
      providers: [
        BlocProvider<MusicBloc>(create: (context) => MusicBloc()),
      ],
      child: child!,
    );
