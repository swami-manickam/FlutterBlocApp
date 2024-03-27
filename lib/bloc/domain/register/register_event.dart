part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class UserNameChanged extends RegisterEvent {
  final String userName;

  UserNameChanged(this.userName);
}

class EmailIdChanged extends RegisterEvent {
  final String emailId;

  EmailIdChanged(this.emailId);
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  RegisterPasswordChanged(this.password);
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;
  ConfirmPasswordChanged(this.confirmPassword);
}

class RegisterButtonPressed extends RegisterEvent {}
