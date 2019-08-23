// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(json['product'] == null
      ? null
      : Product.fromJson(json['product'] as Map<String, dynamic>))
    ..id = json['id'] as String
    ;
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'product': instance.product,
      'id': instance.id,
      'amount': instance.amount,
      'total': instance.total
    };
