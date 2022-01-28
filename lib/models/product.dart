class Product {
  final String id;
  final String name;
  final String description;
  final String createDate;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.createDate,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json["name"],
        description = json['description'],
        createDate = json["createDate"];
}
