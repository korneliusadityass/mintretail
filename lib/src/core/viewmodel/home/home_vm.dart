import 'package:flutter/foundation.dart';

import '../../model/home/get_date/list_data.dart';

class HomeViewModel extends ChangeNotifier {
  List<Product> _cartItems = [];
  List<Product> _filteredItems = [];
  List<Cattegory> _categories = [];

  List<Product> get cartItems => _cartItems;
  List<Product> get filteredItems =>
      _filteredItems.isEmpty ? _cartItems : _filteredItems;
  List<Cattegory> get categories => _categories;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 0) {
      product.quantity--;
      notifyListeners();
    }
  }

  bool get isCartEmpty => _cartItems.isEmpty;

  Future<void> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    _cartItems = [
      Product(
          name: 'Nasi Goreng Hongkong',
          price: 2000,
          stock: 20,
          categoryId: '1'),
      Product(
          name: 'Nasi Goreng Jawa', price: 2000, stock: 20, categoryId: '1'),
      Product(
          name: 'Nasi Goreng Seafood',
          price: 20000,
          stock: 20,
          categoryId: '1'),
      Product(
          name: 'Mie Bangka Nusantara',
          price: 20000,
          stock: 20,
          categoryId: '2'),
      Product(
          name: 'Bakso Urat Spesial', price: 20000, stock: 20, categoryId: '3'),
      // Add more products with appropriate categoryIds
    ];

    notifyListeners();
  }

  Future<void> fetchCategories() async {
    _categories = [
      Cattegory(id: '1', name: 'Makanan'),
      Cattegory(id: '2', name: 'Minuman'),
      Cattegory(id: '3', name: 'Bakso'),
    ];
    notifyListeners();
  }

  void filterByCategory(String categoryId) {
    if (categoryId.isEmpty) {
      _filteredItems = [];
    } else {
      _filteredItems = _cartItems
          .where((product) => product.categoryId == categoryId)
          .toList();
    }
    notifyListeners();
  }
}
