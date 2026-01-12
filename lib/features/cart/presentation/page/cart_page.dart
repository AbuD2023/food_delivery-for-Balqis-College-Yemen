import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/features/cart/presentation/state/cart_state.dart'
    show
        cartItemsProvider,
        clearCartUsecaseProvider,
        removeFromCartUsecaseProvider,
        updateCartQuantityUsecaseProvider;
import 'package:food_delivery/features/cart/presentation/widgets/cart_item_widget.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsAsync = ref.watch(cartItemsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFFA451),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context, ref),
            // Content
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: cartItemsAsync.when(
                  data: (items) {
                    if (items.isEmpty) {
                      return _buildEmptyCart();
                    }
                    return _buildCartContent(context, ref, items);
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF2C2C2C),
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Go back',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Title
          const Expanded(
            child: Text(
              'My Basket',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Clear Cart Button (only show when cart has items)
          Builder(
            builder: (context) {
              final cartItemsAsync = ref.watch(cartItemsProvider);
              return cartItemsAsync.when(
                data: (items) {
                  if (items.isEmpty) {
                    return const SizedBox(width: 56);
                  }
                  return GestureDetector(
                    onTap: () => _showClearCartDialog(context, ref),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha((0.2 * 255).toInt()),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.delete_sweep,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  );
                },
                loading: () => const SizedBox(width: 56),
                error: (_, __) => const SizedBox(width: 56),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_basket_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            'السلة فارغة',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, WidgetRef ref, List items) {
    double total = 0;
    for (var item in items) {
      total += item.totalPrice;
    }

    return Column(
      children: [
        // Cart Items List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final cartItem = items[index];
              return CartItemWidget(
                cartItem: cartItem,
                onRemove: () async {
                  try {
                    final useCase = ref.read(removeFromCartUsecaseProvider);
                    await useCase(cartItem.product.id);
                    ref.invalidate(cartItemsProvider);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${cartItem.product.name} removed'),
                          duration: const Duration(seconds: 1),
                          backgroundColor: const Color(0xFFFFA451),
                        ),
                      );
                    }
                  } catch (e) {
                    debugPrint('Error removing from cart: $e');
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
                onQuantityChanged: (newQuantity) async {
                  try {
                    final useCase = ref.read(updateCartQuantityUsecaseProvider);
                    await useCase(cartItem.product.id, newQuantity);
                    ref.invalidate(cartItemsProvider);
                  } catch (e) {
                    debugPrint('Error updating quantity: $e');
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error updating quantity: $e'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
              );
            },
          ),
        ),
        // Total and Checkout
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  Text(
                    '₦ ${total.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B3A5B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to checkout
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('سيتم الانتقال إلى صفحة الدفع'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFA451),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showClearCartDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تفريغ السلة'),
        content: const Text('هل أنت متأكد من تفريغ السلة بالكامل؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                final useCase = ref.read(clearCartUsecaseProvider);
                await useCase();
                ref.invalidate(cartItemsProvider);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم تفريغ السلة'),
                      duration: Duration(seconds: 1),
                      backgroundColor: Color(0xFFFFA451),
                    ),
                  );
                }
              } catch (e) {
                debugPrint('Error clearing cart: $e');
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
            child: const Text('تفريغ', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
