// ignore_for_file: avoid_print

/* import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationProvider {
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    final response = await http.post(
        Uri.parse('https://dev.mahimamultipurpose.com.np/oauth/token'),
        body: {
          'grant_type': 'password',
          'client_id': '3',
          'client_secret': '41NGPCnLDz9B3pjSWQ4h5tjotFKP2fJ9YxRgYp1n',
          'username': username,
          'password': password,
          'scope': '*',
        });
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to login');
    }
  }
} */

import 'dart:convert';
import 'package:accounting_pos_project/theme/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  // base url
  final requestBaseUrl = AppUrl.baseUrl;

  // setter
  late String _accessToken;

  // getter
  String get accessToken => _accessToken;

  Future<void> login(String username, String password) async {
    String url = "$requestBaseUrl/oauth/token";
    final response = await http.post(
      Uri.parse(url),
      body: {
        'grant_type': 'password',
        'client_id': '3',
        'client_secret': '41NGPCnLDz9B3pjSWQ4h5tjotFKP2fJ9YxRgYp1n',
        'username': username,
        'password': password,
        'scope': '*',
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      _accessToken = responseData['access_token'];

      // storing access token securely
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', _accessToken);

      print(responseData);

      notifyListeners();
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('accessToken') ?? '';
    return _accessToken.isNotEmpty;
  }

  Future<void> logout() async {
    // Clear the access token
    _accessToken = '';
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    notifyListeners();
  }
}
