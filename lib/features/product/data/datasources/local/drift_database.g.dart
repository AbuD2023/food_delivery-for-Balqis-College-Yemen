// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ingredientsMeta = const VerificationMeta(
    'ingredients',
  );
  @override
  late final GeneratedColumn<String> ingredients = GeneratedColumn<String>(
    'ingredients',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    price,
    imagePath,
    category,
    isFavorite,
    description,
    ingredients,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('ingredients')) {
      context.handle(
        _ingredientsMeta,
        ingredients.isAcceptableOrUnknown(
          data['ingredients']!,
          _ingredientsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      ingredients: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients'],
      ),
    );
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final String id;
  final String name;
  final double price;
  final String imagePath;
  final String category;
  final bool isFavorite;
  final String? description;
  final String? ingredients;
  const ProductData({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.isFavorite,
    this.description,
    this.ingredients,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['image_path'] = Variable<String>(imagePath);
    map['category'] = Variable<String>(category);
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || ingredients != null) {
      map['ingredients'] = Variable<String>(ingredients);
    }
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      imagePath: Value(imagePath),
      category: Value(category),
      isFavorite: Value(isFavorite),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      ingredients: ingredients == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredients),
    );
  }

  factory ProductData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      category: serializer.fromJson<String>(json['category']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      description: serializer.fromJson<String?>(json['description']),
      ingredients: serializer.fromJson<String?>(json['ingredients']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'imagePath': serializer.toJson<String>(imagePath),
      'category': serializer.toJson<String>(category),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'description': serializer.toJson<String?>(description),
      'ingredients': serializer.toJson<String?>(ingredients),
    };
  }

  ProductData copyWith({
    String? id,
    String? name,
    double? price,
    String? imagePath,
    String? category,
    bool? isFavorite,
    Value<String?> description = const Value.absent(),
    Value<String?> ingredients = const Value.absent(),
  }) => ProductData(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price ?? this.price,
    imagePath: imagePath ?? this.imagePath,
    category: category ?? this.category,
    isFavorite: isFavorite ?? this.isFavorite,
    description: description.present ? description.value : this.description,
    ingredients: ingredients.present ? ingredients.value : this.ingredients,
  );
  ProductData copyWithCompanion(ProductCompanion data) {
    return ProductData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      category: data.category.present ? data.category.value : this.category,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      description: data.description.present
          ? data.description.value
          : this.description,
      ingredients: data.ingredients.present
          ? data.ingredients.value
          : this.ingredients,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('imagePath: $imagePath, ')
          ..write('category: $category, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('description: $description, ')
          ..write('ingredients: $ingredients')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    price,
    imagePath,
    category,
    isFavorite,
    description,
    ingredients,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.imagePath == this.imagePath &&
          other.category == this.category &&
          other.isFavorite == this.isFavorite &&
          other.description == this.description &&
          other.ingredients == this.ingredients);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> price;
  final Value<String> imagePath;
  final Value<String> category;
  final Value<bool> isFavorite;
  final Value<String?> description;
  final Value<String?> ingredients;
  final Value<int> rowid;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.category = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.description = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductCompanion.insert({
    required String id,
    required String name,
    required double price,
    required String imagePath,
    required String category,
    this.isFavorite = const Value.absent(),
    this.description = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       price = Value(price),
       imagePath = Value(imagePath),
       category = Value(category);
  static Insertable<ProductData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<String>? imagePath,
    Expression<String>? category,
    Expression<bool>? isFavorite,
    Expression<String>? description,
    Expression<String>? ingredients,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (imagePath != null) 'image_path': imagePath,
      if (category != null) 'category': category,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (description != null) 'description': description,
      if (ingredients != null) 'ingredients': ingredients,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? price,
    Value<String>? imagePath,
    Value<String>? category,
    Value<bool>? isFavorite,
    Value<String?>? description,
    Value<String?>? ingredients,
    Value<int>? rowid,
  }) {
    return ProductCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(ingredients.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('imagePath: $imagePath, ')
          ..write('category: $category, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('description: $description, ')
          ..write('ingredients: $ingredients, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CartTable extends Cart with TableInfo<$CartTable, CartData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [productId, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  CartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartData(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
    );
  }

  @override
  $CartTable createAlias(String alias) {
    return $CartTable(attachedDatabase, alias);
  }
}

class CartData extends DataClass implements Insertable<CartData> {
  final String productId;
  final int quantity;
  const CartData({required this.productId, required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  CartCompanion toCompanion(bool nullToAbsent) {
    return CartCompanion(
      productId: Value(productId),
      quantity: Value(quantity),
    );
  }

  factory CartData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartData(
      productId: serializer.fromJson<String>(json['productId']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  CartData copyWith({String? productId, int? quantity}) => CartData(
    productId: productId ?? this.productId,
    quantity: quantity ?? this.quantity,
  );
  CartData copyWithCompanion(CartCompanion data) {
    return CartData(
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartData(')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartData &&
          other.productId == this.productId &&
          other.quantity == this.quantity);
}

class CartCompanion extends UpdateCompanion<CartData> {
  final Value<String> productId;
  final Value<int> quantity;
  final Value<int> rowid;
  const CartCompanion({
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CartCompanion.insert({
    required String productId,
    required int quantity,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       quantity = Value(quantity);
  static Insertable<CartData> custom({
    Expression<String>? productId,
    Expression<int>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CartCompanion copyWith({
    Value<String>? productId,
    Value<int>? quantity,
    Value<int>? rowid,
  }) {
    return CartCompanion(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartCompanion(')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductTable product = $ProductTable(this);
  late final $CartTable cart = $CartTable(this);
  late final ProductDao productDao = ProductDao(this as AppDatabase);
  late final CartDao cartDao = CartDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [product, cart];
}

typedef $$ProductTableCreateCompanionBuilder =
    ProductCompanion Function({
      required String id,
      required String name,
      required double price,
      required String imagePath,
      required String category,
      Value<bool> isFavorite,
      Value<String?> description,
      Value<String?> ingredients,
      Value<int> rowid,
    });
typedef $$ProductTableUpdateCompanionBuilder =
    ProductCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<double> price,
      Value<String> imagePath,
      Value<String> category,
      Value<bool> isFavorite,
      Value<String?> description,
      Value<String?> ingredients,
      Value<int> rowid,
    });

class $$ProductTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTable> {
  $$ProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTable> {
  $$ProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTable> {
  $$ProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => column,
  );
}

class $$ProductTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductTable,
          ProductData,
          $$ProductTableFilterComposer,
          $$ProductTableOrderingComposer,
          $$ProductTableAnnotationComposer,
          $$ProductTableCreateCompanionBuilder,
          $$ProductTableUpdateCompanionBuilder,
          (
            ProductData,
            BaseReferences<_$AppDatabase, $ProductTable, ProductData>,
          ),
          ProductData,
          PrefetchHooks Function()
        > {
  $$ProductTableTableManager(_$AppDatabase db, $ProductTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductCompanion(
                id: id,
                name: name,
                price: price,
                imagePath: imagePath,
                category: category,
                isFavorite: isFavorite,
                description: description,
                ingredients: ingredients,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required double price,
                required String imagePath,
                required String category,
                Value<bool> isFavorite = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductCompanion.insert(
                id: id,
                name: name,
                price: price,
                imagePath: imagePath,
                category: category,
                isFavorite: isFavorite,
                description: description,
                ingredients: ingredients,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductTable,
      ProductData,
      $$ProductTableFilterComposer,
      $$ProductTableOrderingComposer,
      $$ProductTableAnnotationComposer,
      $$ProductTableCreateCompanionBuilder,
      $$ProductTableUpdateCompanionBuilder,
      (ProductData, BaseReferences<_$AppDatabase, $ProductTable, ProductData>),
      ProductData,
      PrefetchHooks Function()
    >;
typedef $$CartTableCreateCompanionBuilder =
    CartCompanion Function({
      required String productId,
      required int quantity,
      Value<int> rowid,
    });
typedef $$CartTableUpdateCompanionBuilder =
    CartCompanion Function({
      Value<String> productId,
      Value<int> quantity,
      Value<int> rowid,
    });

class $$CartTableFilterComposer extends Composer<_$AppDatabase, $CartTable> {
  $$CartTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CartTableOrderingComposer extends Composer<_$AppDatabase, $CartTable> {
  $$CartTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CartTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartTable> {
  $$CartTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);
}

class $$CartTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CartTable,
          CartData,
          $$CartTableFilterComposer,
          $$CartTableOrderingComposer,
          $$CartTableAnnotationComposer,
          $$CartTableCreateCompanionBuilder,
          $$CartTableUpdateCompanionBuilder,
          (CartData, BaseReferences<_$AppDatabase, $CartTable, CartData>),
          CartData,
          PrefetchHooks Function()
        > {
  $$CartTableTableManager(_$AppDatabase db, $CartTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CartCompanion(
                productId: productId,
                quantity: quantity,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required int quantity,
                Value<int> rowid = const Value.absent(),
              }) => CartCompanion.insert(
                productId: productId,
                quantity: quantity,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CartTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CartTable,
      CartData,
      $$CartTableFilterComposer,
      $$CartTableOrderingComposer,
      $$CartTableAnnotationComposer,
      $$CartTableCreateCompanionBuilder,
      $$CartTableUpdateCompanionBuilder,
      (CartData, BaseReferences<_$AppDatabase, $CartTable, CartData>),
      CartData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db, _db.product);
  $$CartTableTableManager get cart => $$CartTableTableManager(_db, _db.cart);
}
