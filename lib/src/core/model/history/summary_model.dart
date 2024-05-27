// file: src/core/model/summary_model.dart
class SummaryModel {
  final int id;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final int transactionCount;
  final double totalTax;
  final double totalAmount;
  final double totalCash;

  SummaryModel({
    required this.id,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.transactionCount,
    required this.totalTax,
    required this.totalAmount,
    required this.totalCash,
  });
}
