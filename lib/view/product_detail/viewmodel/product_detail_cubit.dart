import 'package:bloc_pattern_sample_app/view/product/model/product_model.dart';
import 'package:bloc_pattern_sample_app/view/product_detail/viewmodel/product_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.productModel) : super(ProductDetailState(amount: 1, price: productModel.price));
  final ProductModel productModel;

  void increment() {
    emit(state.copyWith(amount: state.amount + 1, price: productModel.price * (state.amount + 1)));
  }

  void decrement() {
    if (state.amount > 0) {
      emit(state.copyWith(amount: state.amount - 1, price: productModel.price * (state.amount - 1)));
    }
  }
}
