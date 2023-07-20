class CustomCar{
  late String name;
  String? image;
  late String desc;
  String? currency;
  late double price;
  CustomCar({required this.name, this.image, required this.price, required this.desc, this.currency});

  factory CustomCar.fromJson(Map<String, dynamic> json) {
    return CustomCar(
      name: json['name'],
      currency: json['currency'],
      desc: json['description'],
      price: json['price'],
    );
  }

}