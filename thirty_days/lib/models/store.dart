import 'package:thirty_days/models/image.dart';
import 'package:thirty_days/models/product.dart';
import 'package:thirty_days/models/review.dart';

class Store {
  int? storeId;
  String storeName;
  String storeEmail;
  String storePhone;
  String owner;
  double rating;
  Image storeProfilePicture;
  Image storeBannerPicture;
  List<Product> products;
  List<Review> reviews;
  DateTime createdDate;

  Store({
    required this.storeId,
    required this.storeName,
    required this.storeEmail,
    required this.storePhone,
    required this.owner,
    required this.rating,
    required this.storeProfilePicture,
    required this.storeBannerPicture,
    required this.products,
    required this.reviews,
    required this.createdDate,
  });

  // Convert Store to JSON
  Map<String, dynamic> toJson() {
    return {
      'storeId': storeId,
      'storeName': storeName,
      'storeEmail': storeEmail,
      'storePhone': storePhone,
      'owner': owner,
      'rating': rating,
      'storeProfilePicture': storeProfilePicture.toJson(),
      'storeBannerPicture': storeBannerPicture.toJson(),
      'products': products.map((product) => product.toJson()).toList(),
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'createdDate': createdDate.toIso8601String(),
    };
  }

  // Convert JSON to Store
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      storeId: json['storeId'],
      storeName: json['storeName'],
      storeEmail: json['storeEmail'],
      storePhone: json['storePhone'],
      owner: json['owner'],
      rating: json['rating'],
      storeProfilePicture: Image.fromJson(json['storeProfilePicture']),
      storeBannerPicture: Image.fromJson(json['storeBannerPicture']),
      products: (json['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      reviews: (json['reviews'] as List)
          .map((review) => Review.fromJson(review))
          .toList(),
      createdDate: DateTime.parse(json['createdDate']),
    );
  }
}
