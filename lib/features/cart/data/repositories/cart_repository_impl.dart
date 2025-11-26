import 'package:food_delivery/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:food_delivery/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:food_delivery/features/cart/data/models/cart_item_model.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_item.dart';
import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';
import 'package:food_delivery/features/product/data/models/product_model.dart';
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final CartLocalDataSource localDataSource;
  final ProductRepository productRepository;

  CartRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.productRepository,
  });

  @override
  Future<List<CartItemEntity>> getCartItems() async {
    try {
      // Try to get from API first
      final remoteItems = await remoteDataSource.getCartItems();
      // Sync to local
      await localDataSource.clearCart();
      for (var item in remoteItems) {
        await localDataSource.addCartItem(item);
      }
      return remoteItems;
    } catch (e) {
      // Fallback to local data
      final localItems = localDataSource.getCartItems();
      // Return empty list if local is also empty (cart is empty, not an error)
      return localItems;
    }
  }

  @override
  Future<void> addToCart(String productId, int quantity) async {
    try {
      // Try to add to API first
      await remoteDataSource.addToCart(productId, quantity);
      // Sync to local
      final product = await productRepository.getProductById(productId);
      final cartItem = CartItemModel(
        product: product as ProductModel,
        quantity: quantity,
      );
      await localDataSource.addCartItem(cartItem);
    } catch (e) {
      // Fallback to local only
      try {
        final product = await productRepository.getProductById(productId);
        final cartItem = CartItemModel(
          product: product as ProductModel,
          quantity: quantity,
        );
        await localDataSource.addCartItem(cartItem);
        // Successfully saved locally, don't throw exception
        // The operation succeeded locally even though API failed
      } catch (localError) {
        // Only throw if local save also failed
        throw Exception(
          'Failed to add to cart. API error: $e, Local error: $localError',
        );
      }
    }
  }

  @override
  Future<void> updateQuantity(String productId, int quantity) async {
    try {
      // Try to update on API first
      await remoteDataSource.updateQuantity(productId, quantity);
      // Sync to local
      await localDataSource.updateCartItem(productId, quantity);
    } catch (e) {
      // Fallback to local only
      try {
        await localDataSource.updateCartItem(productId, quantity);
        // Successfully updated locally, don't throw exception
        // The operation succeeded locally even though API failed
      } catch (localError) {
        // Only throw if local update also failed
        throw Exception(
          'Failed to update quantity. API error: $e, Local error: $localError',
        );
      }
    }
  }

  @override
  Future<void> removeFromCart(String productId) async {
    try {
      // Try to remove from API first
      await remoteDataSource.removeFromCart(productId);
      // Sync to local
      await localDataSource.removeCartItem(productId);
    } catch (e) {
      // Fallback to local only
      try {
        await localDataSource.removeCartItem(productId);
        // Successfully removed locally, don't throw exception
        // The operation succeeded locally even though API failed
      } catch (localError) {
        // Only throw if local remove also failed
        throw Exception(
          'Failed to remove from cart. API error: $e, Local error: $localError',
        );
      }
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      // Try to clear on API first
      await remoteDataSource.clearCart();
      // Sync to local
      await localDataSource.clearCart();
    } catch (e) {
      // Fallback to local only
      try {
        await localDataSource.clearCart();
        // Successfully cleared locally, don't throw exception
        // The operation succeeded locally even though API failed
      } catch (localError) {
        // Only throw if local clear also failed
        throw Exception(
          'Failed to clear cart. API error: $e, Local error: $localError',
        );
      }
    }
  }
}
