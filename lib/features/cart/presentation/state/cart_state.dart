import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../product/presentation/state/product_state.dart'
    show
        appDatabaseProvider,
        productLocalDataSourceProvider,
        productRepositoryProvider;
import '../../data/datasources/cart_local_data_source.dart';
import '../../data/datasources/cart_remote_data_source.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_items_usecase.dart';
import '../../domain/usecases/remove_from_cart_usecase.dart';
import '../../domain/usecases/update_cart_quantity_usecase.dart';

part 'cart_state.g.dart';

// Data Source Providers
@riverpod
CartLocalDataSource cartLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  final productDataSource = ref.watch(productLocalDataSourceProvider);
  return CartLocalDataSourceImpl(
    db: db,
    productDataSource: productDataSource,
  );
}

@riverpod
CartRemoteDataSource cartRemoteDataSource(Ref ref) {
  return CartRemoteDataSourceImpl(client: http.Client());
}

// Repository Provider
@riverpod
CartRepository cartRepository(Ref ref) {
  final remoteDataSource = ref.watch(cartRemoteDataSourceProvider);
  final localDataSource = ref.watch(cartLocalDataSourceProvider);
  final productRepository = ref.watch(productRepositoryProvider);
  return CartRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    productRepository: productRepository,
  );
}

// UseCases Providers
@riverpod
AddToCartUsecase addToCartUsecase(Ref ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return AddToCartUsecase(repository);
}

@riverpod
GetCartItemsUsecase getCartItemsUsecase(Ref ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return GetCartItemsUsecase(repository);
}

@riverpod
UpdateCartQuantityUsecase updateCartQuantityUsecase(Ref ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return UpdateCartQuantityUsecase(repository);
}

@riverpod
RemoveFromCartUsecase removeFromCartUsecase(Ref ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return RemoveFromCartUsecase(repository);
}

@riverpod
ClearCartUsecase clearCartUsecase(Ref ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return ClearCartUsecase(repository);
}

// State Providers
@riverpod
Future<List<CartItemEntity>> cartItems(Ref ref) async {
  final useCase = ref.watch(getCartItemsUsecaseProvider);
  return await useCase();
}
