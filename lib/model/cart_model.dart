import 'package:sippy/model/product_model.dart';

class CartItem {
  final Product product;
  final int quantity;
  final String addedBy;
  final String sessionId;

  CartItem({
    required this.product,
    required this.quantity,
    required this.addedBy,
    required this.sessionId,
  });

  double get totalPrice => product.amount * quantity;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
      addedBy: json['addedBy'],
      sessionId: json['sessionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
      'addedBy': addedBy,
      'sessionId': sessionId,
    };
  }

  @override
  String toString() {
    return 'CartItem(product: $product, quantity: $quantity, addedBy: $addedBy, sessionId: $sessionId)';
  }
}
