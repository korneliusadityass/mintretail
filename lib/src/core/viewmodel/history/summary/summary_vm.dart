import 'package:coba1/src/core/model/history/summary_model.dart';
import 'package:flutter/material.dart';

class SummaryViewModel extends ChangeNotifier {
  List<SummaryModel> _summaries = [];

  List<SummaryModel> get summaries => _summaries;

  SummaryViewModel() {
    fetchSummaries();
  }

  void fetchSummaries() {
    _summaries = [
      SummaryModel(
        id: 1,
        description: "Retail",
        startDate: DateTime(2024, 1, 1),
        endDate: DateTime(2024, 1, 31),
        transactionCount: 120,
        totalTax: 200.0,
        totalAmount: 5000.0,
        totalCash: 3000.0,
      ),
      // SummaryModel(
      //   id: 2,
      //   description: "Wholesale",
      //   startDate: DateTime(2024, 2, 1),
      //   endDate: DateTime(2024, 2, 28),
      //   transactionCount: 150,
      //   totalTax: 300.0,
      //   totalAmount: 7000.0,
      //   totalCash: 4000.0,
      // ),
    ];
    notifyListeners();
  }
}
