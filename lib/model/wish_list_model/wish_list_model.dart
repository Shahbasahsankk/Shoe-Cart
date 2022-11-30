class WishListModel {
  WishListModel({
    required this.products,
  });

  List<ProductElement> products;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );
}

class ProductElement {
  ProductElement({
    required this.product,
  });

  ProductDetails product;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductDetails.fromJson(json["product"]),
      );
}

class ProductDetails {
  ProductDetails({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.offer,
    required this.rating,
    required this.size,
    required this.image,
    required this.category,
  });

  String id;
  String name;
  String price;
  String discountPrice;
  String offer;
  String rating;
  List<String> size;
  List<String> image;
  String category;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        offer: json["offer"],
        rating: json["rating"],
        size: List<String>.from(json["size"].map((x) => x)),
        image: List<String>.from(json["image"].map((x) => x)),
        category: json["category"],
      );
}
