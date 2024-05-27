import 'package:coba1/src/core/model/history/summary/ringkasan_model.dart';
import 'package:flutter/material.dart';

class BestSellingProductsViewModel extends ChangeNotifier {
  List<RingkasanProduct> _products = [];

  List<RingkasanProduct> get products => _products;

  void fetchBestSellingProducts() {
    // Simulated asynchronous fetch
    _products = [
      RingkasanProduct(name: 'Produk A', totalPrice: 1200.0, totalItems: 120),
      RingkasanProduct(name: 'Produk B', totalPrice: 950.0, totalItems: 95),
      RingkasanProduct(name: 'Produk C', totalPrice: 800.0, totalItems: 80),
      RingkasanProduct(name: 'Produk D', totalPrice: 900.0, totalItems: 50),
    ];
    notifyListeners();
  }

  double get grandTotalPrice {
    return _products.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  int get totalItems {
    return _products.fold(0, (sum, item) => sum + item.totalItems);
  }
}
