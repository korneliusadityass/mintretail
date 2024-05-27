import 'package:flutter/foundation.dart';
import 'package:coba1/src/core/model/kategori/detail/detailkategori_model.dart';

class ProductViewModel extends ChangeNotifier {
  List<DetailProductKategori> _products = [
    DetailProductKategori(
      id: '1',
      name: 'Product 1',
      price: 10000.0,
      quantity: 10,
      stock: 50,
    ),
    DetailProductKategori(
      id: '2',
      name: 'Product 2',
      price: 20000.0,
      quantity: 20,
      stock: 30,
    ),
  ];

  List<DetailProductKategori> get products => _products;

  void addProduct(DetailProductKategori product) {
    _products.add(product);
    notifyListeners();
  }

  void deleteProduct(String id) {
    _products.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  void updateProduct(String id, DetailProductKategori updatedProduct) {
    final index = _products.indexWhere((product) => product.id == id);
    if (index != -1) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }
}
