class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.offer,
    this.size,
    this.image,
    this.category,
    this.rating,
  });

  String? id;
  String? name;
  String? price;
  String? discountPrice;
  String? offer;
  String? rating;
  List<String>? size;
  List<String>? image;
  String? category;

  factory Product.fromJson(Map<String?, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        offer: json["offer"],
        size: List<String>.from(json["size"].map((x) => x)),
        image: List<String>.from(json["image"].map((x) => x)),
        category: json["category"],
        rating: json['rating'],
      );
}
