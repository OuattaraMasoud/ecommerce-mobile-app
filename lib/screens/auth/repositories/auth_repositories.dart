import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_commerce_project/screens/auth/auth_models/user_models.dart';
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

      // Set shoppyAuthData with the encoded token
      locator<LocalStorageService>().shoppyAuthData = jsonEncode(response.data);

      return response.data;
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
        '${locator<LocalStorageService>().apiBaseUrl}/auth/register',
        data: {
          "email": user["email"],
          "password": user["password"],
          "firstName": user["firstName"],
          "lastName": user["lastName"]
        },
        options: options,
      );

      // Optionally, you can set user auth data here if needed
      locator<LocalStorageService>().shoppyAuthData = jsonEncode(response.data);

      return response.data;
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<dynamic> me(Map<String, dynamic> data) async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.post(
        '${locator<LocalStorageService>().apiBaseUrl}/users/me',
        data: {
          "email": data["email"],
          "password": data["password"],
          "firstName": data["firstName"],
          "lastName": data["lastName"]
        },
        options: options,
      );

      // Optionally, you can set user auth data here if needed
      locator<LocalStorageService>().shoppyAuthData = jsonEncode(response.data);

      return response.data;
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<dynamic> logout(String token) async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.post(
        '${locator<LocalStorageService>().apiBaseUrl}/auth/logout',
        data: {"token": token},
        options: options,
      );

      // Optionally, you can set user auth data here if needed
      locator<LocalStorageService>().shoppyAuthData = jsonEncode(response.data);

      return response.data;
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }
}
