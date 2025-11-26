import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';

class GetProductByIdUsecase {
  final ProductRepository repository;

  GetProductByIdUsecase(this.repository);

  Future<ProductEntity> call(String productId) async {
    return await repository.getProductById(productId);
  }
}
