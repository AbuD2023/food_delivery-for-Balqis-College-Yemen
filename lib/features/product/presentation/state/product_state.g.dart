// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
const appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  const AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'b3bedcfc13caa79cce9dc5ae8b5094c1253148f6';

@ProviderFor(productLocalDataSource)
const productLocalDataSourceProvider = ProductLocalDataSourceProvider._();

final class ProductLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ProductLocalDataSource,
          ProductLocalDataSource,
          ProductLocalDataSource
        >
    with $Provider<ProductLocalDataSource> {
  const ProductLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ProductLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductLocalDataSource create(Ref ref) {
    return productLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductLocalDataSource>(value),
    );
  }
}

String _$productLocalDataSourceHash() =>
    r'3b33956a61a50feacf9feaa47bce8efd11d7bf98';

@ProviderFor(productRemoteDataSource)
const productRemoteDataSourceProvider = ProductRemoteDataSourceProvider._();

final class ProductRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ProductRemoteDataSource,
          ProductRemoteDataSource,
          ProductRemoteDataSource
        >
    with $Provider<ProductRemoteDataSource> {
  const ProductRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ProductRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRemoteDataSource create(Ref ref) {
    return productRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRemoteDataSource>(value),
    );
  }
}

String _$productRemoteDataSourceHash() =>
    r'daaf0bab03c2bb6e320d28189bbf7bebb0c0e7c8';

@ProviderFor(productRepository)
const productRepositoryProvider = ProductRepositoryProvider._();

final class ProductRepositoryProvider
    extends
        $FunctionalProvider<
          ProductRepository,
          ProductRepository,
          ProductRepository
        >
    with $Provider<ProductRepository> {
  const ProductRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRepository create(Ref ref) {
    return productRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRepository>(value),
    );
  }
}

String _$productRepositoryHash() => r'267ac183f961009b278b9bce1f88a6e838694a8a';

@ProviderFor(getRecommendedProductsUsecase)
const getRecommendedProductsUsecaseProvider =
    GetRecommendedProductsUsecaseProvider._();

final class GetRecommendedProductsUsecaseProvider
    extends
        $FunctionalProvider<
          GetRecommendedProductsUsecase,
          GetRecommendedProductsUsecase,
          GetRecommendedProductsUsecase
        >
    with $Provider<GetRecommendedProductsUsecase> {
  const GetRecommendedProductsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getRecommendedProductsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getRecommendedProductsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetRecommendedProductsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetRecommendedProductsUsecase create(Ref ref) {
    return getRecommendedProductsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetRecommendedProductsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetRecommendedProductsUsecase>(
        value,
      ),
    );
  }
}

String _$getRecommendedProductsUsecaseHash() =>
    r'dab3ee3405425e755d2c8e94a2a33f0fcc784bc7';

@ProviderFor(getProductsByCategoryUsecase)
const getProductsByCategoryUsecaseProvider =
    GetProductsByCategoryUsecaseProvider._();

final class GetProductsByCategoryUsecaseProvider
    extends
        $FunctionalProvider<
          GetProductsByCategoryUsecase,
          GetProductsByCategoryUsecase,
          GetProductsByCategoryUsecase
        >
    with $Provider<GetProductsByCategoryUsecase> {
  const GetProductsByCategoryUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductsByCategoryUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductsByCategoryUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetProductsByCategoryUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductsByCategoryUsecase create(Ref ref) {
    return getProductsByCategoryUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductsByCategoryUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductsByCategoryUsecase>(value),
    );
  }
}

String _$getProductsByCategoryUsecaseHash() =>
    r'7d7765178e03e738da4824fb8fa08ef271318d36';

@ProviderFor(toggleFavoriteUsecase)
const toggleFavoriteUsecaseProvider = ToggleFavoriteUsecaseProvider._();

final class ToggleFavoriteUsecaseProvider
    extends
        $FunctionalProvider<
          ToggleFavoriteUsecase,
          ToggleFavoriteUsecase,
          ToggleFavoriteUsecase
        >
    with $Provider<ToggleFavoriteUsecase> {
  const ToggleFavoriteUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleFavoriteUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleFavoriteUsecaseHash();

  @$internal
  @override
  $ProviderElement<ToggleFavoriteUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ToggleFavoriteUsecase create(Ref ref) {
    return toggleFavoriteUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleFavoriteUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleFavoriteUsecase>(value),
    );
  }
}

String _$toggleFavoriteUsecaseHash() =>
    r'48ba14050e23ab04b467533b723c0fd13ae93046';

@ProviderFor(getProductByIdUsecase)
const getProductByIdUsecaseProvider = GetProductByIdUsecaseProvider._();

final class GetProductByIdUsecaseProvider
    extends
        $FunctionalProvider<
          GetProductByIdUsecase,
          GetProductByIdUsecase,
          GetProductByIdUsecase
        >
    with $Provider<GetProductByIdUsecase> {
  const GetProductByIdUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductByIdUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductByIdUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetProductByIdUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductByIdUsecase create(Ref ref) {
    return getProductByIdUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductByIdUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductByIdUsecase>(value),
    );
  }
}

String _$getProductByIdUsecaseHash() =>
    r'85bfbf538cf2c2f49742ffac5ddd18282b818fc4';

@ProviderFor(recommendedProducts)
const recommendedProductsProvider = RecommendedProductsProvider._();

