import 'package:food_delivery/features/product/data/models/product_model.dart';
import 'package:food_delivery/gen/assets.gen.dart';

abstract class ProductLocalDataSource {
  List<ProductModel> getProducts();
  ProductModel? getProductById(String id);
  Future<void> updateProduct(ProductModel product);
  // إضافة دالة البحث
  Future<List<ProductModel>> searchProducts(String query);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  // Mock data - يمكن استبدالها بـ SharedPreferences أو Hive لاحقاً
  static final List<ProductModel> _products = [
    ProductModel(
      id: '1',
      name: 'Honey lime combo',
      price: 2000,
      imagePath: Assets.images.food.honeyLimeCombo.path,
      category: 'recommended',
      isFavorite: false,
      description:
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
      ingredients: [
        'Red Quinoa',
        'Lime',
        'Honey',
        'Blueberries',
        'Strawberries',
        'Mango',
        'Fresh mint',
      ],
    ),
    ProductModel(
      id: '2',
      name: 'Berry mango combo',
      price: 8000,
      imagePath: Assets.images.food.berryMangoCombo.path,
      category: 'recommended',
      isFavorite: false,
      description:
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
      ingredients: [
        'Red Quinoa',
        'Lime',
        'Honey',
        'Blueberries',
        'Strawberries',
        'Mango',
        'Fresh mint',
      ],
    ),
    ProductModel(
      id: '3',
      name: 'Quinoa fruit salad',
      price: 2000,
      imagePath: Assets.images.food.quinoaFruitSalad.path,
      category: 'hottest',
      isFavorite: false,
      description:
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
      ingredients: [
        'Red Quinoa',
        'Lime',
        'Honey',
        'Blueberries',
        'Strawberries',
        'Mango',
        'Fresh mint',
      ],
    ),
    ProductModel(
      id: '4',
      name: 'Tropical fruit saladsss',
      price: 10000,
      imagePath: Assets.images.food.tropicalFruitSalad.path,
      category: 'hottest',
      isFavorite: false,
      description:
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
      ingredients: ['Pineapple', 'Mango', 'Papaya', 'Coconut'],
    ),
    ProductModel(
      id: '5',
      name: 'Melon fruit salad',
      price: 10000,
      imagePath: Assets.images.food.melonFruitSalad.path,
      category: 'hottest',
      isFavorite: false,
      description:
          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
      ingredients: ['Watermelon', 'Cantaloupe', 'Honeydew'],
    ),
  ];

  @override
  List<ProductModel> getProducts() {
    return List.from(_products);
  }

  @override
  ProductModel? getProductById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    return _products.where((p) => p.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
