class ProductEntity {
  final String id;
  final String name;
  final double price;
  final String imagePath;
  final bool isFavorite;
  final String
  category; // 'hottest', 'popular', 'new combo', 'top', 'recommended'
  final String? description;
  final List<String>? ingredients;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    this.isFavorite = false,
    required this.category,
    this.description,
    this.ingredients,
  });

  ProductEntity copyWith({
    String? id,
    String? name,
    double? price,
    String? imagePath,
    bool? isFavorite,
    String? category,
    String? description,
    List<String>? ingredients,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}
