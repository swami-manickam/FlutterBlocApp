import 'package:flutter_sample_bloc_pattern/data/model/auth/login_details.dart';
import 'package:flutter_sample_bloc_pattern/data/provider/auth/login_screen_provider.dart';

class LoginScreenRepository {
  final LoginScreenProvider _loginScreenProvider = LoginScreenProvider();

  Future<LoginDetails> postUserLoginDetails(String email, String password,
          String device, String deviceToken) async =>
      _loginScreenProvider.postLoginDetails(
          email, password, device, deviceToken);
}
