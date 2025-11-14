import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../product/domain/entities/product_result.dart';
import '../../../product/presentation/state/product_state.dart'
    show productsByCategoryProvider;

part 'home_state.g.dart';

// Selected Category State
@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  String build() => 'Hottest';

  void setCategory(String category) {
    state = category;
  }
}

// Products by Category Provider (depends on selected category)
@riverpod
Future<ProductResult> categoryProducts(Ref ref) async {
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final category = selectedCategory.toLowerCase();
  // Use .future to get the Future value from the family provider
  return ref.watch(productsByCategoryProvider(category).future);
}
