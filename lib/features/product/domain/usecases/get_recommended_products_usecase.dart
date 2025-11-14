import 'package:food_delivery/features/product/domain/entities/product_result.dart';
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';

class GetRecommendedProductsUsecase {
  final ProductRepository repository;

  GetRecommendedProductsUsecase(this.repository);

  Future<ProductResult> call() async {
    return await repository.getRecommendedProducts();
  }
}
