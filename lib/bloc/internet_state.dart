part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}

final class InternetLostState extends InternetState {}

final class InternetGainedState extends InternetState {}
