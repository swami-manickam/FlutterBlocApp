

import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_state.dart';

// States
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashNavigationCompleted extends SplashState {}