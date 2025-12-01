import 'package:flutter/material.dart';
import 'package:shop_app/core/theme.dart';

import '../data/product_data.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return Container(
              decoration: BoxDecoration(
                color: appTheme.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(16),
              ),
               child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    cartItem['imageUrl'].toString(),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete_forever, color: Colors.red),
                ),
                title: Text(
                  cartItem['title'].toString(),
                  style: appTheme.textTheme.bodySmall,
                ),
                subtitle: Text(cartItem['sizes'].toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
