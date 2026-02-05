import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:offline_first_design/presentation/product/product_provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Consumer<ProductProvider>(
        builder: (_, provider, __) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(provider.error!),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: provider.loadProducts,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (_, index) {
              final product = provider.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text(product.price.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
