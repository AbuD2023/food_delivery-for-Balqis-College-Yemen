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
    r'3e07b7224bc391d20a5afb76a90733e28a3bd90a';

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

@ProviderFor(addProductUsecase)
const addProductUsecaseProvider = AddProductUsecaseProvider._();

final class AddProductUsecaseProvider
    extends
        $FunctionalProvider<
          AddProductUsecase,
          AddProductUsecase,
          AddProductUsecase
        >
    with $Provider<AddProductUsecase> {
  const AddProductUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addProductUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addProductUsecaseHash();

  @$internal
  @override
  $ProviderElement<AddProductUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddProductUsecase create(Ref ref) {
    return addProductUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddProductUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddProductUsecase>(value),
    );
  }
}

String _$addProductUsecaseHash() => r'1c00efa9f6ea6db8c6aa5a5f057f860ee47b8a17';

@ProviderFor(AddProductNotifier)
const addProductProvider = AddProductNotifierProvider._();

final class AddProductNotifierProvider
    extends $NotifierProvider<AddProductNotifier, AsyncValue<bool>> {
  const AddProductNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addProductProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addProductNotifierHash();

  @$internal
  @override
  AddProductNotifier create() => AddProductNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<bool>>(value),
    );
  }
}

String _$addProductNotifierHash() =>
    r'817ddcdf855b5f94e8fb024e2a6f18837618e329';

abstract class _$AddProductNotifier extends $Notifier<AsyncValue<bool>> {
  AsyncValue<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, AsyncValue<bool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, AsyncValue<bool>>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

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
    r'f8c2765b1446169fc297cc4e15e944c8ac0a42d1';

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
    r'b82151b1685953cfbb908098bef44b889d685229';

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

@ProviderFor(NameController)
const nameControllerProvider = NameControllerProvider._();

final class NameControllerProvider
    extends $NotifierProvider<NameController, TextEditingController> {
  const NameControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nameControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nameControllerHash();

  @$internal
  @override
  NameController create() => NameController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$nameControllerHash() => r'e569dcda8d0ae1245f9204c2c11d2d21d808befd';

abstract class _$NameController extends $Notifier<TextEditingController> {
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

@ProviderFor(PriceController)
const priceControllerProvider = PriceControllerProvider._();

final class PriceControllerProvider
    extends $NotifierProvider<PriceController, TextEditingController> {
  const PriceControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'priceControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$priceControllerHash();

  @$internal
  @override
  PriceController create() => PriceController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$priceControllerHash() => r'745a41d05f5051d435b64f94a546b66fbb023bcd';

abstract class _$PriceController extends $Notifier<TextEditingController> {
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

@ProviderFor(ImagePathController)
const imagePathControllerProvider = ImagePathControllerProvider._();

final class ImagePathControllerProvider
    extends $NotifierProvider<ImagePathController, TextEditingController> {
  const ImagePathControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imagePathControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imagePathControllerHash();

  @$internal
  @override
  ImagePathController create() => ImagePathController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$imagePathControllerHash() =>
    r'c435d41838e7c6fcfdf4ac09a778be8e9249395f';

abstract class _$ImagePathController extends $Notifier<TextEditingController> {
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

@ProviderFor(DescriptionController)
const descriptionControllerProvider = DescriptionControllerProvider._();

final class DescriptionControllerProvider
    extends $NotifierProvider<DescriptionController, TextEditingController> {
  const DescriptionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'descriptionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$descriptionControllerHash();

  @$internal
  @override
  DescriptionController create() => DescriptionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$descriptionControllerHash() =>
    r'36ba5093ed4b287ae8d27b3eb7b0b2b375a4d782';

abstract class _$DescriptionController
    extends $Notifier<TextEditingController> {
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

@ProviderFor(IngredientsController)
const ingredientsControllerProvider = IngredientsControllerProvider._();

final class IngredientsControllerProvider
    extends $NotifierProvider<IngredientsController, List<String>> {
  const IngredientsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ingredientsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ingredientsControllerHash();

  @$internal
  @override
  IngredientsController create() => IngredientsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$ingredientsControllerHash() =>
    r'6690a0fe753eb19fa29e6ae8687e43daedac875c';

abstract class _$IngredientsController extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(CategoryController)
const categoryControllerProvider = CategoryControllerProvider._();

final class CategoryControllerProvider
    extends $NotifierProvider<CategoryController, CategoryEnum> {
  const CategoryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryControllerHash();

  @$internal
  @override
  CategoryController create() => CategoryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryEnum value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryEnum>(value),
    );
  }
}

String _$categoryControllerHash() =>
    r'a2f7c24bd9e8df2539c61c76cfe242a3eaf8aeee';

abstract class _$CategoryController extends $Notifier<CategoryEnum> {
  CategoryEnum build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CategoryEnum, CategoryEnum>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoryEnum, CategoryEnum>,
              CategoryEnum,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
