import 'package:flutter/material.dart';

import '../../model/home/get_date/list_data.dart';

class CheckoutViewModel extends ChangeNotifier {
  List<Product> products = [];
  int subtotal = 0;
  int totalDiscount = 0;
  int totalPrice = 0;
  int totalItems = 0; // Tambahkan properti totalItems

  CheckoutViewModel({
    required this.subtotal,
    required this.totalDiscount,
    required this.totalPrice,
    required this.totalItems, // Tambahkan initial value jika diperlukan
  });

  void calculateTotals() {
    subtotal = products.fold<int>(
        0, (sum, product) => sum + (product.price * product.quantity).toInt());

    totalPrice = subtotal - totalDiscount;
    notifyListeners();
  }

  void addProduct(Product product) {
    products.add(product);
    calculateTotals();
  }

  void removeProduct(Product product) {
    products.remove(product);
    calculateTotals();
  }

  void setProducts(List<Product> selectedProducts) {
    products = selectedProducts;
    calculateTotals();
  }

  void increaseQuantity(Product product) {
    product.quantity++;
    calculateTotals();
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
      calculateTotals();
    }
  }
}
