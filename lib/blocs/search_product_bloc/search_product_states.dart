import '../../data/models/search_product/search_product_model.dart';

abstract class SearchProductStates {}

class SearchProductsInitial extends SearchProductStates {}

class SearchProductsLoading extends SearchProductStates {}

class SearchProductsLoaded extends SearchProductStates {
  final SearchProductModel getSearchProductsList;

  SearchProductsLoaded({required this.getSearchProductsList});
}

class SearchProductsError extends SearchProductStates {
  final String message;

  SearchProductsError({required this.message});
}
