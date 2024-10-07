import 'dart:convert';
import 'package:campusstore/models/product.dart';
import 'package:campusstore/widgets/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String _endpoint = "/products";


  String getFullUrl() {
    return "${Constants.hostUrl}$_endpoint";
  }

  // Fetch products from API
  Future<List<Product>?> fetchProducts(BuildContext context) async {
    final String url = getFullUrl();
    final response = await _getRequest(url, context);

    if (response != null) {
      switch (response.statusCode) {
        case 200:
          List<dynamic> jsonResponse = json.decode(response.body);
          return jsonResponse
              .map((productJson) => Product.fromJson(productJson))
              .toList();
        default:
          _showSnackBar(context, "Unexpected error fetching product.");
      }
    }
    return null;
  }

  // Helper method for making GET requests with error handling
  static Future<http.Response?> _getRequest(
      String url, BuildContext context) async {
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

  // Method to display SnackBar messages
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
