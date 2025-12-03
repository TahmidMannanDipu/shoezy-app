import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/core/theme.dart';
import 'package:shop_app/data/product_data.dart';
import '../state/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void addToCart() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'sizes': selectedSize,
        'company': widget.product['company'],
        'imageUrl': widget.product['imageUrl'],
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please select shoe size")));
    }
  }

  int selectedSize = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: appTheme.textTheme.displayLarge,
          ),
          const Spacer(),
          Image.network(widget.product['imageUrl'] as String),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(color: appTheme.colorScheme.surface),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${widget.product['price']}',
                    style: appTheme.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedSize == size) {
                                  selectedSize = 0;
                                } else {
                                  selectedSize = size;
                                }
                              });
                            },

                            child: Chip(
                              label: Text(
                                size.toString(),
                                style: TextStyle(
                                  color: selectedSize == size
                                      ? appTheme.colorScheme.onPrimary
                                      : null,
                                ),
                              ),
                              backgroundColor: selectedSize == size
                                  ? appTheme.colorScheme.primary
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),

                  ElevatedButton.icon(
                    onPressed: () {
                      if(selectedSize !=0) {
                        addToCart();
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Added to Cart',
                        style: TextStyle(
                          color: appTheme.colorScheme.onPrimary,
                        ),
                        ),

                        backgroundColor: appTheme.colorScheme.primary,));
                      }
                      else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('select show size'),
                        backgroundColor: Colors.red,
                        ),

                        );
                      }
                    },
                    label: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(Icons.add_shopping_cart_outlined, size: 20),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        appTheme.colorScheme.primary,
                      ),
                      foregroundColor: WidgetStatePropertyAll(
                        appTheme.colorScheme.onPrimary,
                      ),
                      fixedSize: WidgetStatePropertyAll(
                        Size(double.maxFinite, 50),
                      ),
                    ),
                  ),
                  // Text(product['sizes']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
