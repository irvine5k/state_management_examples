import 'package:json_annotation/json_annotation.dart';
import 'package:shoppingcart_bloc/model/Product.dart';

// Não se deve usar o operator (equals) e o hashcode em atributos
// que possam mudar ao longo do tempo , pois isso irá gerar uma falha
// na verificação feita pelo método
// use apenas em atributos que não sejam mutáveis ao longo do tempo
// nesse caso usamos em produto

part 'CartItem.g.dart';

@JsonSerializable()
class CartItem {
  String _id;
  final Product product;
  int _amount = 1;

  CartItem(this.product);

  // métodos do json serializable que vão permitir que possamos transformar
// o json em instâncias de classe e também as instâncias da classe em json

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  String get id => this._id;
  set id(String id) => this._id = id;

  int get amount => this._amount;
  double get total => product.price * _amount;

// métodos para incrementar e decrementar a quantidade do CartItem
  void increment() => _amount++;

  void decrement() {
    if (_amount > 1) _amount--;
  }

// sobrescrevendo o método operator e analisando se
// outra instância do cart item é igual a a instância executada no momento
  @override
  bool operator ==(other) => other is CartItem && other.product == this.product;

// criando o hash do cart item
// multiplicando o hash do produto vezes o hashcode já existente
  @override
  int get hashCode => product.hashCode * super.hashCode;
}
