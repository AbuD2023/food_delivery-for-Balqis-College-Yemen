import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';

class RemoveFromCartUsecase {
  final CartRepository repository;

  RemoveFromCartUsecase(this.repository);

  Future<void> call(String productId) async {
    return await repository.removeFromCart(productId);
  }
}
