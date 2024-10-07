import 'package:campusstore/controller/productController.dart';
import 'package:campusstore/models/product.dart';
import 'package:campusstore/widgets/productWidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class RecommendedWidget extends StatefulWidget {
  const RecommendedWidget({super.key});

  @override
  _RecommendedWidgetState createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  final ProductController _productController = ProductController();
  late Future<List<Product>?> futureProducts;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    futureProducts = _productController.fetchAllProducts(context);
    _startFetchingProducts(); // Start fetching on initialization
  }

  @override
  void dispose() {
    _stopFetchingProducts(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  void _startFetchingProducts() {
    _timer = Timer.periodic(Duration(seconds: 300), (timer) {
      setState(() {
        futureProducts = _productController.fetchAllProducts(context);
      });
    });
  }

  void _stopFetchingProducts() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Container(
      width: w,
      height: h * 0.400,
      child: Column(
        children: [
          _buildTitle(w),
          Expanded(
            child: FutureBuilder<List<Product>?>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return _buildLoadingIndicator();
                } else if (snapshot.hasError) {
                  return _buildErrorCard(snapshot.error);
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return _buildEmptyProductsCard();
                }

                // Displaying products
                final products = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductWidget(product: product),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the title
  Widget _buildTitle(double width) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 40,
      child: Text(
        "Recommended for You",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorCard(Object? error) {
    return _buildMessageCard(
      icon: Icons.warning,
      message: "Error: $error",
      description: "No products available.",
    );
  }

  // Empty products card widget
  Widget _buildEmptyProductsCard() {
    return _buildMessageCard(
      icon: Icons.warning,
      message: "No products available.",
      description: "Please check back later or explore other sections.",
    );
  }

  // Message card to show messages with an icon
  Widget _buildMessageCard(
      {required IconData icon,
      required String message,
      required String description}) {
    return Center(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.red, size: 50),
              SizedBox(height: 10),
              Text(
                message,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
