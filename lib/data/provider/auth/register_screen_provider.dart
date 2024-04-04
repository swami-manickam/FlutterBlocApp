import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_sample_bloc_pattern/data/model/auth/register_details.dart';
import 'package:http/http.dart' as http;

class RegisterScreenProvider {
  final Url = "https://qa-apis.90mins.co/api/register";

  Future<RegisterDetails> postRegisterDetails(String email, String userName,
      String password, String device, String deviceToken) async {
    final response = await http.post(Uri.parse("Url"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'device': device,
          'device_token': deviceToken,
        }));

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Success");
      }
      final resData = RegisterDetails.fromJson(jsonDecode(response.body));
      return resData;
    }
    throw Exception('Not able to post the data: ${response.body}');
  }
}
