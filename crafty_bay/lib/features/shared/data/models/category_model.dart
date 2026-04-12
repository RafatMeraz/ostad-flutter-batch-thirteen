class CategoryModel {
  final String id;
  final String title;
  final String icon;

  CategoryModel({required this.id, required this.title, required this.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      title: json['title'],
      icon: json['icon'],
    );
  }
}
