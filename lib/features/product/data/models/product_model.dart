import 'dart:convert';
import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/data/datasources/local/drift_database.dart';
import 'package:drift/drift.dart';

class ProductModel extends ProductEntity {
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
          : json['ingredients'],
    );
  }

  // تحويل من ProductData (Drift) إلى ProductModel
  factory ProductModel.fromProductData(ProductData data) {
    List<String>? ingredientsList;
    if (data.ingredients != null && data.ingredients!.isNotEmpty) {
      try {
        ingredientsList = List<String>.from(json.decode(data.ingredients!));
      } catch (e) {
        // في حالة فشل التحويل، نتركه null
        ingredientsList = null;
      }
    }

    return ProductModel(
      id: data.id,
      name: data.name,
      price: data.price,
      imagePath: data.imagePath,
      isFavorite: data.isFavorite,
      category: data.category,
      description: data.description,
      ingredients: ingredientsList,
    );
  }

  // تحويل إلى ProductCompanion للإدراج/التحديث في Drift
  ProductCompanion toCompanion() {
    return ProductCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      imagePath: Value(imagePath),
      category: Value(category),
      isFavorite: Value(isFavorite),
      description: Value(description),
      ingredients: Value(ingredients != null ? json.encode(ingredients) : null),
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
