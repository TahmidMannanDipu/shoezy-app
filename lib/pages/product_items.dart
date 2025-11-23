import 'package:flutter/material.dart';
import 'package:shop_app/pages/product_details.dart';
import 'package:shop_app/widgets/product_card.dart';

import '../data/product_data.dart';

class ProductItems extends StatefulWidget {
  const ProductItems({super.key});

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetails(product: product),
              ),
            );
          },
          child: ProductCard(
            title: product['title'] as String,
            price: product['price'] as String,
            imageUrl: product['imageUrl'] as String,
          ),
        );
      },
    );
  }
}
