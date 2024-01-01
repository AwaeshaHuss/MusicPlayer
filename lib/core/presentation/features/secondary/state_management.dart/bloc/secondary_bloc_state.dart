part of 'secondary_bloc_bloc.dart';

sealed class SecondaryBlocState extends Equatable {
  const SecondaryBlocState();
  
  @override
  List<Object> get props => [];
}

final class SecondaryBlocInitial extends SecondaryBlocState {}
