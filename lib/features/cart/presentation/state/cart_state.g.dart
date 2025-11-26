// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cartLocalDataSource)
const cartLocalDataSourceProvider = CartLocalDataSourceProvider._();

final class CartLocalDataSourceProvider
    extends
        $FunctionalProvider<
          CartLocalDataSource,
          CartLocalDataSource,
          CartLocalDataSource
        >
    with $Provider<CartLocalDataSource> {
  const CartLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<CartLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CartLocalDataSource create(Ref ref) {
    return cartLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartLocalDataSource>(value),
    );
  }
}

String _$cartLocalDataSourceHash() =>
    r'd016916a3fa47bd43b4fada6efe0cd7fcd45fdb5';

@ProviderFor(cartRemoteDataSource)
const cartRemoteDataSourceProvider = CartRemoteDataSourceProvider._();

final class CartRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          CartRemoteDataSource,
          CartRemoteDataSource,
          CartRemoteDataSource
        >
    with $Provider<CartRemoteDataSource> {
  const CartRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<CartRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CartRemoteDataSource create(Ref ref) {
    return cartRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartRemoteDataSource>(value),
    );
  }
}

String _$cartRemoteDataSourceHash() =>
    r'e1610b2d6fc90f169354048e6b4195af274a5598';

@ProviderFor(cartRepository)
const cartRepositoryProvider = CartRepositoryProvider._();

final class CartRepositoryProvider
    extends $FunctionalProvider<CartRepository, CartRepository, CartRepository>
    with $Provider<CartRepository> {
  const CartRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartRepositoryHash();

  @$internal
  @override
  $ProviderElement<CartRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CartRepository create(Ref ref) {
    return cartRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartRepository>(value),
    );
  }
}

String _$cartRepositoryHash() => r'e5e58a9b98bef8073bf99dbf05bafdf03c24faf4';

@ProviderFor(addToCartUsecase)
const addToCartUsecaseProvider = AddToCartUsecaseProvider._();

final class AddToCartUsecaseProvider
    extends
        $FunctionalProvider<
          AddToCartUsecase,
          AddToCartUsecase,
          AddToCartUsecase
        >
    with $Provider<AddToCartUsecase> {
  const AddToCartUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addToCartUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addToCartUsecaseHash();

  @$internal
  @override
  $ProviderElement<AddToCartUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddToCartUsecase create(Ref ref) {
    return addToCartUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddToCartUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddToCartUsecase>(value),
    );
  }
}

String _$addToCartUsecaseHash() => r'53f23b9e3d69f30ea13324816ff83bb0dc21b49b';

@ProviderFor(getCartItemsUsecase)
const getCartItemsUsecaseProvider = GetCartItemsUsecaseProvider._();

final class GetCartItemsUsecaseProvider
    extends
        $FunctionalProvider<
          GetCartItemsUsecase,
          GetCartItemsUsecase,
          GetCartItemsUsecase
        >
    with $Provider<GetCartItemsUsecase> {
  const GetCartItemsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCartItemsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCartItemsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetCartItemsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCartItemsUsecase create(Ref ref) {
    return getCartItemsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCartItemsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCartItemsUsecase>(value),
    );
  }
}

String _$getCartItemsUsecaseHash() =>
    r'e31189c4f43d38f39ad583ed42d5c72e8930bdda';

@ProviderFor(updateCartQuantityUsecase)
const updateCartQuantityUsecaseProvider = UpdateCartQuantityUsecaseProvider._();

final class UpdateCartQuantityUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateCartQuantityUsecase,
          UpdateCartQuantityUsecase,
          UpdateCartQuantityUsecase
        >
    with $Provider<UpdateCartQuantityUsecase> {
  const UpdateCartQuantityUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateCartQuantityUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateCartQuantityUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateCartQuantityUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateCartQuantityUsecase create(Ref ref) {
    return updateCartQuantityUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateCartQuantityUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateCartQuantityUsecase>(value),
    );
  }
}

String _$updateCartQuantityUsecaseHash() =>
    r'a0ecc6140843d0eeb69c723a7a5529b10ac89f28';

@ProviderFor(removeFromCartUsecase)
const removeFromCartUsecaseProvider = RemoveFromCartUsecaseProvider._();

final class RemoveFromCartUsecaseProvider
    extends
        $FunctionalProvider<
          RemoveFromCartUsecase,
          RemoveFromCartUsecase,
          RemoveFromCartUsecase
        >
    with $Provider<RemoveFromCartUsecase> {
  const RemoveFromCartUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'removeFromCartUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$removeFromCartUsecaseHash();

  @$internal
  @override
  $ProviderElement<RemoveFromCartUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RemoveFromCartUsecase create(Ref ref) {
    return removeFromCartUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoveFromCartUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoveFromCartUsecase>(value),
    );
  }
}

String _$removeFromCartUsecaseHash() =>
    r'7284e5f16a815dd1b6ed7fa81ce4f80a50898903';

@ProviderFor(clearCartUsecase)
const clearCartUsecaseProvider = ClearCartUsecaseProvider._();

final class ClearCartUsecaseProvider
    extends
        $FunctionalProvider<
          ClearCartUsecase,
          ClearCartUsecase,
          ClearCartUsecase
        >
    with $Provider<ClearCartUsecase> {
  const ClearCartUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clearCartUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clearCartUsecaseHash();

  @$internal
  @override
  $ProviderElement<ClearCartUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClearCartUsecase create(Ref ref) {
    return clearCartUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClearCartUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClearCartUsecase>(value),
    );
  }
}

String _$clearCartUsecaseHash() => r'238efd8d78a66df7d74681be9a588875e768756a';

@ProviderFor(cartItems)
const cartItemsProvider = CartItemsProvider._();

final class CartItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CartItemEntity>>,
          List<CartItemEntity>,
          FutureOr<List<CartItemEntity>>
        >
    with
        $FutureModifier<List<CartItemEntity>>,
        $FutureProvider<List<CartItemEntity>> {
  const CartItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<CartItemEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CartItemEntity>> create(Ref ref) {
    return cartItems(ref);
  }
}

String _$cartItemsHash() => r'33468c7f5540dcded33bedc78c49cce159edb2be';
