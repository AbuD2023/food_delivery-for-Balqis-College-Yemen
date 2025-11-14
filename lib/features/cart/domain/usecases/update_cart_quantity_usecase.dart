import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';

class UpdateCartQuantityUsecase {
  final CartRepository repository;

  UpdateCartQuantityUsecase(this.repository);

  Future<void> call(String productId, int quantity) async {
    return await repository.updateQuantity(productId, quantity);
  }
}
