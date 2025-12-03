import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/theme.dart';
import 'package:shop_app/state/cart_provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                    onPressed: () {
                      showDialog(context: context,
                          builder: (context) {
                        return SizedBox(
                          height: 150,
                          width: 300,
                          child: Dialog(

                            child: Column(

                              children: [
                                Text("Are you sure?",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    TextButton(onPressed: () {
                                      Navigator.pop(context);
                                    },
                                        child: Text("Cancel"),),
                                    const SizedBox(width: 8,),
                                    ElevatedButton(onPressed: (){},
                                      style: ButtonStyle(
                                        backgroundColor:const WidgetStatePropertyAll(Colors.red),
                                        foregroundColor: const WidgetStatePropertyAll(Colors.white),
                                      ),
                                        child: Text("Yes,Delete"),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                          });
                    },
                    icon: Icon(Icons.delete_forever, color: Colors.red),
                  ),
                  title: Text(
                    cartItem['title'].toString(),
                    style: appTheme.textTheme.bodySmall,
                  ),
                  subtitle: Text(cartItem['sizes'].toString()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
