import 'package:drift/drift.dart';
import 'package:food_delivery/features/product/data/datasources/local/drift_database.dart';
import '../tables/cart_table.dart';

part 'cart_dao.g.dart';

@DriftAccessor(tables: [Cart])
class CartDao extends DatabaseAccessor<AppDatabase> with _$CartDaoMixin {
  CartDao(super.db);

  // مشاهدة جميع عناصر السلة
  Stream<List<CartData>> watchAll() => select(cart).watch();

  // الحصول على جميع عناصر السلة
  Future<List<CartData>> getAllCartItems() => select(cart).get();

  // الحصول على عنصر في السلة بواسطة productId
  Future<CartData?> getCartItemByProductId(String productId) => (select(
    cart,
  )..where((c) => c.productId.equals(productId))).getSingleOrNull();

  // إضافة عنصر إلى السلة أو تحديث الكمية إذا كان موجوداً
  Future<void> insertOrUpdateCartItem(CartCompanion cartCompanion) =>
      into(cart).insert(cartCompanion, mode: InsertMode.replace);

  // تحديث كمية عنصر في السلة
  Future<bool> updateCartItemQuantity(String productId, int quantity) async {
    final result =
        await (update(cart)..where((c) => c.productId.equals(productId))).write(
          CartCompanion(quantity: Value(quantity)),
        );
    return result > 0;
  }

  // حذف عنصر من السلة
  Future<int> deleteCartItem(String productId) =>
      (delete(cart)..where((c) => c.productId.equals(productId))).go();

  // حذف جميع عناصر السلة
  Future<int> clearCart() => delete(cart).go();

  // الحصول على عدد العناصر في السلة
  Future<int> getCartItemsCount() async {
    final items = await getAllCartItems();
    return items.length;
  }
}
