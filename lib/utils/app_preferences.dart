import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static final AppPreference appPreferences = AppPreference.internal();

  late SharedPreferences preferences;

  factory AppPreference() {
    return appPreferences;
  }

  AppPreference.internal();

  Future<void> initialize() async {
    preferences = await SharedPreferences.getInstance();
  }

  void saveOnboardingPref(int status) {
    preferences.setInt("isOnboarded", status);
  }

  Future<int> getOnboardingPref() async {
    return preferences.getInt("isOnboarded") ?? 0;
  }

  void saveUserDetailsPref(int value, String email, String name, String id) {
    preferences.setInt("value", value);
    preferences.setString("name", name);
    preferences.setString("email", email);
    preferences.setString("id", id);
    preferences.setBool("isLoggedIn", true);
  }

  void saveUserLogInStatusPref(bool status) {
    preferences.setBool("isLoggedIn", status);
  }

  Future<bool> getLogInStatusPref() async {
    return preferences.getBool("isLoggedIn") ?? false;
  }

  void saveAppLanguage(bool isArabic) {
    preferences.setBool("isArabic", isArabic);
  }

  bool? getAppLanguage() {
    return preferences.getBool("isArabic");
  }
}
