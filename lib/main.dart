import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/auth/login_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/product_list_repository.dart';
import 'package:flutter_sample_bloc_pattern/domain/login/login_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/navigationtab/landing_page_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/news/news_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/onboard/onboard_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/product/product_list_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/splashbloc/splash_bloc.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/splash_screen.dart';
import 'package:flutter_sample_bloc_pattern/utils/app_preferences.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/onboarding/onboard_screen.dart';

extension Captilization on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;

    return this[0].toUpperCase() + substring(1);
  }
}

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}

void main() async {
  /*runApp(const MyApp());*/
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference().initialize();
  runApp(
    MultiProvider(
      providers: [
        Provider<OnboardingBloc>(
          create: (_) => OnboardingBloc(),
          dispose: (_, bloc) => bloc.close(),
        ),
        Provider<SplashBloc>(
          create: (_) => SplashBloc(),
          dispose: (_, bloc) => bloc.close(),
        ),
        Provider<LoginBloc>(
          create: (_) =>
              LoginBloc(loginScreenRepository: LoginScreenRepository()),
          // Your LoginBloc initialization logic
          dispose: (_, bloc) => bloc.close(),
        ),
        Provider<LandingPageBloc>(
          create: (_) =>
              LandingPageBloc(), // Your LandingBloc initialization logic
          dispose: (_, bloc) => bloc.close(),
        ),
        Provider<ProductListBloc>(
          create: (_) =>
              ProductListBloc(productListRepository: ProductListRepository()),
          // Your LoginBloc initialization logic
          dispose: (_, bloc) => bloc.close(),
        ),
        Provider<NewsBloc>(
          create: (_) => NewsBloc(),
          dispose: (_, bloc) => bloc.close(),
        ),
        // Add other providers if necessary
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());

    /*BlocProvider(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          )*/
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _isOnboarded = 1;

  AppPreference prefsManager = AppPreference();

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    int onboardingStatus = await prefsManager.getOnboardingPref();
    setState(() {
      _isOnboarded = onboardingStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: _isOnboarded == 1
            ? BlocProvider(
                create: (context) => SplashBloc(), child: const SplashScreen())
            : BlocProvider(
                create: (context) => OnboardingBloc(),
                child: const OnboardingScreenNew()));
  }
}
