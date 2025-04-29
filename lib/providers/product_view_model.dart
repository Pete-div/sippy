import 'package:sippy/model/cart_model.dart';
import 'package:sippy/model/cart_session_model.dart';
import 'package:stacked/stacked.dart';

class ProductProcider extends  BaseViewModel {
  SessionData? _session;
  String? _currentUser;
final products = [
  {'name': 'Apple', 'price': 1.50},
  {'name': 'Milk', 'price': 2.00},
  {'name': 'Bread', 'price': 1.20},
];

 void createSession(String ownerName) {
    _session = SessionData(
      sessionId: _generateRandomId(),
      ownerName: ownerName,
    );
    notifyListeners();
  }

  void joinSession(String friendName) {
    _session?.friendName = friendName;
    notifyListeners();
  }

  void addItemToCart(CartItem item) {
    _session?.cartItems.add(item);
    notifyListeners();
  }

  void clearSession() {
    _session = null;
    notifyListeners();
  }

  String _generateRandomId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}