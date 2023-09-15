import 'package:equatable/equatable.dart';

import '../../data/models/get_product/get_product_model.dart';
import '../../data/models/home/home_model.dart';

abstract class GetProductStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends GetProductStates {}

class FetchProductLoading extends GetProductStates {}

class FetchProductLoaded extends GetProductStates {
  final GetProductByIdModel getProductByIdModel;

  FetchProductLoaded({required this.getProductByIdModel});
}

class FilterPriceLoaded extends GetProductStates {
  final GetProductByIdModel getProductByIdModel;
  final List<Product> productsList;
  final bool? sortedValue;

  FilterPriceLoaded(
      {required this.productsList,
      required this.getProductByIdModel,
      this.sortedValue});

  @override
  List<Object?> get props => [productsList, sortedValue];
}

class FetchProductError extends GetProductStates {
  final String message;

  FetchProductError({required this.message});
}
