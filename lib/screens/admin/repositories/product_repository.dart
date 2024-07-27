import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_commerce_project/global_app/cubit/global_app_cubit.dart';
import 'package:e_commerce_project/notification_service.dart';
import 'package:e_commerce_project/screens/auth/auth_models/user_model.dart';
import 'package:e_commerce_project/screens/auth/views/views.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:e_commerce_project/shared/network/api.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';

class ProductRepository {
  final api = locator.get<ApiIntercetor>();
  late Dio _dioClient;
  ProductRepository();

  Options options = Options(
    headers: {
      'Accept': '*/*',
      "Content-Type": "application/json",
    },
  );
  void initializeDioClient() {
    _dioClient = Dio(
      BaseOptions(
        baseUrl: locator<LocalStorageService>().apiBaseUrl,
        responseType: ResponseType.plain,
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        contentType: 'application/json',
      ),
    );

    _dioClient.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        String? token =
            jsonDecode(locator<LocalStorageService>().shoppyUserAuthData ?? "")[
                'access_token'];
        request.headers['Authorization'] = "Bearer $token";
        return handler.next(request);
      },
    ));
  }

  // Send the User phoneNumber to Start OTP process
  Future<dynamic> createProduct(Map<String, dynamic> data) async {
    try {
      initializeDioClient();
      final response = await _dioClient.post(
        '${locator<LocalStorageService>().apiBaseUrl}products/create-product',
        data: {
          "name": data["name"],
          "categoryId": data["categoryId"],
          "subCategoryId": data["subCategoryId"],
          "brand": data["brand"],
          "description": data["description"],
          "price": data["price"].toDouble(),
          "imagesUrl": [data["imagesUrl"]],
        },
      );

      if (response.statusCode == 201) {
        NotificationService.notify("${response.data}",
            textStyle: TextStyle(color: Colors.green));
        locator<NavigationService>().pop();
      }

      return response.statusCode;
    } on DioException catch (e) {
      logger.e(e);
      NotificationService.notify("${jsonDecode(e.response?.data)['message']}",
          textStyle: TextStyle(color: Colors.red));

      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    } finally {
      locator<GlobalAppCubit>().stopLoading();
    }
  }

  Future<dynamic> createPurchase(Map<String, dynamic> data) async {
    try {
      initializeDioClient();
      final response = await _dioClient.post(
        '${locator<LocalStorageService>().apiBaseUrl}purchases/create-purchase',
        data: {
          "userId": data["userId"],
          "totalPrice": data["totalPrice"].toDouble(),
          "productIds": data["products"]
        },
      );

      if (response.statusCode == 201) {
        NotificationService.notify("${response.data}",
            textStyle: TextStyle(color: Colors.green));
        locator<NavigationService>().pop();
      }

      return response.statusCode;
    } on DioException catch (e) {
      logger.e(e);
      NotificationService.notify("${jsonDecode(e.response?.data)['message']}",
          textStyle: TextStyle(color: Colors.red));

      throw Exception('Create failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    } finally {
      locator<GlobalAppCubit>().stopLoading();
    }
  }

  Future<dynamic> createCategory(Map<String, dynamic> data) async {
    try {
      initializeDioClient();
      final response = await _dioClient.post(
        '${locator<LocalStorageService>().apiBaseUrl}categories/create-category',
        data: {
          "name": data["name"],
        },
      );

      if (response.statusCode == 201) {
        NotificationService.notify("${response.data}",
            textStyle: TextStyle(color: Colors.green));
        locator<NavigationService>().pop();
      }

      return response.statusCode;
    } on DioException catch (e) {
      logger.e(e);
      NotificationService.notify("${jsonDecode(e.response?.data)['message']}",
          textStyle: TextStyle(color: Colors.red));

      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    } finally {
      locator<GlobalAppCubit>().stopLoading();
    }
  }

  Future<dynamic> createSubCategory(Map<String, dynamic> data) async {
    try {
      initializeDioClient();
      final response = await _dioClient.post(
        '${locator<LocalStorageService>().apiBaseUrl}subCategories/create-subcategory',
        data: {
          "name": data["name"],
        },
      );

      if (response.statusCode == 201) {
        NotificationService.notify("${response.data}",
            textStyle: TextStyle(color: Colors.green));
        locator<NavigationService>().pop();
      }

      return response.statusCode;
    } on DioException catch (e) {
      logger.e(e);
      NotificationService.notify("${jsonDecode(e.response?.data)['message']}",
          textStyle: TextStyle(color: Colors.red));

      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    } finally {
      locator<GlobalAppCubit>().stopLoading();
    }
  }

  Future<dynamic> getAllCategories() async {
    try {
      initializeDioClient();
      final response = await _dioClient.get(
        '${locator<LocalStorageService>().apiBaseUrl}categories/find-all-categories',
      );

      if (response.statusCode == 201) {
        NotificationService.notify("${response.data}",
            textStyle: TextStyle(color: Colors.green));
        locator<NavigationService>().pop();
      }

      return jsonDecode(response.data)["rdfCategories"];
    } on DioException catch (e) {
      logger.e(e);
      NotificationService.notify("${jsonDecode(e.response?.data)['message']}",
          textStyle: TextStyle(color: Colors.red));

      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    } finally {
      locator<GlobalAppCubit>().stopLoading();
    }
  }

  Future<dynamic> getAllSubCategories() async {
    try {
      initializeDioClient();
      final response = await _dioClient.get(
        '${locator<LocalStorageService>().apiBaseUrl}subCategories/find-all-subcategories',
      );

      if (response.statusCode == 201) {
        NotificationService.notify("${response.data}",
            textStyle: TextStyle(color: Colors.green));
        locator<NavigationService>().pop();
      }

      return jsonDecode(response.data)["rdfSubCategories"];
    } on DioException catch (e) {
      logger.e(e);
      NotificationService.notify("${jsonDecode(e.response?.data)['message']}",
          textStyle: TextStyle(color: Colors.red));

      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    } finally {
      locator<GlobalAppCubit>().stopLoading();
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

  Future<dynamic> getAllAvaillableProducts() async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.get(
        '${locator<LocalStorageService>().apiBaseUrl}products/find-all-products',
        options: options,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.data)[
            "rdfProducts"]; // Optionally, you can set user auth data here if needed
      }
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<dynamic> getRecentProducts() async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.get(
        '${locator<LocalStorageService>().apiBaseUrl}products/find-recent-products',
        options: options,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.data)[
            "rdfProducts"]; // Optionally, you can set user auth data here if needed
      }
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<dynamic> getRecommandedProducts(String userId) async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.get(
        '${locator<LocalStorageService>().apiBaseUrl}products/find-recommanded-products',
        queryParameters: {"userId": userId},
        options: options,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response
            .data); // Optionally, you can set user auth data here if needed
      }
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<dynamic> getAllProductsByCriteria(
      String categoryId, String subCategoryId) async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.get(
        '${locator<LocalStorageService>().apiBaseUrl}products/find-products-by-criteria',
        options: options,
        queryParameters: {
          "categoryId": categoryId,
          "subCategoryId": subCategoryId
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.data)[
            "rdfProducts"]; // Optionally, you can set user auth data here if needed
      }
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<dynamic> getAllProductsByCategory(String categoryId) async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.get(
        '${locator<LocalStorageService>().apiBaseUrl}products/find-products-by-category',
        options: options,
        queryParameters: {
          "categoryId": categoryId,
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.data)[
            "rdfProducts"]; // Optionally, you can set user auth data here if needed
      }
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<dynamic> searchProductsByCategory(String input) async {
    try {
      Options options = Options(
        headers: {"Content-Type": "application/json"},
      );

      final response = await api.dio.get(
        '${locator<LocalStorageService>().apiBaseUrl}products/user-find-products-by-criteria',
        options: options,
        queryParameters: {
          "input": input,
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.data)[
            "rdfProducts"]; // Optionally, you can set user auth data here if needed
      }
    } on DioException catch (e) {
      logger.e(e);
      throw Exception('Fetch failed: ${e.message}');
    } catch (e) {
      logger.e(e);
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }
}
