class PaymentMethodModel{

  PaymentMethodModel({
    required this.id,
    this.iconLink,
    required this.name,
    this.paymentNumber,
    this.description,
  });

  final String id;
  final String? iconLink;
  final String name;
  final String? paymentNumber;
  final String? description;

  factory PaymentMethodModel.fromJSON(Map<String, dynamic> json){
    return PaymentMethodModel(
      id: json['id'].toString(), 
      name: json['name'],
      paymentNumber: json['payment_number'],
      description: json['description'],
    );
  }

}