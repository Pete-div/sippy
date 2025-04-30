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
}
