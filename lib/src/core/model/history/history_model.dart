enum TransactionStatus {
  success,
  failed,
  cancelled,
}

class Transaction {
  final String id;
  final String date;
  final String time;
  final double amount;
  final String description;
  final TransactionStatus status;
  final String type;
  final String providerRef;
  final String paymentMethod;
  final String merchantName;
  final String productCode;
  final String productName;
  final String customerName;
  final String sn;
  final String customerId;
  final double voucherAmount;
  final double voucherFee;
  final double discount;
  final double total;

  Transaction({
    required this.id,
    required this.date,
    required this.time,
    required this.amount,
    required this.description,
    required this.status,
    required this.type,
    required this.providerRef,
    required this.paymentMethod,
    required this.merchantName,
    required this.productCode,
    required this.productName,
    required this.customerName,
    required this.sn,
    required this.customerId,
    required this.voucherAmount,
    required this.voucherFee,
    required this.discount,
    required this.total,
  });
}
