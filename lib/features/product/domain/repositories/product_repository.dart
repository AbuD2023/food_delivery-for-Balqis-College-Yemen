import '../../data/models/product_model.dart';
import '../entities/product.dart';
import '../entities/product_result.dart';

abstract class ProductRepository {
  Future<ProductResult> getProducts();
  Future<ProductResult> getRecommendedProducts();
  Future<ProductResult> getProductsByCategory(String category);
  Future<ProductEntity> toggleFavorite(String productId);
  Future<ProductEntity> getProductById(String productId);

  Stream<ProductResult> watchAllTasks();
  Stream<ProductResult> watchRecommendedProducts();
  Stream<ProductResult> watchProductsByCategory(String category);
  Stream<ProductEntity?> watchProductById(String productId);

  // إضافة دالة البحث
  Future<ProductResult> searchProducts(String query);

  //
  Future<void> addProduct(ProductModel product);
}
