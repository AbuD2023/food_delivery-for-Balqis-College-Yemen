import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';

import '../entities/product_result.dart';

class GetStreamProductsUsecase {
  final ProductRepository repository;

  GetStreamProductsUsecase(this.repository);

  Stream<ProductResult> call() {
    return repository.watchAllTasks();
  }
}
