import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/search_product_bloc/search_product_events.dart';
import 'package:onecart_user_app/blocs/search_product_bloc/search_product_states.dart';
import '../../app_module/app_module.dart';
import '../../data/models/search_product/search_product_model.dart';
import '../../repositories/search_products/search_products_repository.dart';

class SearchProductsBloc extends Bloc<SearchAllProducts, SearchProductStates> {
  final SearchProductsRepository _searchProductsRepository =
      getIt<SearchProductsRepository>();

  SearchProductStates get initialState => SearchProductsInitial();

  SearchProductsBloc() : super(SearchProductsInitial()) {
    on<SearchAllProducts>(_searchProducts);
  }
  FutureOr<void> _searchProducts(
      SearchAllProducts event, Emitter<SearchProductStates> emit) async {
    emit(SearchProductsLoading());
    try {
      log("Enter in bloc");
      SearchProductModel getSearchProductListModel =
          await _searchProductsRepository.fetchSearchProducts(event.searchTerm);

      emit(SearchProductsLoaded(
          getSearchProductsList: getSearchProductListModel));
    } catch (e) {
      emit(SearchProductsError(message: e.toString()));
    }
  }
}
