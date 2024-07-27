import 'package:bloc/bloc.dart';
import 'package:e_commerce_project/common/commons.dart';
import 'package:e_commerce_project/entry_point.dart';
import 'package:e_commerce_project/notification_service.dart';
import 'package:e_commerce_project/screens/admin/products/models/products_model.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/screens/home/views/views.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductRepository repository = ProductRepository();
  ProductListBloc() : super(const ProductListState()) {
    on<AddProductToProductChartEvent>(_addProductsToChart);
    on<CreatePurchaseEvent>(_createPurchase);
    on<SearchProductEvent>(_searchProduct);
  }
  _addProductsToChart(AddProductToProductChartEvent event, Emitter emit) async {
    List<ProductModel> products = List.from(state.products ?? []);
    products.add(event.product);
    emit(state.copyWith(products: products));
    NotificationService.notify("Produit ajouté au panier",
        textStyle: const TextStyle(color: Colors.green));
    locator<NavigationService>().popUntil(EntryPoint.routeName);
  }

  _createPurchase(CreatePurchaseEvent event, Emitter emit) async {
    var res = await repository.createPurchase(event.purchase);
    if (res == 201) {
      emit(state.copyWith(products: []));
      NotificationService.notify("Achat effectué avec succes",
          textStyle: const TextStyle(color: Colors.green));
      locator<NavigationService>().popUntil(EntryPoint.routeName);
    }
  }

  _searchProduct(SearchProductEvent event, Emitter emit) async {
    var res = await repository.searchProductsByCategory(event.input);
    if (res == 201) {
      emit(state.copyWith(products: []));
      NotificationService.notify("Achat effectué avec succes",
          textStyle: const TextStyle(color: Colors.green));
      locator<NavigationService>().popUntil(EntryPoint.routeName);
    }
  }
}
