import "package:campusstore/models/category.dart";
import "package:campusstore/models/enum/audience.dart";
import "package:campusstore/models/image.dart";
import "package:campusstore/models/review.dart";
import "package:campusstore/models/user.dart";

class Product {
  int? productId;
  String productName;
  String? description;
  double price;
  int quantity;
  Set<Category>? categories;
  String author;
  String storeName;
  List<Image>? productImages;
  Set<User>? likes;
  List<Review>? reviews;
  Audience audience;
  DateTime createdDate;

  Product({
    this.productId,
    required this.productName,
    this.description,
    required this.price,
    required this.quantity,
    this.categories,
    required this.author,
    required this.storeName,
    this.productImages,
    this.likes,
    this.reviews,
    required this.audience,
    required this.createdDate,
  });

  // Convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'description': description,
      'price': price,
      'quantity': quantity,
      'categories': categories?.map((category) => category.toJson()).toList(),
      'author': author,
      'storeName': storeName,
      'productImages': productImages?.map((image) => image.toJson()).toList(),
      'likes': likes?.map((user) => user.toJson()).toList(),
      'reviews': reviews?.map((review) => review.toJson()).toList(),
      'audience': audience.toString().split('.').last, // Enum to string
      'createdDate': createdDate.toIso8601String(),
    };
  }

  // Convert JSON to Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      productName: json['productName'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] is num)
          ? json['price'].toDouble()
          : 0.0, // Handle number and provide default
      quantity: json['quantity'],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((category) => Category.fromJson(category))
              .toSet() ??
          {}, // Default to empty set if null
      author: json['author'] ?? '',
      storeName: json['storeName'] ?? '',
      productImages: (json['productImages'] as List<dynamic>?)
              ?.map((image) => Image.fromJson(image))
              .toList() ??
          [], // Default to empty list if null
      likes: (json['likes'] as List<dynamic>?)
              ?.map((user) => User.fromJson(user))
              .toSet() ??
          {},
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((review) => Review.fromJson(review))
              .toList() ??
          [],
      audience: (json['audience'] != null)
          ? Audience.values.firstWhere(
              (e) => e.toString().split('.').last == json['audience'],
              orElse: () => Audience.DEFAULT)
          : Audience.DEFAULT, // Handle null case
      createdDate: DateTime.parse(json['createdDate']),
    );
  }
}
