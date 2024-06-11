import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivityStream;

  InternetBloc() : super(InternetInitial()) {
    on<InternetGainedEvent>(
      (event, emit) => emit(InternetGainedState()),
    );
    on<InternetLostEvent>(
      (event, emit) => emit(InternetLostState()),
    );
    connectivityStream = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    connectivityStream?.cancel();
    return super.close();
  }
}
