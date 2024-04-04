import 'dart:convert';

import 'package:flutter_sample_bloc_pattern/data/model/auth/login_details.dart';
import 'package:http/http.dart' as http;
/*import 'package:http_interceptor/http_client_with_interceptor.dart';*/

class LoginScreenProvider {
  final Url = "https://qa-apis.90mins.co/api/login";

  Future<LoginDetails> postLoginDetails(
      String email, String password, String device, String deviceToken) async {
    /* final client =
        HttpClientWithInterceptor.build(interceptors: [NetworkInterceptor()]);*/

    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'device': device,
        'device_token': deviceToken,
      }),
    );

    if (response.statusCode == 200) {
      print("Success");
      final resData = LoginDetails.fromJson(jsonDecode(response.body));
      return resData;
    }
    throw Exception('Not able to post the data: ${response.body}');
  }
}
