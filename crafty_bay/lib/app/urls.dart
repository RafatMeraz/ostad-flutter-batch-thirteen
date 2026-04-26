class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String signInUrl = '$_baseUrl/auth/login';

  static const String homeSlidersUrl = '$_baseUrl/slides';
  static const String addToCartUrl = '$_baseUrl/cart';
  static const String cartListUrl = '$_baseUrl/cart';

  static String getCategoriesUrl(int pageSize, int pageNo) =>
      '$_baseUrl/categories?page=$pageNo&count=$pageSize';

  static String getProductsUrl(int pageSize, int pageNo) =>
      '$_baseUrl/products?page=$pageNo&count=$pageSize';

  static String getProductDetailsUrl(String productId) =>
      '$_baseUrl/products/id/$productId';
}