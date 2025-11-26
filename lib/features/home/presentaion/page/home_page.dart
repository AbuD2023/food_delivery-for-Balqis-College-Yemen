import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/features/cart/presentation/state/cart_state.dart'
    show addToCartUsecaseProvider, cartItemsProvider;
import 'package:food_delivery/features/home/presentaion/state/home_state.dart'
    show selectedCategoryProvider, categoryProductsProvider;
import 'package:food_delivery/features/home/presentaion/widgets/category_tabs.dart';
import 'package:food_delivery/features/home/presentaion/widgets/home_greeting.dart';
import 'package:food_delivery/features/home/presentaion/widgets/home_search_bar.dart';
import 'package:food_delivery/features/home/presentaion/widgets/product_list_section.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/presentation/state/product_state.dart'
    show
        recommendedProductsProvider,
        productsByCategoryProvider,
        toggleFavoriteUsecaseProvider,
        searchQueryProvider,
        searchProductsProvider;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final recommendedProductsAsync = ref.watch(recommendedProductsProvider);
    final categoryProductsAsync = ref.watch(categoryProductsProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    // إذا كان هناك بحث، اعرض نتائج البحث فقط
    if (searchQuery.isNotEmpty) {
      final searchResultsAsync = ref.watch(searchProductsProvider(searchQuery));
      return Scaffold(
        backgroundColor: Colors.white,
        // drawer: const CustomDrawer(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const HomeHeader(),
              Expanded(
                child: Column(
                  children: [
                    const HomeGreeting(),
                    const HomeSearchBar(),
                    Expanded(
                      child: searchResultsAsync.when(
                        data: (result) => result.products.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search_off,
                                      size: 64,
                                      color: Colors.grey.shade400,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'لا توجد نتائج للبحث',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ProductListSection(
                                title: 'نتائج البحث',
                                products: result.products,
                                dataSource: result.source,
                                onFavoriteTap: (product) =>
                                    _onFavoriteTap(ref, product),
                                onAddToCart: (product) =>
                                    _onAddToCart(context, ref, product),
                              ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, stack) => _buildErrorWidget(error),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // // Header with menu and basket
            // const HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Greeting
                    const HomeGreeting(),

                    // Search Bar
                    const HomeSearchBar(),

                    // Recommended Combo Section
                    recommendedProductsAsync.when(
                      data: (result) => ProductListSection(
                        title: 'Recommended Combo',
                        products: result.products,
                        dataSource: result.source,
                        onFavoriteTap: (product) =>
                            _onFavoriteTap(ref, product),
                        onAddToCart: (product) =>
                            _onAddToCart(context, ref, product),
                      ),
                      loading: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      error: (error, stack) => _buildErrorWidget(
                        error,
                        onRetry: () => _retryRecommendedProducts(ref),
                      ),
                    ),

                    // Category Tabs
                    const CategoryTabs(
                      categories: ['Hottest', 'Popular', 'New combo', 'Top'],
                    ),

                    // Category Products Section
                    categoryProductsAsync.when(
                      data: (result) => ProductListSection(
                        title: selectedCategory,
                        products: result.products,
                        dataSource: result.source,
                        onFavoriteTap: (product) =>
                            _onFavoriteTap(ref, product),
                        onAddToCart: (product) =>
                            _onAddToCart(context, ref, product),
                      ),
                      loading: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      error: (error, stack) => _buildErrorWidget(
                        error,
                        onRetry: () => _retryCategoryProducts(ref),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _retryCategoryProducts(ref);
          // _retryRecommendedProducts(ref);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _onFavoriteTap(WidgetRef ref, ProductEntity product) async {
    try {
      final useCase = ref.read(toggleFavoriteUsecaseProvider);
      await useCase(product.id);
      // Invalidate providers to refresh data
      ref.invalidate(recommendedProductsProvider);
      final selectedCategory = ref.read(selectedCategoryProvider);
      ref.invalidate(
        productsByCategoryProvider(selectedCategory.toLowerCase()),
      );
    } catch (e) {
      // Handle error
      debugPrint('Error toggling favorite: $e');
    }
  }

  void _onAddToCart(
    BuildContext context,
    WidgetRef ref,
    ProductEntity product,
  ) async {
    try {
      final useCase = ref.read(addToCartUsecaseProvider);
      await useCase(product.id, 1); // Add 1 quantity by default
      ref.invalidate(cartItemsProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.name} added to cart'),
            duration: const Duration(seconds: 1),
            backgroundColor: const Color(0xFFFFA451),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error adding to cart: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildErrorWidget(Object error, {VoidCallback? onRetry}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
            const SizedBox(height: 16),
            Text(
              'حدث خطأ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString().replaceAll('Exception: ', ''),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            Text(
              'سيتم استخدام البيانات المحلية',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
                fontStyle: FontStyle.italic,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: const Text(
                  'إعادة التحميل',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA451),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _retryRecommendedProducts(WidgetRef ref) {
    ref.invalidate(recommendedProductsProvider);
  }

  void _retryCategoryProducts(WidgetRef ref) {
    final selectedCategory = ref.read(selectedCategoryProvider);
    ref.invalidate(productsByCategoryProvider(selectedCategory.toLowerCase()));
    ref.invalidate(categoryProductsProvider);
  }
}
