import 'package:flutter/material.dart';
import 'package:sippy/model/session_model.dart';
import 'package:sippy/model/product_model.dart';
import 'package:sippy/utils/locator.dart';
import 'package:sippy/view_models/cart_view_model.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends  BaseViewModel {
  ShoppingSession? currentSession;
  String? _currentUser;
  int cartNumber = 0;
  final cartViewModel = serviceLocator<CartViewModel>();




void createSession({
    required String createdBy,
    required List<String> invitedFriends,
  }) {
    currentSession = ShoppingSession(
      sessionId: UniqueKey().toString(), // or use UUID
      createdBy: createdBy,
      invitedFriends: invitedFriends,
      cartItems: [],
    );
    notifyListeners();
  }

  void joinSession(ShoppingSession session) {
    currentSession = session;
    notifyListeners();
  }

  void cancelSession() {
    currentSession = null;
    notifyListeners();
  }

  String _generateRandomId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  void addMoreItem() {
      cartNumber++;
      notifyListeners();
  }

  void removeMoreItem() {
      if (cartNumber != 0) {
        cartNumber--;
        notifyListeners();
      } else {}
  }

  final List<Product> products = [
  Product(name: "Smart Watch", description: "Water-resistant fitness tracker", amount: 49.99, image: "assets/images/food-big.png"),
  Product(name: "Wireless Earbuds", description: "Noise-cancelling Bluetooth earbuds", amount: 59.99, image: "assets/images/food-big.png"),
  Product(name: "Bluetooth Speaker", description: "Portable and powerful sound", amount: 34.99, image: "assets/images/food-big.png"),
  Product(name: "Gaming Mouse", description: "Ergonomic mouse with RGB", amount: 29.99, image: "assets/images/food-big.png"),
  Product(name: "Mechanical Keyboard", description: "Backlit keys and fast response", amount: 79.99, image: "assets/images/food-big.png"),
  Product(name: "LED Monitor", description: "24-inch Full HD display", amount: 129.99, image: "assets/images/food-big.png"),
  Product(name: "Webcam 1080p", description: "HD video for streaming and meetings", amount: 39.99, image: "assets/images/food-big.png"),
  Product(name: "Laptop Stand", description: "Aluminum adjustable holder", amount: 22.50, image: "assets/images/food-big.png"),
  Product(name: "USB-C Hub", description: "Multiport adapter with HDMI", amount: 18.99, image: "assets/images/food-big.png"),
  Product(name: "External SSD", description: "Fast storage for backups", amount: 99.95, image: "assets/images/food-big.png"),
  Product(name: "Tablet 10\"", description: "Sleek design with large screen", amount: 159.00, image: "assets/images/food-big.png"),
  Product(name: "Smartphone Case", description: "Shockproof & stylish design", amount: 12.99, image: "assets/images/food-big.png"),
  Product(name: "Power Bank", description: "10000mAh fast charge", amount: 24.99, image: "assets/images/food-big.png"),
  Product(name: "Tripod Stand", description: "Lightweight camera support", amount: 19.99, image: "assets/images/food-big.png"),
  Product(name: "Portable Projector", description: "Mini LED projector for movies", amount: 210.00, image: "assets/images/food-big.png"),
  Product(name: "Wireless Charger", description: "Qi certified fast charging", amount: 15.49, image: "assets/images/food-big.png"),
  Product(name: "Gaming Headset", description: "Surround sound & mic", amount: 54.75, image: "assets/images/food-big.png"),
  Product(name: "Smart Lamp", description: "Voice control with brightness levels", amount: 28.00, image: "assets/images/food-big.png"),
  Product(name: "Fitness Band", description: "Heart rate & sleep tracking", amount: 45.99, image: "assets/images/food-big.png"),
  Product(name: "Drone Camera", description: "4K aerial shots with GPS", amount: 299.00, image: "assets/images/food-big.png"),
  Product(name: "Graphic Tablet", description: "Digital drawing board", amount: 67.89, image: "assets/images/food-big.png"),
  Product(name: "Laptop Backpack", description: "Water-resistant with USB port", amount: 32.00, image: "assets/images/food-big.png"),
  Product(name: "Mini Fridge", description: "Compact and silent", amount: 120.45, image: "assets/images/food-big.png"),
  Product(name: "Coffee Maker", description: "One-touch brewing", amount: 49.95, image: "assets/images/food-big.png"),
  Product(name: "HDMI Cable", description: "High-speed 4K compatible", amount: 9.99, image: "assets/images/food-big.png"),
  Product(name: "Smart Plug", description: "WiFi-enabled voice control", amount: 14.49, image: "assets/images/food-big.png"),
  Product(name: "Streaming Stick", description: "4K media streamer", amount: 39.50, image: "assets/images/food-big.png"),
  Product(name: "Wireless Router", description: "Dual-band with fast speeds", amount: 89.99, image: "assets/images/food-big.png"),
  Product(name: "Action Camera", description: "Waterproof adventure cam", amount: 110.00, image: "assets/images/food-big.png"),
  Product(name: "Noise Machine", description: "Sleep aid with natural sounds", amount: 25.00, image: "assets/images/food-big.png"),
  Product(name: "Digital Alarm Clock", description: "LED display with USB charge", amount: 16.75, image: "assets/images/food-big.png"),
];

}