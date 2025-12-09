import 'dart:developer';

import 'package:food_delivery/features/product/data/datasources/local/product_local_data_source.dart';
import 'package:food_delivery/features/product/data/datasources/remote/product_remote_data_source.dart';
import 'package:food_delivery/features/product/data/models/product_model.dart';
import 'package:food_delivery/features/product/domain/entities/data_source.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/domain/entities/product_result.dart';
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<ProductResult> getProducts() async {
    try {
      // محاولة جلب البيانات من API
      final remoteProducts = await remoteDataSource.getProducts();
      // حفظ البيانات محلياً للاستخدام لاحقاً
      for (var product in remoteProducts) {
        await localDataSource.insertProduct(product);
      }
      return ProductResult(products: remoteProducts, source: DataSource.remote);
    } catch (e) {
      // في حالة فشل API، استخدم البيانات المحلية
      final localProducts = await localDataSource.getProducts();
      if (localProducts.isEmpty) {
        // إذا لم تكن هناك بيانات محلية، أعد الخطأ
        throw Exception('No products available. Network error: $e');
      }
      return ProductResult(products: localProducts, source: DataSource.local);
    }
  }

  @override
  Future<ProductResult> getRecommendedProducts() async {
    try {
      // محاولة جلب البيانات من API
      final remoteProducts = await remoteDataSource.getRecommendedProducts();
      // حفظ البيانات محلياً
      for (var product in remoteProducts) {
        await localDataSource.insertProduct(product);
      }
      return ProductResult(products: remoteProducts, source: DataSource.remote);
    } catch (e) {
      // في حالة فشل API، استخدم البيانات المحلية
      final localProducts = await localDataSource.getProducts();
      final recommended = localProducts
          .where((p) => p.category == 'recommended')
          .toList();
      // Return empty list if no recommended products (not an error, just empty)
      return ProductResult(products: recommended, source: DataSource.local);
    }
  }

  @override
  Future<ProductResult> getProductsByCategory(String category) async {
    try {
      // محاولة جلب البيانات من API
      final remoteProducts = await remoteDataSource.getProductsByCategory(
        category,
      );
      // حفظ البيانات محلياً
      for (var product in remoteProducts) {
        await localDataSource.insertProduct(product);
      }
      return ProductResult(products: remoteProducts, source: DataSource.remote);
    } catch (e) {
      // في حالة فشل API، استخدم البيانات المحلية
      final localProducts = await localDataSource.getProductsByCategory(
        category,
      );
      // Return empty list if no products in category (not an error, just empty)
      return ProductResult(products: localProducts, source: DataSource.local);
    }
  }

  @override
  Future<ProductEntity> toggleFavorite(String productId) async {
    try {
      final product = await getProductById(productId);
      log('ytyutuityyut');
      // محاولة تحديث في API
      final updatedProduct = await remoteDataSource.toggleFavorite(
        productId,
        !product.isFavorite,
      );
      // حفظ التحديث محلياً
      await localDataSource.updateProduct(updatedProduct);
      return updatedProduct;
    } catch (e) {
      // في حالة فشل API، استخدم البيانات المحلية
      final product = await localDataSource.getProductById(productId);
      if (product == null) {
        throw Exception('Product not found. Network error: $e');
      }
      final updatedProduct = ProductModel(
        id: product.id,
        name: product.name,
        price: product.price,
        imagePath: product.imagePath,
        isFavorite: !product.isFavorite,
        category: product.category,
        description: product.description,
        ingredients: product.ingredients,
      );
      await localDataSource.toggleFavorite(
        productId,
        updatedProduct.isFavorite,
      );
      return updatedProduct;
    }
  }

  @override
  Future<ProductEntity> getProductById(String productId) async {
    try {
      log('messagemessagemessagemessagev');
      // محاولة جلب من API
      final product = await remoteDataSource.getProductById(productId);
      // حفظ محلياً
      await localDataSource.insertProduct(product);
      return product;
    } catch (e) {
      // في حالة فشل API، استخدم البيانات المحلية
      final product = await localDataSource.getProductById(productId);
      if (product == null) {
        throw Exception('Product not found. Network error: $e');
      }
      return product;
    }
  }

  @override
  Stream<ProductResult> watchAllTasks() {
    try {
      return remoteDataSource.watchAllTasks();
    } catch (e) {
      try {
        return localDataSource.watchAllTasks();
      } catch (e) {
        throw Exception('Failed to watch products: $e');
      }
    }
  }

  @override
  Stream<ProductResult> watchRecommendedProducts() {
    try {
      return remoteDataSource.watchRecommendedProducts();
    } catch (e) {
      try {
        return localDataSource.watchAllTasks().map(
          (products) => ProductResult(
            products: products.products
                .where((p) => p.category == 'recommended')
                .toList(),
            source: DataSource.local,
          ),
        );
      } catch (e) {
        throw Exception('Failed to watch products: $e');
      }
    }
  }

  @override
  Stream<ProductResult> watchProductsByCategory(String category) {
    try {
      return remoteDataSource.watchProductsByCategory(category);
    } catch (e) {
      try {
        return localDataSource.watchProductsByCategory(category);
      } catch (e) {
        throw Exception('Failed to watch products: $e');
      }
    }
  }

  @override
  Stream<ProductEntity?> watchProductById(String productId) {
    try {
      return remoteDataSource.watchProductById(productId);
    } catch (e) {
      try {
        return localDataSource.watchProductById(productId);
      } catch (e) {
        throw Exception('Failed to watch product: $e');
      }
    }
  }

  @override
  Future<ProductResult> searchProducts(String query) async {
    try {
      // محاولة البحث في API
      final remoteProducts = await remoteDataSource.searchProducts(query);
      return ProductResult(products: remoteProducts, source: DataSource.remote);
    } catch (e) {
      final localProducts = await localDataSource.searchProducts(query);
      final queryLower = query.toLowerCase();
      final searchResults = localProducts
          .where(
            (p) =>
                p.name.toLowerCase().contains(queryLower) ||
                (p.description?.toLowerCase().contains(queryLower) ?? false) ||
                (p.ingredients?.any(
                      (ing) => ing.toLowerCase().contains(queryLower),
                    ) ??
                    false),
          )
          .toList();
      return ProductResult(products: searchResults, source: DataSource.local);
    }
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    try {
      await remoteDataSource.addProduct(product);
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }
}
