class AddToCartParams {
  final String productId;
  final String? color;
  final String? size;
  final int quantity;

  AddToCartParams({
    required this.productId,
    required this.color,
    required this.size,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {
      "product": productId,
      "quantity": quantity,
    };
    if (color != null) {
      params["color"] = color;
    }
    if (size != null) {
      params["size"] = size;
    }
    return params;
  }
}
