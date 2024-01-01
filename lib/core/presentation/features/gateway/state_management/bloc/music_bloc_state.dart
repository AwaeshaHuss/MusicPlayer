import 'package:equatable/equatable.dart';


enum MusicStateStatus { stopped, pause, error, loading, playing }

extension HomeStateStatusX on MusicStateStatus {
  bool get isStopped => this == MusicStateStatus.stopped;
  bool get isPause => this == MusicStateStatus.pause;
  bool get isError => this == MusicStateStatus.error;
  bool get isLoading => this == MusicStateStatus.loading;
  bool get isPlaying => this == MusicStateStatus.playing;
}

class MusicState extends Equatable {
  final MusicStateStatus status;
  const MusicState({
    this.status = MusicStateStatus.stopped,
  });

  MusicState copyWith({
    MusicStateStatus? status,
  }) {
    return MusicState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    status,
  ];
}
