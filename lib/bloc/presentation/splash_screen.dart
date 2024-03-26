import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_event.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_state.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/login_screen.dart';

import '../domain/login/login_bloc.dart';
import '../domain/navigationtab/landing_page_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashBloc = BlocProvider.of<SplashBloc>(context);
    splashBloc.add(SplashStarted());
    final LandingPageBloc landingPageBloc = LandingPageBloc();
    final LoginBloc loginScreenBloc = LoginBloc();

    return Scaffold(
      body: Center(
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashNavigationCompleted) {
              // Navigate to the next screen
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider<LoginBloc>.value(
                      value: loginScreenBloc,
                      child: const LoginScreen(),
                    ),
                  ));

              /*BlocProvider<LandingPageBloc>.value(
                      value: landingPageBloc,
                      child: const HomePage(),
                    ),
                  ));*/
            }
          },
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/splash_banner.png',
            image: 'https://via.placeholder.com/400',
            fadeInDuration: Duration(seconds: 1000),
          ),
        ),
      ),
    );
  }
}

class LandingPage {
  const LandingPage();
}

/*MaterialPageRoute(
                    builder: (context) => HomePage() */ /*UserDetailsScreen()*/ /*),*/
