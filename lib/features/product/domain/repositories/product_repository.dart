import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/domain/entities/product_result.dart';

abstract class ProductRepository {
  Future<ProductResult> getProducts();
  Future<ProductResult> getRecommendedProducts();
  Future<ProductResult> getProductsByCategory(String category);
  Future<Product> toggleFavorite(String productId);
  Future<Product> getProductById(String productId);

  // إضافة دالة البحث
  Future<ProductResult> searchProducts(String query);
}
