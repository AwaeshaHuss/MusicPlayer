import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'secondary_bloc_event.dart';
part 'secondary_bloc_state.dart';

class SecondaryBlocBloc extends Bloc<SecondaryBlocEvent, SecondaryBlocState> {
  SecondaryBlocBloc() : super(SecondaryBlocInitial()) {
    on<SecondaryBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
