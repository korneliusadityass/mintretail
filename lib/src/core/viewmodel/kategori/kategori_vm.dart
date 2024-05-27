import 'package:coba1/src/core/model/kategori/kategori_model.dart';
import 'package:flutter/foundation.dart';

class CategoryViewModel extends ChangeNotifier {
  List<CategoryProduk> _categories = [];
  List<CategoryProduk> _displayedCategories = [];
  bool _isSelecting = false;

  List<CategoryProduk> get categories => _categories;
  List<CategoryProduk> get displayedCategories => _displayedCategories;
  bool get isSelecting => _isSelecting;

  void fetchCategories() {
    _categories = [
      CategoryProduk(id: '1', name: 'CategoryProduk 1'),
      CategoryProduk(id: '2', name: 'CategoryProduk 2'),
    ];
    _displayedCategories = List.from(
        _categories); 
    notifyListeners();
  }

  void toggleSelecting() {
    _isSelecting = !_isSelecting;
    notifyListeners();
  }

  void updateCategoryName(String id, String newName) {
    final index = _categories.indexWhere((category) => category.id == id);
    if (index != -1) {
      _categories[index] = CategoryProduk(id: id, name: newName);
      _updateDisplayedCategories();
      notifyListeners();
    }
  }

  void deleteCategory(String id) {
    _categories.removeWhere((category) => category.id == id);
    _updateDisplayedCategories();
    notifyListeners();
  }

  void addCategory(String name) {
    final newCategory = CategoryProduk(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
    );
    _categories.add(newCategory);
    _updateDisplayedCategories();
    notifyListeners();
  }

  void searchCategories(String keyword) {
    if (keyword.isEmpty) {
      _displayedCategories = List.from(_categories);
    } else {
      _displayedCategories = _categories
          .where((category) =>
              category.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void _updateDisplayedCategories() {
    if (_isSelecting) {
      _displayedCategories = _categories;
    } else {
      _displayedCategories = List.from(_categories);
    }
  }
}
