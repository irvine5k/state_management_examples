import 'package:json_annotation/json_annotation.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product {
  String _id;
  String _name;
  String _description;
  double _price;

  Product();

// métodos do json serializable que vão permitir que possamos transformar
// o json em instâncias de classe e também as instâncias da classe em json

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  String get id => this._id;
  set id(String id) => this._id = id;

  String get name => this._name;
  set name(String name) => this._name = name;

  String get description => this._description;
  set description(String _description) => this._description = _description;

  double get price => this._price;
  set price(double price) => this._price = price;

// sobrescrevendo método do operator
// definindo a igualdade entre dois produtos
// um produto é igual ao outro apenas se o id dos dois for o mesmo
  @override
  bool operator ==(other) => other is Product && other.id == this._id;

// sobrescrevendo o método hashcode
// multiplicando o hashcode já existente da classe pai
// vezes o hashcode do id
  @override
  int get hashCode => this.id.hashCode;
}

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
