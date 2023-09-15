import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/get_product_bloc/get_product_events.dart';
import 'package:onecart_user_app/blocs/get_product_bloc/get_product_states.dart';
import '../../app_module/app_module.dart';
import '../../data/models/general_data_model/general_category_data.dart';
import '../../data/models/get_product/get_product_model.dart';
import '../../repositories/product_list/product_list_repository.dart';
import '../../utils/varient_index_util.dart';

class GetProductBloc extends Bloc<GetProduct, GetProductStates> {
  final ProductsRepository _productsRepository = getIt<ProductsRepository>();

  GetProductStates get initialState => ProductInitial();

  GetProductBloc() : super(ProductInitial()) {
    on<FetchProduct>(_fetchProducts);
    on<SortByPrice>(_priceFilter);
  }

  FutureOr<void> _fetchProducts(
      FetchProduct event, Emitter<GetProductStates> emit) async {
    emit(FetchProductLoading());
    try {
      GetProductByIdModel getProductListModel =
          await _productsRepository.fetchProducts(event.cateId);
      add(SortByPrice(
          categoryModel: getProductListModel,
          productsList: getProductListModel.products));
    } catch (e) {
      log(e.toString());
      emit(FetchProductError(message: e.toString()));
    }
  }

  FutureOr<void> _priceFilter(
      SortByPrice event, Emitter<GetProductStates> emit) async {
    List<Product> sortedProducts = List.from(event.productsList);
    int passedIndex = VariantIndexUtil().getVariantIndex(event.productsList[0]);

    if (event.sortPrice == null) {
      null;
    } else if (event.sortPrice == true) {
      sortedProducts.sort((a, b) => b.variants[passedIndex].discountedCost
          .compareTo(a.variants[passedIndex].discountedCost));
    } else {
      sortedProducts.sort((a, b) => a.variants[passedIndex].discountedCost
          .compareTo(b.variants[passedIndex].discountedCost));
    }
    emit(FilterPriceLoaded(
        getProductByIdModel: event.categoryModel,
        productsList: sortedProducts,
        sortedValue: event.sortPrice));
  }
}
