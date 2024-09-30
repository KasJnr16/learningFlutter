class Review {
  int? reviewId;
  String author;
  String title;
  String reviewMessage;
  double rating;

  Review({
    this.reviewId,
    required this.author,
    required this.title,
    required this.reviewMessage,
    required this.rating,
  });

  // Convert Review to JSON
  Map<String, dynamic> toJson() {
    return {
      'reviewId': reviewId,
      'author': author,
      'title': title,
      'reviewMessage': reviewMessage,
      'rating': rating,
    };
  }

  // Convert JSON to Review
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviewId: json['reviewId'],
      author: json['author'],
      title: json['title'],
      reviewMessage: json['reviewMessage'],
      rating: json['rating'].toDouble(),
    );
  }
}
