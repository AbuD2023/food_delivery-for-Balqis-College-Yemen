import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/domain/entities/product_result.dart';

abstract class ProductRepository {
  Future<ProductResult> getProducts();
  Future<ProductResult> getRecommendedProducts();
  Future<ProductResult> getProductsByCategory(String category);
  Future<ProductEntity> toggleFavorite(String productId);
  Future<ProductEntity> getProductById(String productId);

  Stream<List<ProductEntity>> watchAllTasks();

  // إضافة دالة البحث
  Future<ProductResult> searchProducts(String query);
}
