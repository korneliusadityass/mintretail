import 'package:coba1/src/core/model/history/history_model.dart';
import 'package:coba1/src/core/model/history/summary_model.dart';
import 'package:flutter/material.dart';

class HistoryViewModel extends ChangeNotifier {
  List<Transaction> _transactions = [];
  List<Transaction> _filteredTransactions = [];
  List<SummaryModel> _summaries = [];

  List<Transaction> get transactions => _filteredTransactions;
  List<SummaryModel> get summaries => _summaries;

  DateTime? _startDate;
  DateTime? _endDate;

  void loadTransactions() {
    _transactions = [
      Transaction(
        id: '1',
        date: '2024-01-01',
        time: '08:30',
        amount: 100.00,
        description: 'Payment for groceries',
        status: TransactionStatus.success,
        type: 'Groceries',
        providerRef: 'ABC123',
        paymentMethod: 'Credit Card',
        merchantName: 'Supermarket',
        productCode: 'GROC1001',
        productName: 'Groceries Pack',
        customerName: 'John Doe',
        sn: 'SN123456',
        customerId: 'CUST001',
        voucherAmount: 100.00,
        voucherFee: 5.00,
        discount: 5.00,
        total: 100.00,
      ),
      Transaction(
        id: '2',
        date: '2024-01-02',
        time: '10:00',
        amount: 50.00,
        description: 'Coffee at Starbucks',
        status: TransactionStatus.cancelled,
        type: 'Coffee',
        providerRef: 'XYZ456',
        paymentMethod: 'Debit Card',
        merchantName: 'Starbucks',
        productCode: 'COFF2002',
        productName: 'Latte',
        customerName: 'Jane Doe',
        sn: 'SN789012',
        customerId: 'CUST002',
        voucherAmount: 50.00,
        voucherFee: 2.00,
        discount: 0.00,
        total: 50.00,
      ),
      Transaction(
        id: '3',
        date: '2024-01-03',
        time: '12:45',
        amount: 200.00,
        description: 'Movie tickets',
        status: TransactionStatus.failed,
        type: 'Entertainment',
        providerRef: 'LMN789',
        paymentMethod: 'Cash',
        merchantName: 'Cinema',
        productCode: 'MOV3003',
        productName: 'Movie Ticket',
        customerName: 'Alice Doe',
        sn: 'SN345678',
        customerId: 'CUST003',
        voucherAmount: 200.00,
        voucherFee: 10.00,
        discount: 0.00,
        total: 200.00,
      ),
    ];

    _filteredTransactions = _transactions;
    notifyListeners();
  }

  void loadSummaries() {
    // Fetch summaries and notify listeners
    _summaries = [
      // Add dummy data or fetch from API
    ];
    notifyListeners();
  }

  void filterTransactions(DateTime? startDate, DateTime? endDate) {
    _startDate = startDate;
    _endDate = endDate;
    _filteredTransactions = _transactions.where((transaction) {
      DateTime transactionDate = DateTime.parse(transaction.date);
      if (_startDate != null && transactionDate.isBefore(_startDate!)) {
        return false;
      }
      if (_endDate != null && transactionDate.isAfter(_endDate!)) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }

  void fetchSummaries() {}
}
