import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/auth/login_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/domain/login/login_bloc.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/scrolling_images.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/splash_screen.dart';
import 'package:flutter_sample_bloc_pattern/utils/app_preferences.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: -10,
            left: -160,
            child: Row(
              children: [
                ScrollingImages(startingIndex: 0),
                ScrollingImages(startingIndex: 1),
                ScrollingImages(startingIndex: 2),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.6,
                width: w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.5),
                      Colors.white,
                      Colors.white
                    ], begin: Alignment.topCenter, end: Alignment.center)),
                child: Column(
                  children: [
                    const Spacer(),
                    const Text(
                      "Welcome to Bloc App!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "When diet is wrong, medicine is of no use",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "When diet is correct, medicine is of no need.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        //Navigator.of(context).pushNamed("Login");
                        saveOnboardingPref(1);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (context) => LoginBloc(
                                  loginScreenRepository:
                                      LoginScreenRepository()),
                              child: const SplashScreen(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: w * 0.8,
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        decoration: const BoxDecoration(
                            color: btnBbColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 70.0),
                              child: Text(
                                "Explore Your Diet",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.mail,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
