import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/category_model.dart';
import '../model/product_model.dart';

class ProduckService {
  ProduckService._init();
  static final ProduckService _instance = ProduckService._init();
  static ProduckService get instance => _instance;

  Future<List<ProductModel>> getAllProducts(BuildContext context) async {
    var assetsString = await DefaultAssetBundle.of(context).loadString("assets/json/products.json");
    return (jsonDecode(assetsString) as List).map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<CategoryModel>> getAllPCategories(BuildContext context) async {
    var assetsString = await DefaultAssetBundle.of(context).loadString("assets/json/categories.json");
    return (jsonDecode(assetsString) as List).map((e) => CategoryModel.fromJson(e)).toList();
  }
}
