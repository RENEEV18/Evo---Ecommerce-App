class ProductModel {
  String? id;
  String? name;
  int? price;
  dynamic discountPrice;
  int? offer;
  List<String>? size;
  List<String>? image;
  String? category;
  String? rating;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.discountPrice,
      this.offer,
      this.size,
      this.image,
      this.category,
      this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      offer: json['offer'],
      size: List<String>.from(json["size"].map((e) => e)),
      image: List<String>.from(json["image"].map((e) => e)),
      category: json['category'],
      rating: json['rating'],
    );
  }
}
