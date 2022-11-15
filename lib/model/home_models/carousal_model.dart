class CarousalModel {
  final String imagePath;
  final String offer;
  CarousalModel({
    required this.imagePath,
    required this.offer,
  });

  factory CarousalModel.fromJson(Map<String, dynamic> json) {
    return CarousalModel(
      imagePath: json['image'],
      offer: json['offer'],
    );
  }
}
