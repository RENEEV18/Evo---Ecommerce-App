class ApiEndpoints {
  /* Authentication End-points */
  static String signUp = '/api/v1/auth/signup';
  static String signIn = '/api/v1/auth/login';
  static String sendOtp = '/api/v1/auth/otp';
  static String forgotpassword = '/api/v1/auth/password';
  static String refreshToken = '/api/v1/auth/refresh';

  /*Home page End-points*/
  static String category = '/api/v1/category';
  static String carousal = '/api/v1/carousal';
  static String product = '/api/v1/products';

  /* Product Page End-points */
  static String cart = '/api/v1/cart';
  static String wishlist = '/api/v1/wishlist';

  /*Address Page End-point*/
  static String address = '/api/v1/address';

  /*Order Page End-point*/
  static String orders = '/api/v1/orders';
}
