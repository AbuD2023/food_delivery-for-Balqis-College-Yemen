import 'package:flutter/material.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/features/animations/presentation/pages/custom_animated_builder_page.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/presentation/page/product_detail_page.dart';

import '../../../animations/presentation/pages/custom_animated_container.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    this.onFavoriteTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedcontainer(
      isFavorite: product.isFavorite,
      child: Container(
        width: product.isFavorite ? 250 : 200,
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Product Image (Clickable to navigate to detail)
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailPage(productId: product.id),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        product.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            product.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.image_not_supported),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  // Favorite icon
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: onFavoriteTap,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: product.isFavorite
                            ? CustomAnimatedBuilderPage(
                                child: Icon(
                                  product.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: const Color(0xFFFFA451),
                                  size: 18,
                                ),
                              )
                            : Icon(
                                product.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: const Color(0xFFFFA451),
                                size: 18,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Product Name
            MyText(
              text: product.name,
              fontSize: 16,
              color: const Color(0xFF2C2C2C),
              isTitle: true,
            ),
            const SizedBox(height: 6),
            // Price and Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: '₦ ${product.price.toStringAsFixed(0)}',
                  fontSize: 18,
                  color: !product.isFavorite
                      ? const Color(0xFFFFA451)
                      : Colors.white,
                  isTitle: true,
                ),
                GestureDetector(
                  onTap: onAddToCart,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: !product.isFavorite
                          ? const Color(0xFFFFA451)
                          : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFA451).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add,
                      color: product.isFavorite
                          ? const Color(0xFFFFA451)
                          : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
