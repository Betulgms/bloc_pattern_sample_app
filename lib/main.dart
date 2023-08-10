import 'package:bloc_pattern_sample_app/view/product/model/product_model.dart';
import 'package:bloc_pattern_sample_app/view/product/view/product_view.dart';
import 'package:bloc_pattern_sample_app/view/product_detail/view/product_detail_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Pattern Sample App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/product',
      routes: <String, WidgetBuilder>{
        '/product_detail': (BuildContext context) => ProductDetailView(
              productModel: ModalRoute.of(context)!.settings.arguments as ProductModel,
            ),
        '/product': (BuildContext context) => const ProductView(),
      },
    );
  }
}
