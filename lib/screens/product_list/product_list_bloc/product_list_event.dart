part of 'product_list_bloc.dart';

class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class AddProductToProductChartEvent extends ProductListEvent {
  final ProductModel product;
  const AddProductToProductChartEvent({required this.product});
}

class CreatePurchaseEvent extends ProductListEvent {
  final Map<String, dynamic> purchase;
  const CreatePurchaseEvent({required this.purchase});
}

class SearchProductEvent extends ProductListEvent {
  final String input;
  const SearchProductEvent({required this.input});
}
