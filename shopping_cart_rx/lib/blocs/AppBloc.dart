
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shoppingcart_bloc/model/Product.dart';

class AppBloc extends BlocBase {
  final _productStream = new BehaviorSubject<List<Product>>();
  Observable<List<Product>> get productFlux =>
      _productStream.stream.startWith(generateList());


  List<Product> generateList() {
    List<Product> lista = List<Product>()
      ..add(Product()
        ..id = "1"
        ..name = "Noite com o Jacob"
        ..price = 28.35)
      ..add(Product()
        ..id = "2"
        ..name = "Pneu da Goodyear"
        ..price = 88.99)
      ..add(Product()
        ..id = "3"
        ..name = "Maçã"
        ..price = 73.42)
      ..add(Product()
        ..id = "4"
        ..name = "Triplex perdido"
        ..price = 98.54)
      ..add(Product()
        ..id = "5"
        ..name = "Copo"
        ..price = 61.85)
      ..add(Product()
        ..id = "6"
        ..name = "Buscador de gifs"
        ..price = 39.90)
      ..add(Product()
        ..id = "7"
        ..name = "Anel do Frodo"
        ..price = 21.35)
      ..add(Product()
        ..id = "8"
        ..name = "Bloc puro"
        ..price = 11.35)
      ..add(Product()
        ..id = "9"
        ..name = "Vilson"
        ..price = 25.35);

    return lista;
  }

  @override
  void dispose() {
    _productStream?.close();
  }
}