final class RecommendedProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProductResult>,
          ProductResult,
          Stream<ProductResult>
        >
    with $FutureModifier<ProductResult>, $StreamProvider<ProductResult> {
  const RecommendedProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recommendedProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recommendedProductsHash();

  @$internal
  @override
  $StreamProviderElement<ProductResult> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ProductResult> create(Ref ref) {
    return recommendedProducts(ref);
  }
}

String _$recommendedProductsHash() =>
    r'b49775b09f0c77c3ba1ce49577a119cbb57ce833';

@ProviderFor(productsByCategory)
const productsByCategoryProvider = ProductsByCategoryFamily._();

final class ProductsByCategoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProductResult>,
          ProductResult,
          Stream<ProductResult>
        >
    with $FutureModifier<ProductResult>, $StreamProvider<ProductResult> {
  const ProductsByCategoryProvider._({
    required ProductsByCategoryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productsByCategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productsByCategoryHash();

  @override
  String toString() {
    return r'productsByCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<ProductResult> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ProductResult> create(Ref ref) {
    final argument = this.argument as String;
    return productsByCategory(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsByCategoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productsByCategoryHash() =>
    r'6b2ac63f7609406bcd6d864e03434063455710c5';

final class ProductsByCategoryFamily extends $Family
    with $FunctionalFamilyOverride<Stream<ProductResult>, String> {
  const ProductsByCategoryFamily._()
    : super(
        retry: null,
        name: r'productsByCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductsByCategoryProvider call(String category) =>
      ProductsByCategoryProvider._(argument: category, from: this);

  @override
  String toString() => r'productsByCategoryProvider';
}

@ProviderFor(productById)
const productByIdProvider = ProductByIdFamily._();

final class ProductByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProductEntity>,
          ProductEntity,
          Stream<ProductEntity>
        >
    with $FutureModifier<ProductEntity>, $StreamProvider<ProductEntity> {
  const ProductByIdProvider._({
    required ProductByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productByIdHash();

  @override
  String toString() {
    return r'productByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<ProductEntity> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ProductEntity> create(Ref ref) {
    final argument = this.argument as String;
    return productById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productByIdHash() => r'9a08c8d3150cda22bb1369a7490b1fd2f222a180';

final class ProductByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<ProductEntity>, String> {
  const ProductByIdFamily._()
    : super(
        retry: null,
        name: r'productByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductByIdProvider call(String productId) =>
      ProductByIdProvider._(argument: productId, from: this);

  @override
  String toString() => r'productByIdProvider';
}

/// search products usecase

@ProviderFor(searchProductsUsecase)
const searchProductsUsecaseProvider = SearchProductsUsecaseProvider._();

/// search products usecase

final class SearchProductsUsecaseProvider
    extends
        $FunctionalProvider<
          SearchProductsUsecase,
          SearchProductsUsecase,
          SearchProductsUsecase
        >
    with $Provider<SearchProductsUsecase> {
  /// search products usecase
  const SearchProductsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchProductsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchProductsUsecaseHash();

  @$internal
  @override
  $ProviderElement<SearchProductsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchProductsUsecase create(Ref ref) {
    return searchProductsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchProductsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchProductsUsecase>(value),
    );
  }
}

String _$searchProductsUsecaseHash() =>
    r'eeec4436e7e931f038dfac8fa40787831f2b63fa';

/// search products

@ProviderFor(searchProducts)
const searchProductsProvider = SearchProductsFamily._();

/// search products

final class SearchProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProductResult>,
          ProductResult,
          FutureOr<ProductResult>
        >
    with $FutureModifier<ProductResult>, $FutureProvider<ProductResult> {
  /// search products
  const SearchProductsProvider._({
    required SearchProductsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchProductsHash();

  @override
  String toString() {
    return r'searchProductsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProductResult> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProductResult> create(Ref ref) {
    final argument = this.argument as String;
    return searchProducts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchProductsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchProductsHash() => r'978bc24065740d3c869f9272034c5892081f3276';

/// search products

final class SearchProductsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProductResult>, String> {
  const SearchProductsFamily._()
    : super(
        retry: null,
        name: r'searchProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// search products

  SearchProductsProvider call(String query) =>
      SearchProductsProvider._(argument: query, from: this);

  @override
  String toString() => r'searchProductsProvider';
}

/// search controller

@ProviderFor(SearchController)
const searchControllerProvider = SearchControllerProvider._();

/// search controller
final class SearchControllerProvider
    extends $NotifierProvider<SearchController, TextEditingController> {
  /// search controller
  const SearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchControllerHash();

  @$internal
  @override
  SearchController create() => SearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$searchControllerHash() => r'74893bd351df9942471a9097546dedf64487aafa';

/// search controller

abstract class _$SearchController extends $Notifier<TextEditingController> {
  TextEditingController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TextEditingController, TextEditingController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextEditingController, TextEditingController>,
              TextEditingController,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// search query

@ProviderFor(SearchQuery)
const searchQueryProvider = SearchQueryProvider._();

/// search query
final class SearchQueryProvider extends $NotifierProvider<SearchQuery, String> {
  /// search query
  const SearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchQueryHash();

  @$internal
  @override
  SearchQuery create() => SearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchQueryHash() => r'a2de29f344488b8b351fbfcf9c230f993798b9ea';

/// search query

abstract class _$SearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
