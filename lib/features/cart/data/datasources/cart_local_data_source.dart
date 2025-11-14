import 'package:food_delivery/features/cart/data/models/cart_item_model.dart';
import 'package:food_delivery/features/product/data/datasources/product_local_data_source.dart';

abstract class CartLocalDataSource {
  List<CartItemModel> getCartItems();
  Future<void> addCartItem(CartItemModel item);
  Future<void> updateCartItem(String productId, int quantity);
  Future<void> removeCartItem(String productId);
  Future<void> clearCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final ProductLocalDataSource productDataSource;
  static final List<CartItemModel> _cartItems = [];

  CartLocalDataSourceImpl({required this.productDataSource});

  @override
  List<CartItemModel> getCartItems() {
    return List.from(_cartItems);
  }

  @override
  Future<void> addCartItem(CartItemModel item) async {
    final existingIndex = _cartItems.indexWhere(
      (cartItem) => cartItem.product.id == item.product.id,
    );

    if (existingIndex != -1) {
      // Update quantity if item already exists
      _cartItems[existingIndex] = CartItemModel(
        product: item.product,
        quantity: _cartItems[existingIndex].quantity + item.quantity,
      );
    } else {
      // Add new item
      _cartItems.add(item);
    }
  }

  @override
  Future<void> updateCartItem(String productId, int quantity) async {
    final index = _cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      if (quantity > 0) {
        _cartItems[index] = CartItemModel(
          product: _cartItems[index].product,
          quantity: quantity,
        );
      } else {
        _cartItems.removeAt(index);
      }
    }
  }

  @override
  Future<void> removeCartItem(String productId) async {
    _cartItems.removeWhere((item) => item.product.id == productId);
  }

  @override
  Future<void> clearCart() async {
    _cartItems.clear();
  }
}
