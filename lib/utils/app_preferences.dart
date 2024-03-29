import 'package:shared_preferences/shared_preferences.dart';

saveUserDetailsPref(int value, String email, String name, String id) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt("value", value);
  preferences.setString("name", name);
  preferences.setString("email", email);
  preferences.setString("id", id);
  preferences.setBool("isLoggedIn", true);
  preferences.commit();
}

saveUserLogInStatusPref(bool status) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("isLoggedIn", status);
  preferences.commit();
}

Future<bool> getLogInStatusPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool("isLoggedIn") ?? false;
}
