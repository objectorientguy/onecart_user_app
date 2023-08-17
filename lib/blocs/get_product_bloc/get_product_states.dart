import 'package:equatable/equatable.dart';

import '../../data/models/get_product/get_product_model.dart';


abstract class GetProductStates extends Equatable {}

class FetchProductLoading extends GetProductStates {
  @override
  List<Object?> get props => [];
}

class FetchProductLoaded extends GetProductStates {
  final GetProductByIdModel getProductByIdModel;

  FetchProductLoaded({required this.getProductByIdModel});

  @override
  List<Object?> get props => [];
}

class FetchProductError extends GetProductStates {
  final String message;

  FetchProductError({required this.message});

  @override
  List<Object?> get props => [];
}
