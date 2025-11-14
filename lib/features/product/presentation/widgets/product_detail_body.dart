import 'package:flutter/material.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';

class ProductDetailBody extends StatelessWidget {
  final Product product;
  final int quantity;
  final Function(int) onQuantityChanged;
  final VoidCallback onFavoriteTap;
  final VoidCallback onAddToCart;

  const ProductDetailBody({
    super.key,
    required this.product,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onFavoriteTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = product.price * quantity;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Title
            MyText(
              text: product.name,
              fontSize: 28,
              color: const Color(0xFF2C2C2C),
              isTitle: true,
            ),
            const SizedBox(height: 20),

            // Quantity Selector and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Quantity Selector
                Row(
                  children: [
                    GestureDetector(
                      onTap: quantity > 1
                          ? () => onQuantityChanged(quantity - 1)
                          : null,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: quantity > 1
                                ? const Color(0xFFFFA451)
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: quantity > 1
                              ? const Color(0xFFFFA451)
                              : Colors.grey.shade300,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    MyText(
                      text: quantity.toString(),
                      fontSize: 20,
                      color: const Color(0xFF2C2C2C),
                      isTitle: true,
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => onQuantityChanged(quantity + 1),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFFFA451),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color(0xFFFFA451),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),

                // Price
                MyText(
                  text: '₦ ${totalPrice.toStringAsFixed(0)}',
                  fontSize: 24,
                  color: const Color(0xFF2C2C2C),
                  isTitle: true,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Divider
            Divider(color: Colors.grey.shade200, thickness: 1),
            const SizedBox(height: 24),

            // One Pack Contains
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'One Pack Contains:',
                  fontSize: 18,
                  color: const Color(0xFF2C2C2C),
                  isTitle: true,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 100,
                  height: 3,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFA451),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                if (product.ingredients != null &&
                    product.ingredients!.isNotEmpty)
                  ...product.ingredients!.map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2C2C2C),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          MyText(
                            text: ingredient,
                            fontSize: 16,
                            color: const Color(0xFF2C2C2C),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),

            // Description
            if (product.description != null && product.description!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: product.description!,
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            const SizedBox(height: 40),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Favorite Button
                GestureDetector(
                  onTap: onFavoriteTap,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFFA451),
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: const Color(0xFFFFA451),
                      size: 28,
                    ),
                  ),
                ),

                // Add to Basket Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      onPressed: onAddToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFA451),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Add to basket',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
