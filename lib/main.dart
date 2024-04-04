import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/auth/login_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/product_list_repository.dart';
import 'package:flutter_sample_bloc_pattern/domain/login/login_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/navigationtab/landing_page_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/product/product_list_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/splashbloc/splash_bloc.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/splash_screen.dart';
import 'package:provider/provider.dart';

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

void main() {
  /*runApp(const MyApp());*/

  runApp(
    MultiProvider(
      providers: [
        Provider<LoginBloc>(
          create: (_) =>
              LoginBloc(loginScreenRepository: LoginScreenRepository()),
          // Your LoginBloc initialization logic
          dispose: (_, bloc) => bloc.close(),
        ),
        Provider<LandingPageBloc>(
          create: (_) =>
              LandingPageBloc(), // Your LoginBloc initialization logic
          dispose: (_, bloc) => bloc.close(),
        ),
        Provider<ProductListBloc>(
          create: (_) =>
              ProductListBloc(productListRepository: ProductListRepository()),
          // Your LoginBloc initialization logic
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
        home: Scaffold(
          appBar: null,
          body: BlocProvider(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          ),
        ));
  }
}
