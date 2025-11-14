import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/product_local_data_source.dart';
import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product_result.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_product_by_id_usecase.dart';
import '../../domain/usecases/get_products_by_category_usecase.dart';
import '../../domain/usecases/get_recommended_products_usecase.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';

part 'product_state.g.dart';

// Data Source Providers
@riverpod
ProductLocalDataSource productLocalDataSource(Ref ref) {
  return ProductLocalDataSourceImpl();
}

@riverpod
ProductRemoteDataSource productRemoteDataSource(Ref ref) {
  return ProductRemoteDataSourceImpl(client: http.Client());
}

// Repository Provider
@riverpod
ProductRepository productRepository(Ref ref) {
  final remoteDataSource = ref.watch(productRemoteDataSourceProvider);
  final localDataSource = ref.watch(productLocalDataSourceProvider);
  return ProductRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}

// UseCases Providers
@riverpod
GetRecommendedProductsUsecase getRecommendedProductsUsecase(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetRecommendedProductsUsecase(repository);
}

@riverpod
GetProductsByCategoryUsecase getProductsByCategoryUsecase(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsByCategoryUsecase(repository);
}

@riverpod
ToggleFavoriteUsecase toggleFavoriteUsecase(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ToggleFavoriteUsecase(repository);
}

@riverpod
GetProductByIdUsecase getProductByIdUsecase(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductByIdUsecase(repository);
}

// State Providers
@riverpod
Future<ProductResult> recommendedProducts(Ref ref) async {
  final useCase = ref.watch(getRecommendedProductsUsecaseProvider);
  return await useCase();
}

@riverpod
Future<ProductResult> productsByCategory(Ref ref, String category) async {
  final useCase = ref.watch(getProductsByCategoryUsecaseProvider);
  return await useCase(category);
}

@riverpod
Future<Product> productById(Ref ref, String productId) async {
  final useCase = ref.watch(getProductByIdUsecaseProvider);
  return await useCase(productId);
}
