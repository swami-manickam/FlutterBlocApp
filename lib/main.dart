import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/user_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserDetailsScreen(),
    );
  }
}