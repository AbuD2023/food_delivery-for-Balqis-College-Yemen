import 'package:flutter/material.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemEntity cartItem;
  final VoidCallback? onRemove;
  final Function(int)? onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    this.onRemove,
    this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              cartItem.product.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  cartItem.product.imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported, size: 100),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                const SizedBox(height: 8),
                // Quantity Selector
                Row(
                  children: [
                    // Decrease Button
                    GestureDetector(
                      onTap: () {
                        if (cartItem.quantity > 1 &&
                            onQuantityChanged != null) {
                          onQuantityChanged!(cartItem.quantity - 1);
                        }
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: cartItem.quantity > 1
                              ? const Color(0xFFFFA451).withAlpha((0.12 * 255).toInt())
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 16,
                          color: cartItem.quantity > 1
                              ? const Color(0xFFFFA451)
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Quantity Display
                    Text(
                      '${cartItem.quantity}packs',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Increase Button
                    GestureDetector(
                      onTap: () {
                        if (onQuantityChanged != null) {
                          onQuantityChanged!(cartItem.quantity + 1);
                        }
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFA451).withAlpha((0.12 * 255).toInt()),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 16,
                          color: Color(0xFFFFA451),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Price and Delete Button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Delete Button
              if (onRemove != null)
                GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      size: 18,
                      color: Colors.red.shade400,
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              // Price
              Text(
                '₦ ${cartItem.totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B3A5B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
