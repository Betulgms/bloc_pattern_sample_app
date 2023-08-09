part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState({
    this.isLoading = false,
    this.productCardStatusLoading = false,
    this.categories = const [],
    this.selectedCategory,
    this.products = const [],
  });
  final bool isLoading;
  final bool productCardStatusLoading;
  final List<CategoryModel> categories;
  final CategoryModel? selectedCategory;
  final List<ProductModel> products;

  @override
  List<Object?> get props => [isLoading, productCardStatusLoading, categories, selectedCategory, products];

  ProductState copyWith({
    bool? isLoading,
    bool? productCardStatusLoading,
    List<CategoryModel>? categories,
    CategoryModel? selectedCategory,
    List<ProductModel>? products,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      productCardStatusLoading: productCardStatusLoading ?? this.productCardStatusLoading,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      products: products ?? this.products,
    );
  }
}
