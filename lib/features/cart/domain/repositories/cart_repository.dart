import 'package:food_delivery/features/cart/domain/entities/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getCartItems();
  Future<void> addToCart(String productId, int quantity);
  Future<void> updateQuantity(String productId, int quantity);
  Future<void> removeFromCart(String productId);
  Future<void> clearCart();
}
