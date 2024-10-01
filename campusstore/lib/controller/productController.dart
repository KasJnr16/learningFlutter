import 'package:campusstore/models/product.dart';
import 'package:campusstore/services/productService.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ProductController {
  final ProductService _productService = ProductService();

  // This method fetches all products
  Future<List<Product>?> fetchAllProducts(BuildContext context) async {
    final products = await _productService.fetchProducts(context);

    if (products != null) {
      products.sort((a, b) => b.createdDate.compareTo(a.createdDate));
      return products.take(20).toList();
    }
    return null;
  }
}
