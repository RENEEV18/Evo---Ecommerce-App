class ApiEndpoints {
  /* Authentication End-points */
  static String signUp = '/api/v1/auth/signup';
  static String signIn = '/api/v1/auth/login';
  static String sendOtp = '/api/v1/auth/otp';
  //static String verifyOtp = '/verify-otp';

  /* Forgot Password Endpoints */
  static String forgotPassword = '/verify-username-or-email';
  static String newPassword = '/new-password';
}
