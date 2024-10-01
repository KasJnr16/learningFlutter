class Category {
  int? id;
  String categoryName;

  Category({
    this.id,
    required this.categoryName,
  });

  // Convert Category to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': categoryName,
    };
  }

  // Convert JSON to Category
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryName: json['categoryName'],
    );
  }
}
