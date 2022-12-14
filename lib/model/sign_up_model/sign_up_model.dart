class SignupModel {
  final String fullname;
  final String email;
  final String phone;
  final String password;

  SignupModel(
      {required this.fullname,
      required this.email,
      required this.phone,
      required this.password});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
        fullname: json["fullname"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        password: json["password"] ?? '');
  }
  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "password": password,
    };
  }
}
