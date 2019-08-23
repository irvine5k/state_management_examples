import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shoppingcart_bloc/model/CartItem.dart';
import 'package:shoppingcart_bloc/model/Product.dart';
import 'package:shoppingcart_bloc/model/ShoppingCart.dart';


class CartBloc extends BlocBase {
  Observable<double> total;
  Observable<List<CartItem>> itens;
  Observable<ShoppingCart> _cartBase;

  set add(Product i) => _add.sink.add(i);
  set delete(CartItem i) => _remove.sink.add(i);

  final _add = BehaviorSubject<Product>();
  final _cart = BehaviorSubject<ShoppingCart>.seeded(ShoppingCart());
  final _remove = BehaviorSubject<CartItem>();

  CartBloc() {
    final add = Observable.combineLatest2<Product, ShoppingCart, ShoppingCart>(
        _add, _cart, (a, b) => b..add(a));

    final remove =
        Observable.combineLatest2<CartItem, ShoppingCart, ShoppingCart>(
            _remove, _cart, (a, b) => b..remove(a));

    _cartBase = add
      .mergeWith([remove])
      .publishValue()
      .autoConnect();
      
    itens = _cartBase
      .map((e) => e.items);

    total = _cartBase
      .map((e) => e.total);
  }

  void dispose() {
    super.dispose();
    _add.close();
    _remove.close();
    _cart.close();
  }
}
