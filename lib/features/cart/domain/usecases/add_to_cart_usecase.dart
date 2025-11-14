import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';

class AddToCartUsecase {
  final CartRepository repository;

  AddToCartUsecase(this.repository);

  Future<void> call(String productId, int quantity) async {
    return await repository.addToCart(productId, quantity);
  }
}
