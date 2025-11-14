import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';

class ClearCartUsecase {
  final CartRepository repository;

  ClearCartUsecase(this.repository);

  Future<void> call() async {
    return await repository.clearCart();
  }
}
