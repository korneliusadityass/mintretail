class PaymentResult {
  final String status; // "success" atau "failure"
  final String transactionTime;
  final String transactionDate;
  final String transactionNumber;
  final String providerRef;
  final String transactionType;
  final String paymentMethod;
  final String issuerType;
  final int totalItems;
  final double subtotalProducts;
  final double totalDiscount;
  final double total;

  PaymentResult({
    required this.status,
    required this.transactionTime,
    required this.transactionDate,
    required this.transactionNumber,
    required this.providerRef,
    required this.transactionType,
    required this.paymentMethod,
    required this.issuerType,
    required this.totalItems,
    required this.subtotalProducts,
    required this.totalDiscount,
    required this.total,
  });
}
