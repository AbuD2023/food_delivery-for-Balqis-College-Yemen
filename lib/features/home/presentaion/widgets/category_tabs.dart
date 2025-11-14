import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/features/home/presentaion/state/home_state.dart'
    show selectedCategoryProvider;

class CategoryTabs extends ConsumerWidget {
  final List<String> categories;

  const CategoryTabs({super.key, required this.categories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return GestureDetector(
            onTap: () {
              ref.read(selectedCategoryProvider.notifier).setCategory(category);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: category,
                    fontSize: 16,
                    color: isSelected
                        ? const Color(0xFF2C2C2C)
                        : Colors.grey.shade400,
                    isTitle: isSelected,
                  ),
                  const SizedBox(height: 8),
                  if (isSelected)
                    Container(
                      width: 30,
                      height: 3,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFA451),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
