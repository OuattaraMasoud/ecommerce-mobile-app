part of 'product_list_bloc.dart';

class ProductListState extends Equatable {
  final List<ProductModel>? products;
  const ProductListState({this.products});

  ProductListState copyWith({
    List<ProductModel>? products,
  }) {
    return ProductListState(
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [products];
}
