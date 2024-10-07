import 'dart:convert';
import 'package:campusstore/models/user.dart';
import 'package:campusstore/widgets/utils/bottomNavigatorWidget.dart';
import 'package:campusstore/widgets/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _endpoint = "/auth";

  static String getFullUrl() {
    return "${Constants.hostUrl}$_endpoint";
  }

  // Register a new account
  static Future<bool> createAccount(User user, BuildContext context) async {
    final String url = "${getFullUrl()}/register/";
    final response = await _postRequest(url, user.toJson(), context);

    return _handleAuthResponse(response, context, onSuccess: (data) {
      var user = User.fromJson(data);
      _navigateToFeed(context, user);
      _showSnackBar(context, "Registration successful",
          color: Colors.green.shade700);
      return true;
    });
  }

  // Login user
  static Future<bool> login(User user, BuildContext context) async {
    final String url = "${getFullUrl()}/authenticate/";
    final Map<String, dynamic> body = {
      'identifier': user.email,
      'password': user.password,
    };
    final response = await _postRequest(url, body, context);

    return _handleAuthResponse(response, context, onSuccess: (data) {
      var user = User.fromJson(data);
      _navigateToFeed(context, user);
      _showSnackBar(context, "Login successful", color: Colors.green.shade700);
      return true;
    });
  }

  // POST request handler
  static Future<http.Response?> _postRequest(
      String url, Map<String, dynamic> body, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      _handleException(context, e);
      return null;
    }
  }

  // Handle authentication response
  static Future<bool> _handleAuthResponse(
      http.Response? response, BuildContext context,
      {required bool Function(Map<String, dynamic>) onSuccess}) async {
    if (response == null) return false;

    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body) as Map<String, dynamic>;
        return onSuccess(data);
      case 403:
        _showSnackBar(context, "Invalid credentials.");
        break;
      case 404:
        _showSnackBar(
            context, "User not found. Please check your credentials.");
        break;
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
        _showSnackBar(context, "Server error. Please try again later.");
        break;
      default:
        print("Unexpected status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        _showSnackBar(context, "Unexpected error occurred.");
    }
    return false;
  }

  // Exception handler
  static void _handleException(BuildContext context, dynamic e) {
    print("Error: $e");
    _showSnackBar(context, "Network error. Please check your connection.");
  }

  // Snackbar for feedback
  static void _showSnackBar(BuildContext context, String message,
      {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(fontSize: 18)),
        backgroundColor: color ?? Colors.red,
      ),
    );
  }

  // Navigate to main feed after login/register
  static void _navigateToFeed(BuildContext context, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyBottomNavigationBar(user: user),
      ),
    );
  }
}
