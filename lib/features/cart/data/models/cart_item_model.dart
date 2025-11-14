import 'package:food_delivery/features/cart/domain/entities/cart_item.dart';
import 'package:food_delivery/features/product/data/models/product_model.dart';

class CartItemModel extends CartItem {
  CartItemModel({required super.product, required super.quantity});

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': (product as ProductModel).toJson(),
      'quantity': quantity,
    };
  }
}
