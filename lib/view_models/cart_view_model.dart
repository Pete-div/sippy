import 'package:sippy/model/cart_model.dart';
import 'package:sippy/model/product_model.dart';
import 'package:sippy/model/session_model.dart';
import 'package:sippy/utils/share_preference.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

class CartViewModel extends  BaseViewModel {
  final Map<String, ShoppingSession> _sessions = {};
String? currentSessionId;
  ShoppingSession? currentSession;
bool isSessionCreated =false;

void updateDialog(){
  isSessionCreated=!isSessionCreated;
  notifyListeners();
}



   final List<CartItem> _cartItems = [];

List<CartItem> get cartItems => currentCartItems;
void addToCart({
  
  required Product product,
  int quantity = 1,
}) async{
                  final     creator=         await LocalUserService.getCreatorName();

  if (currentSessionId == null || !_sessions.containsKey(currentSessionId)) {
    throw Exception("No active session.");
  }
  final session = _sessions[currentSessionId!]!;
  final cartItems = session.cartItems;

  int existingIndex = cartItems.indexWhere(
    (item) =>
        item.product.name == product.name &&
        item.addedBy == creator &&
        item.sessionId == session.sessionId,
  );

  if (existingIndex != -1) {
    cartItems[existingIndex] = CartItem(
      product: product,
      quantity: cartItems[existingIndex].quantity + quantity,
      addedBy: creator ??'Joe',
      sessionId: session.sessionId,
    );
  } else {
    cartItems.add(CartItem(
      product: product,
      quantity: quantity,
      addedBy: creator ??'Joe',
      sessionId: session.sessionId,
    ));
  }

  notifyListeners();

}

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

void createSession({required String createdBy, required List<String> friends}) {
  final sessionId = const Uuid().v4(); 
  final session = ShoppingSession(
    sessionId: sessionId,
    createdBy: createdBy,
    invitedFriends: friends,
    cartItems: [],
  );

  _sessions[sessionId] = session;
  currentSessionId = sessionId;
  notifyListeners();
}
 

void joinSession(String sessionId) {
  if (_sessions.containsKey(sessionId)) {
    currentSessionId = sessionId;
    notifyListeners();
  } else {
    throw Exception("Session not found");
  }
}

void cancelSession() {
  if (currentSessionId != null) {
    _sessions.remove(currentSessionId);
    currentSessionId = null;
        _cartItems.clear();

    notifyListeners();
  }
}
List<CartItem> get currentCartItems =>
    currentSessionId != null && _sessions.containsKey(currentSessionId)
        ? _sessions[currentSessionId!]!.cartItems
        : [];
double get cartTotal =>
    currentCartItems.fold(0, (sum, item) => sum + item.totalPrice);

}