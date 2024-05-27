import 'package:flutter/material.dart';

import '../../model/payment/payment_result_model.dart';

class PaymentResultViewModel extends ChangeNotifier {
  final List<PaymentResult> _transactionList = [
    PaymentResult(
      status: 'success',
      transactionTime: '12:30',
      transactionDate: '2024-05-20',
      transactionNumber: 'TX123456789',
      providerRef: 'PR123456',
      transactionType: 'Online',
      paymentMethod: 'Credit Card',
      issuerType: 'Bank XYZ',
      totalItems: 3,
      subtotalProducts: 150.0,
      totalDiscount: 20.0,
      total: 130.0,
    ),
    // PaymentResult(
    //   status: 'failure',
    //   transactionTime: '14:45',
    //   transactionDate: '2024-05-21',
    //   transactionNumber: 'TX987654321',
    //   providerRef: 'PR654321',
    //   transactionType: 'Offline',
    //   paymentMethod: 'Cash',
    //   issuerType: 'Bank ABC',
    //   totalItems: 2,
    //   subtotalProducts: 80.0,
    //   totalDiscount: 10.0,
    //   total: 70.0,
    // ),
    // Add more dummy transactions as needed
  ];

  List<PaymentResult> get transactionList => _transactionList;

  void addTransaction(PaymentResult transaction) {
    _transactionList.add(transaction);
    notifyListeners();
  }
}
