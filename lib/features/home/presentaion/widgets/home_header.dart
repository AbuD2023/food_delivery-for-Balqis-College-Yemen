import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/features/cart/presentation/page/cart_page.dart';
import 'package:food_delivery/gen/assets.gen.dart';

class HomeHeader extends ConsumerWidget {
  final Widget? hamburgerMenu;
  const HomeHeader({super.key, this.hamburgerMenu});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Hamburger menu
            hamburgerMenu ??
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(
                    Assets.icons.drawer.path,
                    width: 24,
                    height: 24,
                  ),
                ),
            // Shopping basket
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    Assets.icons.faShoppingBasket.path,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(height: 4),
                  MyText(
                    text: 'My basket',
                    fontSize: 12,
                    color: const Color(0xFF2C2C2C),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
