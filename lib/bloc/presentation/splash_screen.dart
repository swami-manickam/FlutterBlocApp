import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_state.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_event.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/user_details_screen.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashBloc = BlocProvider.of<SplashBloc>(context);
    splashBloc.add(SplashStarted());

    return Scaffold(
      body: Center(
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashNavigationCompleted) {
              // Navigate to the next screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserDetailsScreen()),
              );
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