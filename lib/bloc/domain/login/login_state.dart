part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

// Define the initial state
class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError({required this.errorMessage});
}
