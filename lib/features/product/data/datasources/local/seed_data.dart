import 'package:food_delivery/gen/assets.gen.dart';
import 'drift_database.dart';
import 'package:drift/drift.dart';

/// بيانات أولية للمنتجات
class SeedData {
  /// إرجاع قائمة بالمنتجات الأولية
  static List<ProductCompanion> getInitialProducts() {
    return [
      ProductCompanion.insert(
        id: '1',
        name: 'Honey lime combo',
        price: 2000.0,
        imagePath: Assets.images.food.honeyLimeCombo.path,
        category: 'recommended',
        isFavorite: const Value(false),
        description: const Value(
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
        ),
        ingredients: const Value(
          '["Red Quinoa", "Lime", "Honey", "Blueberries", "Strawberries", "Mango", "Fresh mint"]',
        ),
      ),
      ProductCompanion.insert(
        id: '2',
        name: 'Berry mango combo',
        price: 8000.0,
        imagePath: Assets.images.food.berryMangoCombo.path,
        category: 'recommended',
        isFavorite: const Value(false),
        description: const Value(
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
        ),
        ingredients: const Value(
          '["Red Quinoa", "Lime", "Honey", "Blueberries", "Strawberries", "Mango", "Fresh mint"]',
        ),
      ),
      ProductCompanion.insert(
        id: '3',
        name: 'Quinoa fruit salad',
        price: 2000.0,
        imagePath: Assets.images.food.quinoaFruitSalad.path,
        category: 'hottest',
        isFavorite: const Value(false),
        description: const Value(
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
        ),
        ingredients: const Value(
          '["Red Quinoa", "Lime", "Honey", "Blueberries", "Strawberries", "Mango", "Fresh mint"]',
        ),
      ),
      ProductCompanion.insert(
        id: '4',
        name: 'Tropical fruit salad',
        price: 10000.0,
        imagePath: Assets.images.food.tropicalFruitSalad.path,
        category: 'hottest',
        isFavorite: const Value(false),
        description: const Value(
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
        ),
        ingredients: const Value('["Pineapple", "Mango", "Papaya", "Coconut"]'),
      ),
      ProductCompanion.insert(
        id: '5',
        name: 'Melon fruit salad',
        price: 10000.0,
        imagePath: Assets.images.food.melonFruitSalad.path,
        category: 'hottest',
        isFavorite: const Value(false),
        description: const Value(
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
        ),
        ingredients: const Value('["Watermelon", "Cantaloupe", "Honeydew"]'),
      ),
    ];
  }
}
