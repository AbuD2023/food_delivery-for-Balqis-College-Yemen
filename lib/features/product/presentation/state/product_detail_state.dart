import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_detail_state.g.dart';

// Product Quantity State (per product)
@riverpod
class ProductQuantity extends _$ProductQuantity {
  @override
  int build(String productId) => 1;

  void setQuantity(int quantity) {
    if (quantity >= 1) {
      state = quantity;
    }
  }
}
