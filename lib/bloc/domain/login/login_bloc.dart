import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

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
        await Future.delayed(
            const Duration(seconds: 2)); // Simulating network delay
        yield LoginSuccess(); // Transition to success state
      } catch (e) {
        yield LoginError(
            errorMessage: 'Login failed'); // Transition to error state
      }
    }
  }
}
