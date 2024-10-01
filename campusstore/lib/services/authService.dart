import 'dart:convert';
import 'package:campusstore/models/user.dart';
import 'package:campusstore/widgets/utils/bottomNavigatorWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _baseUrl = "http://192.168.8.119:9000/campusstore/auth";

  static Future<bool> createAccount(User user, BuildContext context) async {
    final String url = "$_baseUrl/register/";
    final response = await _postRequest(url, user.toJson(), context);
    if (response != null && response.statusCode == 200) {
      var user = extractUserData(response);
      _navigateToFeed(context, user);
      return true;
    }
    return false;
  }

  static Future<bool> login(User user, BuildContext context) async {
    final String url = "$_baseUrl/authenticate/";
    final Map<String, dynamic> body = {
      'identifier': user.email,
      'password': user.password,
    };
    final response = await _postRequest(url, body, context);

    if (response != null) {
      switch (response.statusCode) {
        case 200:
          var user = extractUserData(response);
          _navigateToFeed(context, user);
          return true;
        case 404:
          _showSnackBar(
              context, "User not found. Please check your credentials.");
          break;
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
          _showSnackBar(context, "Please try again later");
          break;
        default:
          print("Failed with status code: ${response.statusCode}");
          print("Response: ${response.body}");
      }
    }
    return false;
  }

  static Future<http.Response?> _postRequest(
      String url, Map<String, dynamic> body, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      return response;
    } on Exception catch (e) {
      print("Exception: $e");
      _showSnackBar(context, "An error occurred. Please try again.");
      return null;
    } catch (e) {
      print("Error: $e");
      _showSnackBar(context, "An error occurred. Please try again.");
      return null;
    }
  }

  static void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void _navigateToFeed(BuildContext context, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyBottomNavigationBar(user: user)),
    );
  }
}

User extractUserData(http.Response response) {
  final Map<String, dynamic> jsonResponse = json.decode(response.body);
  // Extract and return a User object using the fromJson constructor
  return User.fromJson(jsonResponse);
}
