import 'package:shoppingcart_bloc/model/CartItem.dart';
import 'package:shoppingcart_bloc/model/Product.dart';


class ShoppingCart {

  final _items = <CartItem>[];

  List<CartItem> get items => _items;

  double get total {
    double totalOfValues = 0;
    for (var valor in items) {
      totalOfValues = totalOfValues + valor.total;
    }

    return totalOfValues;
  }

  int get numOfItems => items?.length;

  void add(Product product) {
    CartItem item = CartItem(product);
    if (!_items.contains(item)) {
      _items.add(item);
    }
  }


  void remove(CartItem item) {
    items.remove(item);
  }
}
