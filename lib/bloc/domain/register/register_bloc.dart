import 'package:bloc/bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/model/auth/register_details.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/repository/auth/register_screen_repository.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterScreenRepository registerScreenRepository;

  RegisterBloc({required this.registerScreenRepository})
      : super(RegisterInitial());

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

        RegisterDetails details =
            await registerScreenRepository.postUserRegisterDetails(
                event.emailId,
                event.userName,
                event.password,
                event.device,
                event.deviceToken);

        await Future.delayed(const Duration(seconds: 4));

        if (details.status ?? false) {
          yield RegisterSuccess();
        } else {
          yield RegisterError(
              errorMessage: 'Registration failed'); // Transition to error state
        }
      } catch (e) {
        yield RegisterError(
            errorMessage: 'error caught: $e'); // Transition to error state
      }
    }
  }
}
