class PaymentMethodModel{

  PaymentMethodModel({
    required this.id,
    required this.iconLink,
    required this.name,
    this.paymentNumber
  });

  final int id;
  final String iconLink;
  final String name;
  final String? paymentNumber;

}