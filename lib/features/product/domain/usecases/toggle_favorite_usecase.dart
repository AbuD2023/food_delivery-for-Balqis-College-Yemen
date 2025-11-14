import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';

class ToggleFavoriteUsecase {
  final ProductRepository repository;

  ToggleFavoriteUsecase(this.repository);

  Future<Product> call(String productId) async {
    return await repository.toggleFavorite(productId);
  }
}
