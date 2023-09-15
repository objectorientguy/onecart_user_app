import 'package:equatable/equatable.dart';
import 'package:onecart_user_app/data/models/home/home_model.dart';

import '../../data/models/get_product/get_product_model.dart';

abstract class GetProduct extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProduct extends GetProduct {
  final int cateId;

  FetchProduct({required this.cateId});
}

class SortByPrice extends GetProduct {
  final bool? sortPrice;
  final GetProductByIdModel categoryModel;
  final List<TodaySDeal> productsList;

  SortByPrice(
      {required this.productsList,
      this.sortPrice,
      required this.categoryModel});

  @override
  List<Object?> get props => [sortPrice, productsList];
}
