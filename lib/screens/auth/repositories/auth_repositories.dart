import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_commerce_project/entry_point.dart';
import 'package:e_commerce_project/notification_service.dart';
import 'package:e_commerce_project/screens/auth/auth_models/user_model.dart';
import 'package:e_commerce_project/screens/auth/views/views.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:e_commerce_project/shared/network/api.dart';
import 'package:e_commerce_project/utils.dart';

class AuthRepository {
  final api = locator.get<ApiIntercetor>();

  final bool useDirectus;

  AuthRepository({this.useDirectus = true});

  Options options = Options(
    headers: {
      'Accept': '*/*',
      "Content-Type": "application/json",
    },
  );

  // Send the User phoneNumber to Start OTP process
  Future<dynamic> loginUser(Map<String, dynamic> data) async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.post(
        '${locator<LocalStorageService>().apiBaseUrl}auth/login',
        data: {
          "email": data["email"],
          "password": data["password"],
        },
        options: options,
      );

      if (response.statusCode == 201) {
        // Set shoppyAuthData with the encoded token
        locator<LocalStorageService>().shoppyAuthData = response.data;
      }

      return response.statusCode;
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<dynamic> registerUser(Map<String, dynamic> user) async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.post(
        '${locator<LocalStorageService>().apiBaseUrl}auth/register',
        data: {
          "email": user["email"],
          "password": user["password"],
          "firstName": user["firstName"],
          "lastName": user["lastName"]
        },
        options: options,
      );

      if (response.statusCode == 201) {
        locator<NavigationService>()
            .pushNamedAndRemoveUntil(LoginScreen.routeName);
      } else {
        NotificationService.notify("${response.statusCode}");
      }

      return response.data;
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<dynamic> me(String? email) async {
    if (email != null) {
      try {
        Options options = Options(
          headers: {"Content-Type": "application/json"},
        );

        final response = await api.dio.get(
          "${locator<LocalStorageService>().apiBaseUrl}users/me?email=$email",
          options: options,
        );
        UserModel? user;
        if (response.statusCode == 201 || response.statusCode == 200) {
          user = UserModel.fromJson(jsonDecode(response.data));
        }
        logger.i(user);
        return user;
      } on DioException catch (e) {
        logger.e(e);
        throw Exception('Registration failed: ${e.message}');
      } catch (e) {
        logger.e(e);
        throw Exception('An unexpected error occurred: ${e.toString()}');
      }
    }
  }

  Future<dynamic> logout(String token) async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.post(
        '${locator<LocalStorageService>().apiBaseUrl}auth/logout',
        data: {"token": token},
        options: options,
      );
      if (response.statusCode == 201) {
        // Optionally, you can set user auth data here if needed
        locator<NavigationService>()
            .pushNamedAndRemoveUntil(LoginScreen.routeName);
      }

      return response.statusCode;
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }
}
