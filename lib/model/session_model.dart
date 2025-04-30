import 'package:sippy/model/cart_model.dart';

class ShoppingSession {
  final String sessionId;
  final String createdBy; // userID or name
  final List<String> invitedFriends; // userIDs or names
  final List<CartItem> cartItems;

  ShoppingSession({
    required this.sessionId,
    required this.createdBy,
    required this.invitedFriends,
    required this.cartItems,
  });
}
