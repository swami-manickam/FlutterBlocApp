import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/auth/login_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/auth/register_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/domain/login/login_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/register/register_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/splashbloc/splash_bloc.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/landing_page.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/login_screen.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/onboarding_screen.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/register_screen.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/splash_screen.dart';

import '../../domain/navigationtab/landing_page_bloc.dart';

class RouteGenerator {
  final SplashBloc splashBloc = SplashBloc();
  final LandingPageBloc landingPageBloc = LandingPageBloc();
  final LoginBloc loginPageBloc =
      LoginBloc(loginScreenRepository: LoginScreenRepository());
  final RegisterBloc registerPageBloc =
      RegisterBloc(registerScreenRepository: RegisterScreenRepository());

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SplashBloc>.value(
            value: splashBloc,
            child: const SplashScreen(),
          ),
        );
      case "onBoarding":
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case 'Home':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LandingPageBloc>.value(
            value: landingPageBloc,
            child: const HomePage(),
          ),
        );

      case "Login":
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoginBloc>.value(
            value: loginPageBloc,
            child: const LoginScreen(),
          ),
        );
      case "Register":
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterBloc>.value(
            value: registerPageBloc,
            child: const RegisterScreen(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
