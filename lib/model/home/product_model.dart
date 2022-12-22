class ProductModel {
  final String id;
  final String name;
  // final String price;
  //final String discountPrice;
  //final String offer;
  //final String size;
  final List<String> image;
  final String category;
  // final String rating;

  ProductModel({
    required this.id,
    required this.name,
    // required this.price,
    // required this.discountPrice,
    //required this.offer,
    // required this.size,
    required this.image,
    required this.category,
    //required this.rating
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      // price: json['price'],
      // discountPrice: json['discountPrice'],
      // offer: json['offer'],
      // size: json['size'],
      image: List<String>.from(json["image"].map((x) => x)),
      category: json['category'],
      //rating: json['rating'],
    );
  }
}
