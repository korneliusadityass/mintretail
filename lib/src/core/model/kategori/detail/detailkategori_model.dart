class DetailProductKategori {
  final String id;
  String name;
  double price;
  int quantity;
  int stock;

  DetailProductKategori({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.stock,
  });

  // Factory method to create from JSON
  factory DetailProductKategori.fromJson(Map<String, dynamic> json) {
    return DetailProductKategori(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      stock: json['stock'],
    );
  }

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'stock': stock,
    };
  }
}
