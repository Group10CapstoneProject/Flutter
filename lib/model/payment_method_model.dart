class PaymentMethodModel{

  PaymentMethodModel({
    required this.id,
    this.picture,
    required this.name,
    this.paymentNumber,
    this.description,
  });

  final String id;
  final String? picture;
  final String name;
  final String? paymentNumber;
  final String? description;

  factory PaymentMethodModel.fromJSON({
    required Map<String, dynamic> json,
  }){
    return PaymentMethodModel(
      id: json['id'].toString(), 
      name: json['name'],
      paymentNumber: json['payment_number'],
      description: json['description'],
      picture: json['picture'],
    );
  }

}