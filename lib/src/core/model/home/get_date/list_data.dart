class Product {
  final String name;
  final double price;
  final int stock;
  final String categoryId;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.stock,
    required this.categoryId,
    this.quantity = 0,
  });
}

class Cattegory {
  final String id;
  final String name;

  Cattegory({required this.id, required this.name});
}
