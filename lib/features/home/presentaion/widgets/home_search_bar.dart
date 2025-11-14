import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';

import '../../../../core/constants/app_them.dart';
import '../../../../core/widgets/custom_text_fild.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomTextFild(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  fillColor: AppTheme.shadow.withOpacity(0.02),
                  hintText: 'Search for fruit salad combos',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      Assets.icons.listSarch.path,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.tune, color: const Color(0xFF2C2C2C), size: 24),
          ),
        ],
      ),
    );
  }
}
