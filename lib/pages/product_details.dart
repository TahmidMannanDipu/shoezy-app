import 'package:flutter/material.dart';
import 'package:shop_app/core/theme.dart';
import 'package:shop_app/data/product_data.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Column(children: [
        Text(
            product['title'] as String,
          style: appTheme.textTheme.displayLarge,

        ),
      ],
      ),
    );
  }
}
