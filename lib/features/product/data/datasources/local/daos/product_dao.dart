import 'package:drift/drift.dart';
import '../drift_database.dart';
import '../tables/product_table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [Product])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(super.db);

  // مشاهدة جميع المنتجات
  Stream<List<ProductData>> watchAll() => select(product).watch();

  // الحصول على جميع المنتجات
  Future<List<ProductData>> getAllProducts() => select(product).get();

  // الحصول على منتج بواسطة ID
  Future<ProductData?> getProductById(String id) =>
      (select(product)..where((p) => p.id.equals(id))).getSingleOrNull();

  // إدراج منتج جديد
  Future<int> insertProduct(ProductCompanion productCompanion) =>
      into(product).insert(productCompanion);

  // إدراج أو تحديث منتج (إذا كان موجوداً يتم التحديث، وإلا يتم الإدراج)
  Future<void> insertOrUpdateProduct(ProductCompanion productCompanion) =>
      into(product).insert(productCompanion, mode: InsertMode.replace);

  // تحديث منتج
  Future<bool> updateProduct(ProductCompanion productCompanion) =>
      update(product).replace(productCompanion);

  // حذف منتج
  Future<int> deleteProduct(String id) =>
      (delete(product)..where((p) => p.id.equals(id))).go();

  // البحث في المنتجات
  Future<List<ProductData>> searchProducts(String query) {
    return (select(product)..where((p) => p.name.like('%$query%'))).get();
  }

  // الحصول على المنتجات المفضلة
  Stream<List<ProductData>> watchFavorites() =>
      (select(product)..where((p) => p.isFavorite.equals(true))).watch();

  // الحصول على المنتجات حسب الفئة
  Future<List<ProductData>> getProductsByCategory(String category) =>
      (select(product)..where((p) => p.category.equals(category))).get();

  // تبديل حالة المفضلة
  Future<void> toggleFavorite(String id, bool isFavorite) {
    return (update(product)..where((p) => p.id.equals(id))).write(
      ProductCompanion(isFavorite: Value(isFavorite)),
    );
  }
}
