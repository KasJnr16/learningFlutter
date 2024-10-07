import 'dart:convert';

import 'package:campusstore/models/store.dart';
import 'package:campusstore/widgets/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StoreService {
  static const String _endpoint = "/stores";

  String getFullUrl() {
    return "${Constants.hostUrl}$_endpoint";
  }

  Future<Store?> fetchStoreByUserId(
    BuildContext context,
    int userId,
  ) async {
    final String url = "${getFullUrl()}/owner/${userId}";
    final response = await _getRequest(url, context);

    return _handleResponse(context, response, onSuccess: (data) {
      _showSnackBar(context, "User updated successfully",
          color: Colors.green.shade700);
      return Store.fromJson(data);
    });
  }

  Future<Store?> createStore(
      BuildContext context, Store store, int userId) async {
    final String url = "${getFullUrl()}/owner/${userId}";
    final response = await _postRequest(url, store.toJson(), context);

    return _handleResponse(context, response, onSuccess: (data) {
      _showSnackBar(context, "Created store successful",
          color: Colors.green.shade700);
      return Store.fromJson(data);
    });
  }

//Request, post, get, put, delete
  Future<http.Response?> _postRequest(
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

  Future<http.Response?> _getRequest(String url, BuildContext context) async {
    try {
      final response = await http
          .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
      return response;
    } catch (e) {
      _handleException(context, e);
      return null;
    }
  }

//Handlers
  Future<T?> _handleResponse<T>(BuildContext context, http.Response? response,
      {required T Function(Map<String, dynamic>) onSuccess}) async {
    if (response == null) return null;

    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body) as Map<String, dynamic>;
        return onSuccess(data);
      case 400:
        _showSnackBar(context, "Bad Request");
        break;
      case 404:
        _showSnackBar(context, "Store not found.");
        break;
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
        _showSnackBar(context, "Server error. Please try again later.");
        break;
      default:
        _showSnackBar(context, "Unexpected error: ${response.statusCode}");
    }
    return null;
  }

  void _handleException(BuildContext context, dynamic e) {
    _showSnackBar(context, "Network error. Please check your connection.");
    print("Error: $e");
  }

  void _showSnackBar(BuildContext context, String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(fontSize: 18)),
        backgroundColor: color ?? Colors.red,
      ),
    );
  }
}
