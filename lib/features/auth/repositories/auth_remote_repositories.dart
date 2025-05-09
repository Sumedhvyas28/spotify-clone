import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRemoteRepositories {
  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
          Uri.parse(
            'http://10.0.2.2:8000/auth/signup',
          ),
          headers: {
            'Content-type': 'application/json',
          },
          body: jsonEncode({
            'name': name,
            'email': email,
            'password': password,
          }));

      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          'http://10.0.2.2:8000/auth/login',
        ),
        headers: {
          'Content-type': 'application/json',
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
