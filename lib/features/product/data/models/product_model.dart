import 'package:food_delivery/features/product/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.imagePath,
    super.isFavorite = false,
    required super.category,
    super.description,
    super.ingredients,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
      category: json['category'] as String,
      description: json['description'] as String?,
      ingredients: json['ingredients'] != null
          ? List<String>.from(json['ingredients'] as List)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imagePath': imagePath,
      'isFavorite': isFavorite,
      'category': category,
      'description': description,
      'ingredients': ingredients,
    };
  }
}
