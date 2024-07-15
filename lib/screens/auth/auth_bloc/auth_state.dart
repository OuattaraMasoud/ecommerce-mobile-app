part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final UserModel? user;

  const AuthState({
    this.user,
  });

  AuthState copyWith({
    UserModel? Function()? user,
  }) {
    return AuthState(
      user: user != null ? user() : this.user,
    );
  }

  @override
  List<Object?> get props => [
        user,
      ];
}
