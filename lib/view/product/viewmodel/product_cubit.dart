import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category_model.dart';
import '../model/product_model.dart';
import '../service/product_service.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.context) : super(const ProductState(isLoading: true)) {
    _loadData();
  }
  final BuildContext context;
  final _service = ProduckService.instance;
  Future<void> _loadData() async {
    var categoryList = await _service.getAllPCategories(context);
    if (categoryList.isEmpty) {
      emit(state.copyWith(isLoading: false));
    } else {
      var _selectedCategory = categoryList.first;
      var productList = await _service.getAllProducts(context);
      var categoryProductList = productList.where((element) => element.categoryId == _selectedCategory.id).toList();
      emit(state.copyWith(isLoading: false, categories: categoryList, selectedCategory: _selectedCategory, products: categoryProductList));
    }
  }

  Future<void> selectCategory(CategoryModel category) async {
    emit(state.copyWith(selectedCategory: category, productCardStatusLoading: true));
    var productList = await _service.getAllProducts(context);
    await Future.delayed(Duration(seconds: 1));
    var categoryProductList = productList.where((element) => element.categoryId == category.id).toList();
    emit(state.copyWith(productCardStatusLoading: false, products: categoryProductList));
  }
}
