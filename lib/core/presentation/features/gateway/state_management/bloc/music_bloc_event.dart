part of 'music_bloc_bloc.dart';

sealed class MusicBlocEvent extends Equatable {
  const MusicBlocEvent();
  @override
  List<Object> get props => [];
}

class PlayPauseMusic extends MusicBlocEvent{
   PlayPauseMusic(); 
}

