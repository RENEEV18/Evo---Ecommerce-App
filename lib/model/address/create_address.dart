class CreateAddressModel {
  final String title;
  final String fullName;
  final String phone;
  final String pin;
  final String state;
  final String place;
  final String address;
  final String landMark;

  CreateAddressModel({
    required this.title,
    required this.fullName,
    required this.phone,
    required this.pin,
    required this.state,
    required this.place,
    required this.address,
    required this.landMark,
  });

  // factory CreateAddressModel.fromJson(Map<String, dynamic> json) {
  //   return CreateAddressModel(
  //     title: json['title'],
  //     fullName: json['fullName'],
  //     phone: json['phone'],
  //     pin: json['pin'],
  //     state: json['state'],
  //     place: json['place'],
  //     address: json['address'],
  //     landMark: json['landMark'],
  //   );
  // }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "fullName": fullName,
      "phone": phone,
      "pin": pin,
      "state": state,
      "place": place,
      "address": address,
      "landMark": landMark,
    };
  }
}
