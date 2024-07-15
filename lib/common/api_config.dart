class ApiConfig {
  ApiConfig();

  static const token = "";
  String baseUrl = "";

  static const String users = '/users';

  static const header = {
    'Authorization': ' $token',
    'content-Type': 'application/json',
  };
}
