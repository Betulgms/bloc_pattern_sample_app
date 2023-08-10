import 'package:equatable/equatable.dart';

class ProductDetailState extends Equatable {
  ProductDetailState({required this.amount, required this.price});
  final int amount;
  final double price;

  @override
  // TODO: implement props
  List<Object?> get props => [amount, price];

  ProductDetailState copyWith({
    int? amount,
    double? price,
  }) {
    return ProductDetailState(
      amount: amount ?? this.amount,
      price: price ?? this.price,
    );
  }
}
