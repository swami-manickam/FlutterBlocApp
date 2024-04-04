import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/splashbloc/splash_event.dart';
import 'package:flutter_sample_bloc_pattern/domain/splashbloc/splash_state.dart';

// Bloc

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashStarted) {
      yield SplashLoading(); // Transition to loading state

      // Simulate delay before navigation
      await Future.delayed(const Duration(seconds: 2));

      // Navigate to the next screen
      yield SplashNavigationCompleted();
    }
  }

  /*Future<void> mapSignInWithGoogleToState(
    SplashEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());
    try {
      await Future.delayed(const Duration(seconds: 4));
      emit(SplashNavigationCompleted());
    } catch (e) {
      print(e);
      emit(SplashNavigationCompleted());
    }
  }


  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>(_mapSplashStartedToState);
  }

  Stream<SplashState> _mapSplashStartedToState(
      SplashStarted event,
      Emitter<SplashState> emit,
      ) async* {
    yield SplashLoading(); // Transition to loading state

    // Simulate delay before navigation
    await Future.delayed(const Duration(seconds: 4));

    // Navigate to the next screen
    yield SplashNavigationCompleted();
  }*/
}
