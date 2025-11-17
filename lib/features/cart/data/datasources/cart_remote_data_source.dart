import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../core/constants/api_endpoint.dart';
import '../models/cart_item_model.dart';

abstract class CartRemoteDataSource {
  Future<List<CartItemModel>> getCartItems();
  Future<void> addToCart(String productId, int quantity);
  Future<void> updateQuantity(String productId, int quantity);
  Future<void> removeFromCart(String productId);
  Future<void> clearCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  CartRemoteDataSourceImpl({
    required this.client,
    this.baseUrl = ApiEndpoint.baseUrl, // استبدلها بـ API الحقيقي
  });

  @override
  Future<List<CartItemModel>> getCartItems() async {
    try {
      final response = await client
          .get(Uri.parse('$baseUrl/cart'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData
            .map((json) => CartItemModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load cart: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> addToCart(String productId, int quantity) async {
    try {
      final response = await client
          .post(
            Uri.parse('$baseUrl/cart/add'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({'productId': productId, 'quantity': quantity}),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to add to cart: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> updateQuantity(String productId, int quantity) async {
    try {
      final response = await client
          .put(
            Uri.parse('$baseUrl/cart/update'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({'productId': productId, 'quantity': quantity}),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to update quantity: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> removeFromCart(String productId) async {
    try {
      final response = await client
          .delete(Uri.parse('$baseUrl/cart/remove/$productId'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to remove from cart: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      final response = await client
          .delete(Uri.parse('$baseUrl/cart/clear'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to clear cart: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
