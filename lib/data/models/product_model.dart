// data/models/product_model.dart
import 'package:hive_ce/hive.dart';
import 'package:offline_first_design/domain/entities/product.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int price;

  @HiveField(3)
  final String status;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.status,
    required this.description,
    required this.updatedAt,
  });

  // 👇 JSON → Model (API)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      status: json['status'] as String,
      description: json['description'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }

  // 👇 Model → JSON (optional, for sync/upload)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'status': status,
      'description': description,
      'updatedAt': updatedAt,
    };
  }

  Product toEntity() => Product(
    id: id,
    name: name,
    price: price,
    status: status,
    description: description,
    updatedAt: updatedAt,
  );

  factory ProductModel.fromEntity(Product p) => ProductModel(
    id: p.id,
    name: p.name,
    price: p.price,
    status: p.status,
    description: p.description,
    updatedAt: p.updatedAt,
  );
}
