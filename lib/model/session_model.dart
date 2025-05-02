import 'package:sippy/model/cart_model.dart';

class ShoppingSession {
  final String sessionId;
  final String createdBy;
  final List<String> invitedFriends;
  final List<CartItem> cartItems;

  ShoppingSession({
    required this.sessionId,
    required this.createdBy,
    required this.invitedFriends,
    required this.cartItems,
  });

  Map<String, dynamic> toJson() => {
        'sessionId': sessionId,
        'createdBy': createdBy,
        'invitedFriends': invitedFriends,
        'cartItems': cartItems.map((e) => e.toJson()).toList(),
      };

  factory ShoppingSession.fromJson(Map<String, dynamic> json) => ShoppingSession(
        sessionId: json['sessionId'],
        createdBy: json['createdBy'],
        invitedFriends: List<String>.from(json['invitedFriends']),
        cartItems: (json['cartItems'] as List)
            .map((e) => CartItem.fromJson(e))
            .toList(),
      );
}
