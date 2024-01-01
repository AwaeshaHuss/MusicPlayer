import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'music_bloc_state.dart';

part 'music_bloc_event.dart';

class MusicBloc extends Bloc<MusicBlocEvent, MusicState> {
  MusicBloc() : super(const MusicState()) {
    on<PlayPauseMusic>(_playPauseMusic);
  }
  final AudioPlayer player = AudioPlayer();
  
  static MusicBloc get(context) => BlocProvider.of(context);

  FutureOr<void> _playPauseMusic(PlayPauseMusic event, Emitter<MusicState> emit) async{
    emit(state.copyWith(status: MusicStateStatus.stopped));
  }

}
