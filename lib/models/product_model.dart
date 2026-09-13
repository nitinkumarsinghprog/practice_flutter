class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      description: json['description'],
      images: List<String>.from(json['images']),
      price: (json['price'] as num).toDouble(),
    );
  }
}
