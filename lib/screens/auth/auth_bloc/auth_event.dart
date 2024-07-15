part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final Map<String, dynamic> authData;
  const LoginEvent({required this.authData});
}

class RegisterEvent extends AuthEvent {
  final Map<String, dynamic> userData;
  const RegisterEvent({required this.userData});
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class InitializeAuthEvent extends AuthEvent {
  const InitializeAuthEvent();
  @override
  List<Object> get props => [];
}
