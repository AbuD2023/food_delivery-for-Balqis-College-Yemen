import 'package:food_delivery/features/product/domain/entities/product_result.dart';
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';
import 'package:food_delivery/features/product/domain/entities/data_source.dart';

class SearchProductsUsecase {
  final ProductRepository repository;

  SearchProductsUsecase(this.repository);

  Future<ProductResult> call(String query) async {
    if (query.trim().isEmpty) {
      return ProductResult(products: [], source: DataSource.local);
    }
    return await repository.searchProducts(query);
  }
}
