import 'package:food_delivery/features/cart/domain/entities/cart_item.dart';
import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';

class GetCartItemsUsecase {
  final CartRepository repository;

  GetCartItemsUsecase(this.repository);

  Future<List<CartItemEntity>> call() async {
    return await repository.getCartItems();
  }
}
