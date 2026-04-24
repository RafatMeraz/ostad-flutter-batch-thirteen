class ProductDetailsModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final int currentPrice;
  final int quantity;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.photos,
    required this.colors,
    required this.sizes,
    required this.currentPrice,
    required this.quantity,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      photos: List.from(json['photos']),
      colors: List.from(json['colors']),
      sizes: List.from(json['sizes']),
      currentPrice: json['current_price'],
      quantity: json['quantity'],
    );
  }
}
