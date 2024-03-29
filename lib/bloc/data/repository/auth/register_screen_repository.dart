import 'package:flutter_sample_bloc_pattern/bloc/data/model/auth/register_details.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/provider/auth/register_screen_provider.dart';

class RegisterScreenRepository {
  final RegisterScreenProvider _registerScreenProvider =
      RegisterScreenProvider();

  Future<RegisterDetails> postUserRegisterDetails(String email, String userName,
          String password, String device, String deviceToken) async =>
      _registerScreenProvider.postRegisterDetails(
          email, userName, password, device, deviceToken);
}
