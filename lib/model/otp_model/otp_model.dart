class SendOtpModel {
  final String email;

  SendOtpModel({
    required this.email,
  });

  factory SendOtpModel.fromJson(Map<String, dynamic> json) {
    return SendOtpModel(
      email: json["email"] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}
