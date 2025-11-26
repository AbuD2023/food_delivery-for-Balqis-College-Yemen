import 'package:food_delivery/features/product/domain/entities/data_source.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';

class ProductResult {
  final List<ProductEntity> products;
  final DataSource source;

  ProductResult({required this.products, required this.source});
}
