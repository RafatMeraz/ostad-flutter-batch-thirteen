class HomeSliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String? product;
  final String? brand;
  final String? category;

  HomeSliderModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.product,
    required this.brand,
    required this.category,
  });

  factory HomeSliderModel.fromJson(Map<String, dynamic> json) {
    return HomeSliderModel(
      id: json['_id'],
      photoUrl: json['photo_url'],
      description: json['description'],
      product: json['product'],
      brand: json['brand'],
      category: json['category'],
    );
  }
}
