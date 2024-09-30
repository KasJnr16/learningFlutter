import 'package:flutter/material.dart';
import 'package:thirty_days/models/product.dart';

class ProductWidget extends StatefulWidget {
  final Product product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isHeartPressed = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      shadowColor: Colors.black38,
      child: Container(
        height: 400,
        width: 350,
        child: Stack(
          children: <Widget>[
            // Top section (image or background)
            Container(
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(color: Colors.grey.shade400, width: 2.0),
                image: DecorationImage(
                  image: widget.product.productImages != null &&
                          widget.product.productImages!.isNotEmpty
                      ? NetworkImage(widget.product.productImages![0].imageUrl!)
                      : AssetImage('assets/jeans.png'), // Default image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Bottom section (Product details)
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 160,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.2), // Adjust shadow color
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.storeName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.product.productName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "GHS ${widget.product.price.toStringAsFixed(2)}", // Product price
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add to cart or buy now action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Favorite button (Heart icon)
            Positioned(
              top: 10,
              right: 10,
              child: _buildHeartIcon(),
            ),
          ],
        ),
      ),
    );
  }

  // Heart icon widget
  Widget _buildHeartIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            isHeartPressed = !isHeartPressed;
          });
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300, // Barely visible outline
              width: 1.5,
            ),
          ),
          child: Icon(
            isHeartPressed ? Icons.favorite : Icons.favorite_outline,
            color: isHeartPressed
                ? Colors.red
                : Colors.black, // Toggle between red and black
            size: 28,
          ),
        ),
      ),
    );
  }
}
