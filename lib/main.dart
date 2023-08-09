import 'package:bloc_pattern_sample_app/view/product/view/product_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bloc Pattern Sample App',
      debugShowCheckedModeBanner: false,
      home: ProductView(),
    );
  }
}
