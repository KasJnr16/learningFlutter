import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thirty_days/models/product.dart';

class ProductService {
  static const String _baseUrl =
      "http://192.168.8.119:9000/campusstore/products";

  // Fetch products from API
  Future<List<Product>?> fetchProducts(BuildContext context) async {
    final String url = _baseUrl;
    final response = await _getRequest(url, context);

    if (response != null) {
      switch (response.statusCode) {
        case 200:
          List<dynamic> jsonResponse = json.decode(response.body);
          return jsonResponse
              .map((productJson) => Product.fromJson(productJson))
              .toList();
        case 404:
          _showSnackBar(context, "Products not found. Please try again later.");
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
