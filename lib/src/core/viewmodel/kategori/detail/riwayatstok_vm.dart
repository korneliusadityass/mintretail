// stock_history_viewmodel.dart
import 'package:coba1/src/core/model/kategori/detail/riwayatstok_model.dart';
import 'package:flutter/material.dart';
import 'package:coba1/assets/color/app_colors.dart';

class StockHistoryViewModel extends ChangeNotifier {
  final List<StockHistory> _stockHistory = [
    StockHistory(
      date: '01-01-2024',
      adjustment: '+50',
      note: 'Initial stock',
      nominal: 'Rp. 50000',
      transactionNote: 'Stock addition',
    ),
    StockHistory(
      date: '02-01-2024',
      adjustment: '-2',
      note: 'Sold 2 units',
      nominal: 'Rp. 2000',
      transactionNote: 'Product sold',
    ),
    // Add more dummy data as needed
  ];

  List<StockHistory> get stockHistory => _stockHistory;

  // Add any additional methods to manipulate stock history data
}
