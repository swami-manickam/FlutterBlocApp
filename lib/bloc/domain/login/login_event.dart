part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);
}

class LoginButtonPressed extends LoginEvent {}
