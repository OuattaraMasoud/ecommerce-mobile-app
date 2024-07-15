import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_project/common/commons.dart';
import 'package:e_commerce_project/entry_point.dart';
import 'package:e_commerce_project/global_app/global_app.dart';
import 'package:e_commerce_project/screens/auth/auth_models/user_model.dart';
import 'package:e_commerce_project/screens/auth/repositories/repositories.dart';
import 'package:e_commerce_project/services/locator.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = locator<AuthRepository>();
  AuthBloc()
      : super(
          const AuthState(),
        ) {
    on<LoginEvent>(_onLoginUser);
    on<RegisterEvent>(_onRegisterUser);
    // on<InitializeAuthEvent>(_initializeAuth);

    on<LogoutEvent>(_onlogout);
  }

  // Future<void> _initializeAuth(
  //     InitializeAuthEvent event, Emitter<AuthState> emit) async {
  //   var user = await authRepository.me(event.data);
  //   if (user != null) {
  //     emit(state.copyWith(user: () => user));
  //   } else {
  //     emit(state.copyWith(user: () => null));
  //   }
  // }

  Future<void> _onLoginUser(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      locator<GlobalAppCubit>().startLoading();
      var response = await authRepository.loginUser(event.authData);
      if (response == 201) {
        UserModel? userData = await authRepository.me(event.authData["email"]);
        if (userData != null) {
          emit(state.copyWith(user: () => userData));
          locator<NavigationService>()
              .pushNamedAndRemoveUntil(EntryPoint.routeName);
        }
      }
      logger.d(response);
      locator<GlobalAppCubit>().stopLoading();
    } catch (e) {
      logger.e(e);
      locator<GlobalAppCubit>().stopLoading();
    }
  }

  Future<void> _onRegisterUser(
      RegisterEvent event, Emitter<AuthState> emit) async {
    try {
      locator<GlobalAppCubit>().startLoading();
      var response = await authRepository.registerUser(event.userData);
      logger.d(response);
      locator<GlobalAppCubit>().stopLoading();
    } catch (e) {
      logger.e(e);
      locator<GlobalAppCubit>().stopLoading();
    }
  }

  Future<void> _onlogout(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      if (locator<LocalStorageService>().shoppyUserAuthData != null) {
        var authData = locator<LocalStorageService>().shoppyUserAuthData;
        Map<String, dynamic> decodedData = jsonDecode(authData!);
        var response = await authRepository.logout(decodedData["access_token"]);
        if (response == 201) {
          emit(state.copyWith(user: () => null));
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
