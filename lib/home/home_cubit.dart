import 'dart:async';
import 'package:authendication_app/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(remainingTime: const Duration(minutes: 20), isRunning: false));

  Timer? _timer;

  void start() {
    if (state.isRunning) return; 
    emit(state.copyWith(isRunning: true));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingTime.inSeconds > 0) {
        emit(state.copyWith(
          remainingTime: state.remainingTime - const Duration(seconds: 1),
        ));
      } 
      else {
        stop(); 
      }
    });
  }

  void stop() {
    _timer?.cancel();
    emit(state.copyWith(isRunning: false));
  }

  @override
  Future<void> close() {
    _timer?.cancel(); 
    return super.close();
  }
}
