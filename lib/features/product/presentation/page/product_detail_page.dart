import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/features/animations/presentation/pages/custom_explicit_animation_page.dart';
import 'package:food_delivery/features/cart/presentation/state/cart_state.dart'
    show addToCartUsecaseProvider, cartItemsProvider;
import 'package:food_delivery/features/product/presentation/state/product_detail_state.dart'
    show productQuantityProvider;
import 'package:food_delivery/features/product/presentation/state/product_state.dart'
    show productByIdProvider, toggleFavoriteUsecaseProvider;
import 'package:food_delivery/features/product/presentation/widgets/product_detail_body.dart';
import 'package:food_delivery/features/product/presentation/widgets/product_detail_header.dart';

class ProductDetailPage extends ConsumerWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productByIdProvider(productId));
    final quantity = ref.watch(productQuantityProvider(productId));

    return Scaffold(
      backgroundColor: const Color(0xFFFFA451),
      body: SafeArea(
        child: productAsync.when(
          data: (product) => Column(
            children: [
              // Header with back button
              CustomExplicitAnimationPage(
                child: ProductDetailHeader(
                  product: product,
                  onBack: () => Navigator.of(context).pop(),
                ),
              ),

              // Body with product details
              Expanded(
                child: ProductDetailBody(
                  product: product,
                  quantity: quantity,
                  onQuantityChanged: (newQuantity) {
                    ref
                        .read(productQuantityProvider(productId).notifier)
                        .setQuantity(newQuantity);
                  },
                  onFavoriteTap: () async {
                    try {
                      final useCase = ref.read(toggleFavoriteUsecaseProvider);
                      await useCase(product.id);
                      // لا حاجة لـ refresh - Streams ستحدث تلقائياً من قاعدة البيانات
                    } catch (e) {
                      debugPrint('Error toggling favorite: $e');
                    }
                  },
                  onAddToCart: () async {
                    try {
                      final useCase = ref.read(addToCartUsecaseProvider);
                      await useCase(product.id, quantity);
                      ref.invalidate(cartItemsProvider);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${product.name} (x$quantity) added to cart',
                            ),
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
                  },
                ),
              ),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.white),
                const SizedBox(height: 16),
                Text(
                  'Error loading product',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    ref.invalidate(productByIdProvider(productId));
                  },
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const Text(
                    'Retry',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
