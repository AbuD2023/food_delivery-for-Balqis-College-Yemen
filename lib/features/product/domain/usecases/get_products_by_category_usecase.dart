import 'package:food_delivery/features/product/domain/entities/product_result.dart';
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';

class GetProductsByCategoryUsecase {
  final ProductRepository repository;

  GetProductsByCategoryUsecase(this.repository);

  Future<ProductResult> call(String category) async {
    return await repository.getProductsByCategory(category);
  }
}
