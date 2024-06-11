import 'package:meta/meta.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetGained extends InternetState {}

class InternetLost extends InternetState {}
