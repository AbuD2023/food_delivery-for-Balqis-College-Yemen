import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class AddProductUsecase {
  final ProductRepository repository;
  AddProductUsecase(this.repository);

  Future<void> call(ProductModel product) async {
    await repository.addProduct(product);
  }
}
