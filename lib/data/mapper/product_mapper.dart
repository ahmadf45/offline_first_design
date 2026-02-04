import 'dart:developer';

import 'package:offline_first_design/entities/product.dart';

class ProductMapper {
  List<Product> getProducts(List<dynamic> json) {
    inspect(json);
    List<Product> days = [];
    for (var item in (json)) {
      days.add(_getProduct(item));
    }
    return days;
  }

  Product _getProduct(Map<String, dynamic> json) {
    return Product(
      // mapper trying to parsing id from string to int because json-server package always return id as String
      id: json['ids'] is int ? json['ids'] : int.tryParse(json['id']) ?? 0,
      price: json['price'] ?? 0.0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      updatedAt: json['updatedAt'] ?? DateTime.now().toIso8601String(),
    );
  }
}
