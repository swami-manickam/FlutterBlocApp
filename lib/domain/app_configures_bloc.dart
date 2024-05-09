import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/utils/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfiguresBloc {
  final languageController = StreamController<String>();
  final modeController = StreamController<String>();

  AppPreference prefsManager = AppPreference();

  String currentLanguage = 'en';
  ThemeMode currentMode = ThemeMode.light;
  SharedPreferences? sharedPreferences;

  Stream<String> get languageStream => languageController.stream;

  AppConfiguresBloc() {}

  Future<void> initialize() async {}

  void loadAppConfig() {
    if (prefsManager.getAppLanguage() ?? false) {
      currentLanguage = 'ar';
    } else {
      currentLanguage = 'en';
    }

    languageController.sink.add(currentLanguage);
  }

  void changeAppLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) {
      return;
    }
    currentLanguage = newLanguage;
    if (currentLanguage == 'ar') {
      prefsManager.saveAppLanguage(true);
    } else {
      prefsManager.saveAppLanguage(false);
    }
    languageController.sink.add(currentLanguage);
  }

  void dispose() {
    languageController.close();
  }
}
