import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_event.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_state.dart';

// Bloc

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashStarted) {
      yield SplashLoading();

      // Simulate some delay before navigating to the next screen
      await Future.delayed(Duration(seconds: 4));

      // Navigate to the next screen
      yield SplashNavigationCompleted();
    }
  }
}
