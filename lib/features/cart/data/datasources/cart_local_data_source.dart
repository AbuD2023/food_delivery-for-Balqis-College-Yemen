import 'package:drift/drift.dart';
import 'package:food_delivery/features/cart/data/models/cart_item_model.dart';
import 'package:food_delivery/features/product/data/datasources/local/drift_database.dart';
import 'package:food_delivery/features/product/data/datasources/local/product_local_data_source.dart';
import 'package:food_delivery/features/product/data/models/product_model.dart';
import 'package:food_delivery/features/cart/data/datasources/local/daos/cart_dao.dart';

abstract class CartLocalDataSource {
  Future<List<CartItemModel>> getCartItems();
  Future<void> addCartItem(CartItemModel item);
  Future<void> updateCartItem(String productId, int quantity);
  Future<void> removeCartItem(String productId);
  Future<void> clearCart();
  Stream<List<CartItemModel>> watchCartItems();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final AppDatabase db;
  final ProductLocalDataSource productDataSource;

  CartLocalDataSourceImpl({required this.db, required this.productDataSource});

  CartDao get cartDao => db.cartDao;

  @override
  Future<List<CartItemModel>> getCartItems() async {
    final cartItems = await cartDao.getAllCartItems();
    final List<CartItemModel> result = [];

    for (final cartData in cartItems) {
      // جلب بيانات المنتج من قاعدة البيانات
      final product = await db.productDao.getProductById(cartData.productId);
      if (product != null) {
        final productModel = ProductModel.fromProductData(product);
        result.add(
          CartItemModel(product: productModel, quantity: cartData.quantity),
        );
      }
    }

    return result;
  }

  @override
  Stream<List<CartItemModel>> watchCartItems() async* {
    await for (final cartItems in cartDao.watchAll()) {
      final List<CartItemModel> result = [];

      for (final cartData in cartItems) {
        // جلب بيانات المنتج من قاعدة البيانات
        final product = await db.productDao.getProductById(cartData.productId);
        if (product != null) {
          final productModel = ProductModel.fromProductData(product);
          result.add(
            CartItemModel(product: productModel, quantity: cartData.quantity),
          );
        }
      }

      yield result;
    }
  }

  @override
  Future<void> addCartItem(CartItemModel item) async {
    // التحقق من وجود العنصر في السلة
    final existingItem = await cartDao.getCartItemByProductId(item.product.id);

    if (existingItem != null) {
      // تحديث الكمية إذا كان العنصر موجوداً
      final newQuantity = existingItem.quantity + item.quantity;
      await cartDao.updateCartItemQuantity(item.product.id, newQuantity);
    } else {
      // إضافة عنصر جديد
      await cartDao.insertOrUpdateCartItem(
        CartCompanion(
          productId: Value(item.product.id),
          quantity: Value(item.quantity),
        ),
      );
    }
  }

  @override
  Future<void> updateCartItem(String productId, int quantity) async {
    if (quantity > 0) {
      final result = await cartDao.updateCartItemQuantity(productId, quantity);
      if (!result) {
        throw Exception('Failed to update cart item quantity');
      }
    } else {
      await cartDao.deleteCartItem(productId);
    }
  }

  @override
  Future<void> removeCartItem(String productId) async {
    await cartDao.deleteCartItem(productId);
  }

  @override
  Future<void> clearCart() async {
    await cartDao.clearCart();
  }
}
