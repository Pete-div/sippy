// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sippy/model/cart_model.dart';
import 'package:sippy/model/product_model.dart';
import 'package:sippy/model/session_model.dart';
import 'package:sippy/utils/flutter_toast.dart';
import 'package:sippy/utils/share_preference.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

class CartViewModel extends BaseViewModel {
  final Map<String, ShoppingSession> _sessions = {};
  String? currentSessionId;
  bool isSessionCreated = false;

  void updateDialog() {
    isSessionCreated = !isSessionCreated;
    notifyListeners();
  }

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  Future<void> addToCart({
    required Product product,
    required int quantity,
    required String createdBy,
    required List<String> friends,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    String? sessionId = await LocalUserService.getSessionId();
    if (sessionId == null) {
      createSession(createdBy: createdBy, friends: friends);
      sessionId = await LocalUserService.getSessionId();
    }

    final creator = await LocalUserService.getCreatorName();

    final rawCart = prefs.getString(sessionId ?? '');
    List<CartItem> cartItems = [];

    if (rawCart != null) {
      List<dynamic> decoded = json.decode(rawCart);
      cartItems = decoded.map((e) => CartItem.fromJson(e)).toList();
    }

    int existingIndex = cartItems.indexWhere(
      (item) =>
          item.product.name == product.name &&
          item.addedBy == creator &&
          item.sessionId == sessionId,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex] = CartItem(
        product: product,
        quantity: cartItems[existingIndex].quantity + quantity,
        addedBy: creator ?? 'Joe',
        sessionId: sessionId ?? '',
      );
    } else {
      cartItems.add(CartItem(
        product: product,
        quantity: quantity,
        addedBy: creator ?? 'Joe',
        sessionId: sessionId ?? '',
      ));
    }

    final encoded = json.encode(cartItems.map((e) => e.toJson()).toList());
    await prefs.setString(sessionId ?? '', encoded);

    _cartItems
      ..clear()
      ..addAll(cartItems);

    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void createSession(
      {required String createdBy, required List<String> friends}) async {
    final sessionId = const Uuid().v4();
    final session = ShoppingSession(
      sessionId: sessionId,
      createdBy: createdBy,
      invitedFriends: friends,
      cartItems: cartItems,
    );

    _sessions[sessionId] = session;
    currentSessionId = sessionId;
    await LocalUserService.saveSessionId(sessionId);
    await LocalUserService.saveFullSession(session);
    notifyListeners();
  }

  Future<void> loadCartForSession() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionId = await LocalUserService.getSessionId();

    if (sessionId == null) return;

    final rawCart = prefs.getString(sessionId);
    if (rawCart != null) {
      final decoded = json.decode(rawCart);
      _cartItems
        ..clear()
        ..addAll((decoded as List).map((e) => CartItem.fromJson(e)));
      notifyListeners();
    }
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionId = await LocalUserService.getSessionId();
    if (sessionId != null) {
      await prefs.remove(sessionId);
    }
    _cartItems.clear();
    notifyListeners();
  }

  Future<void> joinExistingSession(
    String sessionId,
    BuildContext context,
    Function() function,
  ) async {
    final creatorName = await LocalUserService.getInviterName();
    if (creatorName == null) {
     showDialog(
        context: context,
        builder: (context) {
          final dialogContext = context;
          Future.delayed(const Duration(seconds: 2), () {
            if (Navigator.of(dialogContext).canPop()) {
              Navigator.of(dialogContext).pop();
            }
          });
          return const AlertDialog(
            content: SizedBox(
              height: 50,
              width: 300,
              child: Center(
                child: Text("No existing session created, please start a Session"),
              ),
            ),
          );
        },
      );
    
    } else {
       final rawSession = await LocalUserService.getFullSession(sessionId);
    if (rawSession != null) {
    } else {}
    if (!_sessions.containsKey(sessionId)) {
      final session = await LocalUserService.getFullSession(sessionId);

      if (session != null) {
        _sessions[sessionId] = session;
      }
    }

    if (_sessions.containsKey(sessionId)) {
      currentSessionId = sessionId;
      await LocalUserService.saveSessionId(sessionId);
      await loadCartForSession();

      notifyListeners();
      function();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          final dialogContext = context;
          Future.delayed(const Duration(seconds: 2), () {
            if (Navigator.of(dialogContext).canPop()) {
              Navigator.of(dialogContext).pop();
            }
          });
          return const AlertDialog(
            content: SizedBox(
              height: 50,
              width: 300,
              child: Center(
                child: Text("No session created, please start a Session"),
              ),
            ),
          );
        },
      );
    }
    }
  }

  Future<void> joinSession(
    String sessionId,
    BuildContext context,
    String name,
    Function() function,
  ) async {
    final rawSession = await LocalUserService.getFullSession(sessionId);
    if (rawSession != null) {
    } else {}
    if (!_sessions.containsKey(sessionId)) {
      final session = await LocalUserService.getFullSession(sessionId);

      if (session != null) {
        _sessions[sessionId] = session;
      }
    }

    if (_sessions.containsKey(sessionId)) {
      currentSessionId = sessionId;
      await LocalUserService.saveSessionId(sessionId);
      await loadCartForSession();

      showSuccessFlutterToast("You have joined $name's shared cart session");
      notifyListeners();
      function();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          final dialogContext = context;
          Future.delayed(const Duration(seconds: 2), () {
            if (Navigator.of(dialogContext).canPop()) {
              Navigator.of(dialogContext).pop();
            }
          });
          return const AlertDialog(
            content: SizedBox(
              height: 50,
              width: 300,
              child: Center(
                child: Text("No session created, please start a Session"),
              ),
            ),
          );
        },
      );
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
      cartItems.fold(0, (sum, item) => sum + item.totalPrice);
}
