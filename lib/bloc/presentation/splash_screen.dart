import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/navigationtab/landing_page_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_event.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/splashbloc/splash_state.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/home_page.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/screens/login_screen.dart';
import 'package:flutter_sample_bloc_pattern/utils/app_preferences.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  late final SplashBloc _splashBloc;
  late final LandingPageBloc landingPageBloc;

  @override
  void initState() {
    super.initState();
    _splashBloc = SplashBloc();
    landingPageBloc = LandingPageBloc();
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
        // Delay the dispatch of SplashStarted event after the widget is built
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          BlocProvider.of<SplashBloc>(context).add(SplashStarted());
        });
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    landingPageBloc.close();
    _splashBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*final splashBloc = BlocProvider.of<SplashBloc>(context);
    // Dispatch the SplashStarted event when the widget is built
    splashBloc.add(SplashStarted());*/

    return Scaffold(
      body: Center(
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) async {
            if (state is SplashNavigationCompleted) {
              // Navigate to the next screen

              var isLoggedIn = await getLogInStatusPref();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider<LandingPageBloc>.value(
                    value: landingPageBloc,
                    child: isLoggedIn ? HomePage() : LoginScreen(),
                  ),
                ),
              );
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
