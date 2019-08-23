
import 'package:rxdart/rxdart.dart';
import 'package:shoppingcart_bloc/model/CartItem.dart';
import 'package:shoppingcart_bloc/model/Product.dart';

class ProductBloc {
  final _itens = new BehaviorSubject<List<CartItem>>.seeded([]);
  ValueObservable<List<CartItem>> get itens => _itens.stream;
  void cartItems(List<CartItem> itens) => _itens.sink.add(itens);

  ValueObservable<bool> inCart;

  ProductBloc(Product product) {
    inCart = itens
        .map((dados) => dados.contains(CartItem(product)))
        .publishValue()
        .autoConnect();
   
  }

  void dispose() {

    _itens?.close();
  }
}
