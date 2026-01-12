import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/product/domain/usecases/add_product_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/local/product_local_data_source.dart';
import '../../data/datasources/local/drift_database.dart';
import '../../data/datasources/remote/product_remote_data_source.dart';
import '../../data/models/product_model.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product_result.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_product_by_id_usecase.dart';
import '../../domain/usecases/get_products_by_category_usecase.dart';
import '../../domain/usecases/get_recommended_products_usecase.dart';
import '../../domain/usecases/search_products_usecase.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';

part 'product_state.g.dart';

// Database Provider
@riverpod
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());

  // تهيئة قاعدة البيانات بالبيانات الأولية (غير متزامن)
  db.seedInitialData().catchError((error) {
    // يمكن إضافة معالجة للأخطاء هنا إذا لزم الأمر
    // print('Error seeding initial data: $error');
  });

  return db;
}

// Data Source Providers
@riverpod
ProductLocalDataSource productLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return ProductLocalDataSourceImpl(db: db);
}

@riverpod
ProductRemoteDataSource productRemoteDataSource(Ref ref) {
  return ProductRemoteDataSourceImpl(
    client: http.Client(),
    firestore: FirebaseFirestore.instance,
  );
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

@riverpod
AddProductUsecase addProductUsecase(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return AddProductUsecase(repository);
}

// @riverpod
// Future<void> addProduct(Ref ref, ProductModel product) async {
//   final usecase = ref.watch(addProductUsecaseProvider);
//   return await usecase(product);
// }

@riverpod
class AddProductNotifier extends _$AddProductNotifier {
  @override
  AsyncValue<bool> build() {
    return AsyncValue.data(false);
  }

  Future<void> add(ProductModel product) async {
    state = const AsyncLoading();
    try {
      final usecase = ref.watch(addProductUsecaseProvider);
      await usecase(product);
      state = AsyncData(true);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

// State Providers - Stream based for auto-updates
@riverpod
Stream<ProductResult> recommendedProducts(Ref ref) async* {
  final repository = ref.watch(productRepositoryProvider);

  // First, try to load from API and sync to local
  try {
    final useCase = ref.watch(getRecommendedProductsUsecaseProvider);
    await useCase();
  } catch (e) {
    // If API fails, continue with local data
  }

  // Then watch local database for changes
  await for (final products in repository.watchRecommendedProducts()) {
    yield products;
  }
}

@riverpod
Stream<ProductResult> productsByCategory(Ref ref, String category) async* {
  final repository = ref.watch(productRepositoryProvider);

  // First, try to load from API and sync to local
  try {
    final useCase = ref.watch(getProductsByCategoryUsecaseProvider);
    await useCase(category);
  } catch (e) {
    // If API fails, continue with local data
  }

  // Then watch local database for changes
  await for (final products in repository.watchProductsByCategory(category)) {
    yield products;
  }
}

@riverpod
Stream<ProductEntity> productById(Ref ref, String productId) async* {
  final repository = ref.watch(productRepositoryProvider);

  // First, try to load from API and sync to local
  try {
    final useCase = ref.watch(getProductByIdUsecaseProvider);
    await useCase(productId);
  } catch (e) {
    // If API fails, continue with local data
  }

  // Then watch local database for changes
  await for (final product in repository.watchProductById(productId)) {
    if (product != null) {
      yield product;
    }
  }
}

/// search products usecase
@riverpod
SearchProductsUsecase searchProductsUsecase(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return SearchProductsUsecase(repository);
}

/// search products
@riverpod
Future<ProductResult> searchProducts(Ref ref, String query) async {
  final useCase = ref.watch(searchProductsUsecaseProvider);
  return await useCase(query);
}

/// search controller
@riverpod
class SearchController extends _$SearchController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}

/// search query
@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void setQuery(String query) {
    state = query;
  }

  void clear() {
    state = '';
  }
}

@riverpod
class NameController extends _$NameController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}

@riverpod
class PriceController extends _$PriceController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}

@riverpod
class ImagePathController extends _$ImagePathController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}

@riverpod
class DescriptionController extends _$DescriptionController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}

// @riverpod
// class IngredientsController extends _$IngredientsController {
//   @override
//   List<String> build() {
//     final controller = <String>[];
//     ref.onDispose(() => controller.clear());
//     return controller;
//   }
// }

@riverpod
class IngredientsController extends _$IngredientsController {
  @override
  List<String> build() {
    return <String>[];
  }

  void setIngredients(String csv) {
    final list = csv
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    state = List.unmodifiable(list);
  }

  void clearAll() {
    state = <String>[];
  }
}

enum CategoryEnum { recommended, hottest, popular, newCombo, top }

// @riverpod
// class CategoryController extends _$CategoryController {
//   @override
//   CategoryEnum build() {
//     final controller = CategoryEnum.recommended;
//     state = controller;
//     // ref.onDispose(() => controller.clear());
//     return controller;
//     // return CategoryEnum.recommended;
//   }
// }
@riverpod
class CategoryController extends _$CategoryController {
  @override
  CategoryEnum build() {
    return CategoryEnum.recommended;
  }

  void set(CategoryEnum category) {
    state = category;
  }

  void clearAll() {
    state = CategoryEnum.recommended;
  }
}
