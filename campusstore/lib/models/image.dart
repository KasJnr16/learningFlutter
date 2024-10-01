class Image {
  String? imageName;
  String? imageType;
  String? imagePath;
  String? imageUrl;

  Image({
    this.imageName,
    this.imageType,
    this.imagePath,
    this.imageUrl,
  });

  // Convert Image to JSON
  Map<String, dynamic> toJson() {
    return {
      'imageName': imageName,
      'imageType': imageType,
      'imagePath': imagePath,
      'imageUrl': imageUrl,
    };
  }

  // Convert JSON to Image
  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      imageName: json['imageName'],
      imageType: json['imageType'],
      imagePath: json['imagePath'],
      imageUrl: json['imageUrl'],
    );
  }
}
