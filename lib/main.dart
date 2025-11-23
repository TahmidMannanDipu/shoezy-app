import 'package:flutter/material.dart';
import 'package:shop_app/data/product_data.dart';
import 'package:shop_app/pages/home_page.dart';
import 'package:shop_app/pages/product_details.dart';

import 'core/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping App",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home : const HomePage(),
    );
  }
}
