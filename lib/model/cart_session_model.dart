import 'package:sippy/model/cart_model.dart';

class SessionData {
  final String sessionId;
  final String ownerName;
  String? friendName;
  List<CartItem> cartItems;

  SessionData({
    required this.sessionId,
    required this.ownerName,
    this.friendName,
    this.cartItems = const [],
  });
}
