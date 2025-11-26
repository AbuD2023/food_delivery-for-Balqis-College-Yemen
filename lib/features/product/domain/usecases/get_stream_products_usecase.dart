import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';

class GetStreamProductsUsecase {
  final ProductRepository repository;

  GetStreamProductsUsecase(this.repository);

  Stream<List<ProductEntity>> call() {
    return repository.watchAllTasks();
  }
}
