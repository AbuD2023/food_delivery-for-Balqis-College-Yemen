import 'package:flutter/material.dart';
import 'package:food_delivery/features/product/domain/entities/data_source.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/presentation/widgets/product_card.dart';

class ProductListSection extends StatelessWidget {
  final String title;
  final List<Product> products;
  final DataSource? dataSource;
  final Function(Product)? onFavoriteTap;
  final Function(Product)? onAddToCart;

  const ProductListSection({
    super.key,
    required this.title,
    required this.products,
    this.dataSource,
    this.onFavoriteTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                ),
              ),
              if (dataSource != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: dataSource!.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: dataSource!.color.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        dataSource!.icon,
                        size: 16,
                        color: dataSource!.color,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        dataSource!.displayName,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: dataSource!.color,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: products.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 48,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'لا توجد منتجات متاحة',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                      onFavoriteTap: () {
                        if (onFavoriteTap != null) {
                          onFavoriteTap!(product);
                        }
                      },
                      onAddToCart: () {
                        if (onAddToCart != null) {
                          onAddToCart!(product);
                        }
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
