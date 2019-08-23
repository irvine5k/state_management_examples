import 'package:flutter/material.dart';
import 'package:shopping_bloc_provider/src/shopping_cart/models/models.dart';

class ShoppingCartNotifier extends ChangeNotifier {
  ShoppingCart cart = ShoppingCart();

  remove(Item item) {
    cart.remove(item);
    notifyListeners();
  }

  add(Item item) {
    cart.add(item);
    notifyListeners();
  }
}
