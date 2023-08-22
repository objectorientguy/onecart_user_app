import '../../data/models/get_product/get_product_model.dart';

abstract class GetProductStates {}

class ProductInitial extends GetProductStates {}

class FetchProductLoading extends GetProductStates {}

class FetchProductLoaded extends GetProductStates {
  final GetProductByIdModel getProductByIdModel;

  FetchProductLoaded({required this.getProductByIdModel});
}

class FetchProductError extends GetProductStates {
  final String message;

  FetchProductError({required this.message});
}
