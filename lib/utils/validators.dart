import 'package:get/get.dart';

class Validators {
  static String? passwordValidator(String value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 8) {
      return "Password too short";
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return "Required";
    } else if (confirmPassword.length < 8) {
      return "Password too short";
    } else if (confirmPassword != password) {
      return "Password do not match";
    } else {
      return null;
    }
  }

  static String? usernameValidator(String value) {
    if (value.isEmpty) {
      return "Required";
    } else if (!GetUtils.isUsername(value)) {
      return "Invalid Username";
    } else {
      return null;
    }
  }

  static String? emailValidator(String value) {
    if (value.isEmpty) {
      return "Required";
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static bool isValidEmail(String? value) {
    if (value == null) return false;
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value);
  }

  static bool isValidPassword(String? value) {
    if (value == null) return false;
    return value.trim().length >= 6 && value.trim().length <= 20;
  }

  static bool isValidEgPhone(String? value) {
    if (value == null) return false;
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(value);
  }

  static bool hasMinLength(String? value, {int minLength = 1}) {
    if (value == null) return false;
    return value.trim().length >= minLength;
  }
}
