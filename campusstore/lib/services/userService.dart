import 'dart:convert';

import 'package:campusstore/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String _baseUrl = "http://192.168.8.119:9000/campusstore/users";

  Future<User?> fetchUserByUserId(BuildContext context) async {
    final String url = _baseUrl;
    final response = await _getRequest(url, 1, context);
    if (response != null) {
      switch (response.statusCode) {
        case 200:
          dynamic jsonResponse = json.decode(response.body);
          return jsonResponse.map((userJson) => User.fromJson(userJson));
        case 404:
          _showSnackBar(context, "User not found. Please try again later.");
          break;
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
          _showSnackBar(context, "Server error. Please try again later.");
          break;
        default:
          print("Failed with status code: ${response.statusCode}");
          print("Response: ${response.body}");
          _showSnackBar(context, "Unexpected error occurred.");
      }
    }
    return null;
  }

  static Future<http.Response?> _getRequest(
      String url, int userId, BuildContext context) async {
    final String url = "$_baseUrl/$userId";
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } on Exception catch (e) {
      print("Exception: $e");
      _showSnackBar(context, "Network error. Please check your connection.");
      return null;
    } catch (e) {
      print("Error: $e");
      _showSnackBar(context, "An unexpected error occurred. Please try again.");
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
}
