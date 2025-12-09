import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../core/constants/api_endpoint.dart';
import '../../../domain/entities/data_source.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/entities/product_result.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getRecommendedProducts();
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<ProductModel> toggleFavorite(String productId, bool isFavorite);
  Future<ProductModel> getProductById(String productId);
  // إضافة دالة البحث
  Future<List<ProductModel>> searchProducts(String query);
  //
  Future<void> addProduct(ProductModel product);

  Stream<ProductResult> watchAllTasks();
  Stream<ProductResult> watchRecommendedProducts();
  Stream<ProductResult> watchProductsByCategory(String category);
  Stream<ProductEntity?> watchProductById(String productId);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  final String baseUrl;
  final FirebaseFirestore firestore;

  ProductRemoteDataSourceImpl({
    required this.client,
    required this.firestore,
    this.baseUrl = ApiEndpoint.baseUrl, // استبدلها بـ API الحقيقي
  });

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await firestore.collection('products').get();
      final products = response.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      if (products.isNotEmpty) {
        return products;
      } else {
        throw Exception('لا توجد منتجات في قاعدة البيانات السحابية');
      }
    } catch (e) {
      try {
        final response = await client
            .get(Uri.parse('$baseUrl/products'))
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final List<dynamic> jsonData = json.decode(response.body);
          return jsonData.map((json) => ProductModel.fromJson(json)).toList();
        } else {
          throw Exception('Failed to load products: ${response.statusCode}');
        }
      } catch (e) {
        throw Exception('Network error: $e');
      }
    }
  }

  @override
  Future<List<ProductModel>> getRecommendedProducts() async {
    try {
      final response = await firestore
          .collection('products')
          .where('category', isEqualTo: 'recommended')
          .get();
      final products = response.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
      if (products.isNotEmpty) {
        return products;
      } else {
        throw Exception('لا توجد منتجات في قاعدة البيانات السحابية');
      }
    } catch (e) {
      try {
        final response = await client
            .get(Uri.parse('$baseUrl/products/recommended'))
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final List<dynamic> jsonData = json.decode(response.body);
          return jsonData.map((json) => ProductModel.fromJson(json)).toList();
        } else {
          throw Exception(
            'Failed to load recommended products: ${response.statusCode}',
          );
        }
      } catch (e) {
        throw Exception('Network error: $e');
      }
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      final response = await firestore
          .collection('products')
          .where('category', isEqualTo: category)
          .get();
      final products = response.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      if (products.isNotEmpty) {
        return products;
      } else {
        throw Exception('لا توجد منتجات في قاعدة البيانات السحابية');
      }
    } catch (e) {
      try {
        final response = await client
            .get(Uri.parse('$baseUrl/products/category/$category'))
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final List<dynamic> jsonData = json.decode(response.body);
          return jsonData.map((json) => ProductModel.fromJson(json)).toList();
        } else {
          throw Exception(
            'Failed to load products by category: ${response.statusCode}',
          );
        }
      } catch (e) {
        throw Exception('Network error: $e');
      }
    }
  }

  @override
  Future<ProductModel> toggleFavorite(String productId, bool isFavorite) async {
    try {
      firestore.collection('products').doc(productId).update({
        'isFavorite': isFavorite,
      });
      final docSnapshot = await firestore
          .collection('products')
          .doc(productId)
          .get();
      final jsonData = json.decode(docSnapshot.data().toString());
      if (jsonData != null) {
        final products = ProductModel.fromJson(jsonData);
        return products;
      } else {
        throw Exception('لا توجد منتجات في قاعدة البيانات السحابية');
      }
    } catch (e) {
      try {
        final response = await client
            .post(Uri.parse('$baseUrl/products/$productId/toggle-favorite'))
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          return ProductModel.fromJson(jsonData);
        } else {
          throw Exception('Failed to toggle favorite: ${response.statusCode}');
        }
      } catch (e) {
        throw Exception('Network error: $e');
      }
    }
  }

  @override
  Future<ProductModel> getProductById(String productId) async {
    try {
      final docSnapshot = await firestore
          .collection('products')
          .doc(productId)
          .get();
      // 3. التأكد إن كانت الوثيقة موجودة
      if (!docSnapshot.exists) {
        throw Exception("Product not found");
      }
      final jsonData = json.decode(docSnapshot.data().toString());
      if (jsonData != null) {
        final products = ProductModel.fromJson(jsonData);
        return products;
      } else {
        throw Exception('لا توجد منتجات في قاعدة البيانات السحابية');
      }
    } catch (e) {
      try {
        final response = await client
            .get(Uri.parse('$baseUrl/products/$productId'))
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          return ProductModel.fromJson(jsonData);
        } else {
          throw Exception('Failed to load product: ${response.statusCode}');
        }
      } catch (e) {
        throw Exception('Network error: $e');
      }
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      if (query.isEmpty) return [];

      // 1. مرجع للكولكشن
      final collection = FirebaseFirestore.instance.collection('products');

      // 2. عملية البحث باستخدام range query
      final snapshot = await collection
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThan: '${query}z')
          .get();

      // 3. تحويل النتائج إلى List<ProductModel>
      return snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      try {
        final response = await client.get(
          Uri.parse('$baseUrl/products/search?q=$query'),
        );
        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          return data.map((json) => ProductModel.fromJson(json)).toList();
        } else {
          throw Exception('Failed to search products: ${response.statusCode}');
        }
      } catch (e) {
        throw Exception('Network error: $e');
      }
    }
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    try {
      await firestore
          .collection('products')
          .doc(product.id)
          .set(product.toJson());
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }

  @override
  Stream<ProductResult> watchAllTasks() {
    return firestore.collection('products').snapshots().map((snapshot) {
      return ProductResult(
        products: snapshot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList(),
        source: DataSource.remote,
      );
    });
  }

  @override
  Stream<ProductResult> watchRecommendedProducts() {
    try {
      final data = firestore
          .collection('products')
          .where('category', isEqualTo: 'recommended')
          .snapshots()
          .map((snapshot) {
            return ProductResult(
              products: snapshot.docs
                  .map((doc) => ProductModel.fromJson(doc.data()))
                  .toList(),
              source: DataSource.remote,
            );
          });
      data.listen((event) {
        if (event.products.isEmpty) {
          throw Exception('Failed to watchRecommendedProducts');
        } else {}
      });
      return data;
    } catch (e) {
      throw Exception('Failed to watchRecommendedProducts: $e');
    }
  }

  @override
  Stream<ProductResult> watchProductsByCategory(String category) {
    try {
      final data = firestore
          .collection('products')
          .where('category', isEqualTo: category)
          .snapshots()
          .map((snapshot) {
            return ProductResult(
              products: snapshot.docs
                  .map((doc) => ProductModel.fromJson(doc.data()))
                  .toList(),
              source: DataSource.remote,
            );
          });
      data.listen((event) {
        if (event.products.isEmpty) {
          throw Exception('Failed to watchRecommendedProducts');
        } else {}
      });
      return data;
    } catch (e) {
      throw Exception('Failed to watchRecommendedProducts: $e');
    }
  }

  @override
  Stream<ProductEntity?> watchProductById(String productId) {
    try {
      final data = firestore
          .collection('products')
          .doc(productId)
          .snapshots()
          .map((docSnapshot) {
            if (docSnapshot.exists) {
              return ProductModel.fromJson(docSnapshot.data()!);
            } else {
              return null;
            }
          });
      data.listen((event) {
        if (event == null) {
          throw Exception('Failed to watchRecommendedProducts');
        } else {}
      });
      return data;
    } catch (e) {
      throw Exception('Failed to watchRecommendedProducts: $e');
    }
  }
}
