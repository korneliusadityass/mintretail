class PaymentMethod {
  final String name;
  final PaymentType type;
  final String icon;

  PaymentMethod(this.name, this.type, this.icon);
}

enum PaymentType {
  cash,
  debitGateway,
  creditCard,
  qris,
}
