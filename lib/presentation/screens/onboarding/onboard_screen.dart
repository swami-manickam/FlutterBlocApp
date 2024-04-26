import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/auth/login_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/domain/login/login_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/onboard/onboard_bloc.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/login_screen.dart';
import 'package:flutter_sample_bloc_pattern/presentation/widgets/onboard_image.dart';
import 'package:flutter_sample_bloc_pattern/utils/app_preferences.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class OnboardingScreenNew extends StatefulWidget {
  const OnboardingScreenNew({super.key});

  @override
  State<OnboardingScreenNew> createState() => _OnboardingScreenNewState();
}

class _OnboardingScreenNewState extends State<OnboardingScreenNew> {
  int _currentPageIndex = 0;

  late final LoginBloc loginScreenBloc;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    loginScreenBloc = LoginBloc(loginScreenRepository: LoginScreenRepository());
    // _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          if (state is PageChangedState) {
            // Handle page change state
            return _buildOnboardingScreen(context, state.pageIndex);
          } else if (state is OnboardingCompletedState) {
            // Handle onboarding completed state (e.g., navigate to next screen)
            return Container();
          } else {
            // Initial state or other states
            return _buildOnboardingScreen(context, 0);
          }
        },
      ),
    );
  }

  Widget _buildOnboardingScreen(BuildContext context, int pageIndex) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ClipRRect(
                /*borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                ),*/
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    _currentPageIndex = value; // Update current page index
                    context.read<OnboardingBloc>().add(NextPageEvent());
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return OnboardImage(
                      currentPageIndex: index,
                      onboardImg: onboardList[index].image,
                      title: onboardList[index].title,
                      desc: onboardList[index].description,
                      skip: index != onboardList.length - 1,
                    );
                  },
                  itemCount: onboardList.length,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    onboardList[_currentPageIndex].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    onboardList[_currentPageIndex].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  /*Stack(
                    children: [
                      Positioned(
                        top: 40,
                        right: 20,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_currentPageIndex != onboardList.length - 1) {
                                _currentPageIndex++;
                                _pageController.animateToPage(_currentPageIndex,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut);
                              } else {
                                saveOnboardingPref(1);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        BlocProvider<LoginBloc>.value(
                                      value: loginScreenBloc,
                                      child: const LoginScreen(),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              alignment: Alignment.bottomRight,
                              width: 100,
                              child: Text(
                                _currentPageIndex == onboardList.length - 1
                                    ? 'Get Started'
                                    : 'Next',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      )
                    ],
                  )*/
                ],
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPageIndex != onboardList.length - 1) {
                        _currentPageIndex++;
                        _pageController.animateToPage(_currentPageIndex,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      } else {
                        saveOnboardingPref(1);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider<LoginBloc>.value(
                              value: loginScreenBloc,
                              child: const LoginScreen(),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      _currentPageIndex == onboardList.length - 1
                          ? 'Get Started'
                          : 'Next',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            )
            // Your other widgets here
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginScreenBloc.close();
    super.dispose();
  }
}
