part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  final int count;

  HomeInitial({required this.count});


  @override
  List<Object> get props => [count];
}

final class HomeIncrement extends HomeState {
  @override
  List<Object> get props => [];
}
