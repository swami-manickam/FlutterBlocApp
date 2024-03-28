import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_event.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_state.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/login_screen.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

import '../domain/login/login_bloc.dart';
import '../domain/navigationtab/landing_page_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    animationController.forward();
    // Listen for animation completion
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Notify Bloc about completion
        BlocProvider.of<SplashBloc>(context).add(SplashStarted());
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
            }
          },
          child: buildSplashScreen(),
        ),
      ),
    );
  }

  Widget buildSplashScreen() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeTransition(
              opacity: animation,
              child: Image.asset(
                'assets/ic_app_logo.png',
                width: 200, // Adjust as needed
                height: 200, // Adjust as needed
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Food Buddy",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 25),
              ),
            )
          ],
        ),
      ],
    );
  }
}

/*MaterialPageRoute(
                    builder: (context) => HomePage() */ /*UserDetailsScreen()*/ /*),*/
