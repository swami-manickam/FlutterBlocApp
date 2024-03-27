import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is UserNameChanged) {
      yield state;
    } else if (event is EmailIdChanged) {
      yield state;
    } else if (event is RegisterPasswordChanged) {
      yield state;
    } else if (event is RegisterButtonPressed) {
      yield RegisterLoading(); // Transition to loading state
      try {
        // Simulate login process, replace with actual logic
        await Future.delayed(const Duration(seconds: 2));
        yield RegisterSuccess();
      } catch (e) {
        yield RegisterError(
            errorMessage: 'Registration failed'); // Transition to error state
      }
    }
  }
}
