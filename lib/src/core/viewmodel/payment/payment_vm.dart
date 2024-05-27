import 'package:coba1/src/core/model/payment/payment_model.dart';
import 'package:flutter/material.dart';

class PaymentViewModel extends ChangeNotifier {
  List<PaymentMethod> paymentMethods = [
    PaymentMethod('Tunai', PaymentType.cash, 'asset/image/cash.png'),
    PaymentMethod('Debit Gateway', PaymentType.debitGateway,
        'asset/image/credit_card.png'),
    PaymentMethod(
        'Credit Card', PaymentType.creditCard, 'asset/image/credit_card.png'),
    PaymentMethod('QRIS', PaymentType.qris, 'asset/image/quill_creditcard.png'),
  ];

  PaymentType? _selectedPaymentMethod;
  double _totalAmount = 0.0;

  PaymentType? get selectedPaymentMethod => _selectedPaymentMethod;
  double get totalAmount => _totalAmount;

  void selectPaymentMethod(PaymentType? method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }

  void setTotalAmount(double amount) {
    _totalAmount = amount;
    notifyListeners();
  }
}
