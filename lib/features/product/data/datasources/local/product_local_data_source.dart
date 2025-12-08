import 'package:food_delivery/features/product/data/datasources/local/drift_database.dart';
import 'package:food_delivery/features/product/data/models/product_model.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel?> getProductById(String id);
  Future<void> updateProduct(ProductModel product);
  Future<void> insertProduct(ProductModel product);
  Future<void> deleteProduct(String id);
  Stream<List<ProductEntity>> watchAllTasks();
  Stream<List<ProductEntity>> watchFavorites();
  Future<List<ProductModel>> searchProducts(String query);
  Future<List<ProductModel>> getProductsByCategory(String category);
  Stream<List<ProductEntity>> watchProductsByCategory(String category);
  Stream<ProductEntity?> watchProductById(String id);
  Future<void> toggleFavorite(String id, bool isFavorite);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final AppDatabase db;
  ProductLocalDataSourceImpl({required this.db});

  @override
  Future<List<ProductModel>> getProducts() async {
    final products = await db.productDao.getAllProducts();
    return products.map((data) => ProductModel.fromProductData(data)).toList();
  }

  @override
  Future<ProductModel?> getProductById(String id) async {
    final product = await db.productDao.getProductById(id);
    return product != null ? ProductModel.fromProductData(product) : null;
  }

  @override
  Stream<ProductEntity?> watchProductById(String id) {
    return db.productDao
        .watchProductById(id)
        .map(
          (data) => data != null ? ProductModel.fromProductData(data) : null,
        );
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    // استخدام insertOrUpdate للتأكد من أن المنتج سيتم حفظه سواء كان موجوداً أم لا
    await db.productDao.insertOrUpdateProduct(product.toCompanion());
  }

  @override
  Future<void> insertProduct(ProductModel product) async {
    await db.productDao.insertProduct(product.toCompanion());
  }

  @override
  Future<void> deleteProduct(String id) async {
    await db.productDao.deleteProduct(id);
  }

  @override
  Stream<List<ProductEntity>> watchAllTasks() {
    return db.productDao.watchAll().map(
      (rows) => rows.map((data) => ProductModel.fromProductData(data)).toList(),
    );
  }

  @override
  Stream<List<ProductEntity>> watchFavorites() {
    return db.productDao.watchFavorites().map(
      (rows) => rows.map((data) => ProductModel.fromProductData(data)).toList(),
    );
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final products = await db.productDao.searchProducts(query);
    return products.map((data) => ProductModel.fromProductData(data)).toList();
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final products = await db.productDao.getProductsByCategory(category);
    return products.map((data) => ProductModel.fromProductData(data)).toList();
  }

  @override
  Stream<List<ProductEntity>> watchProductsByCategory(String category) {
    return db.productDao
        .watchProductsByCategory(category)
        .map(
          (rows) =>
              rows.map((data) => ProductModel.fromProductData(data)).toList(),
        );
  }

  @override
  Future<void> toggleFavorite(String id, bool isFavorite) async {
    await db.productDao.toggleFavorite(id, isFavorite);
  }
}
