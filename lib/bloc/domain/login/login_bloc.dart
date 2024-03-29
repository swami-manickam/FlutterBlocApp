import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/model/auth/login_details.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/repository/auth/login_screen_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginScreenRepository loginScreenRepository;
  LoginBloc({required this.loginScreenRepository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield state; // Maintain the current state
      // Handle email changed event here, you can perform validation or any other logic
    } else if (event is PasswordChanged) {
      yield state; // Maintain the current state
      // Handle password changed event here, you can perform validation or any other logic
    } else if (event is LoginButtonPressed) {
      yield LoginLoading(); // Transition to loading state
      try {
        // Simulate login process, replace with actual logic

        LoginDetails loginDetails =
            await loginScreenRepository.postUserLoginDetails(
                event.email, event.password, event.device, event.deviceToken);
        await Future.delayed(
            const Duration(seconds: 4)); // Simulating network delay
        if (loginDetails.status ?? false) {
          yield LoginSuccess(loginDetails); // Transition to success state
          log("emailId: ", error: loginDetails.message);
        } else {
          yield LoginError(
              errorMessage: loginDetails.message ?? 'Login failed');
        }
      } catch (e) {
        yield LoginError(
            errorMessage: 'error caught: $e'); // Transition to error state
      }
    }
  }
}
