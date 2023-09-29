import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/wishlist_bloc/wishlist_events.dart';
import 'package:onecart_user_app/blocs/wishlist_bloc/wishlist_states.dart';

import '../../app_module/app_module.dart';

import '../../data/models/wishlist/add_wishlist_model.dart';
import '../../data/models/wishlist/delete_wishlist_model.dart';
import '../../data/models/wishlist/view_wishlist_model.dart';
import '../../data/models/wishlist/wishlist_category_model.dart';
import '../../repositories/wishlist/wishlist_repository.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistStates> {
  final ViewWishlistRepository _wishlistRepository =
      getIt<ViewWishlistRepository>();

  WishlistStates get initialState => GetAllWishlistItemsInitial();

  WishlistBloc() : super(GetAllWishlistItemsInitial()) {
    on<GetAllWishlistItems>(_getAllWishlistItems);
    on<AddWishlist>(_addItemsToWishlist);
    on<DeleteWishlist>(_deleteWishlist);
    on<GetWishlistCategory>(_getWishlistCategory);
  }

  FutureOr<void> _getAllWishlistItems(
      GetAllWishlistItems event, Emitter<WishlistStates> emit) async {
    emit(GetAllWishListItemsLoading());
    //try {
      WishlistAllModel wishlistModel =
          await _wishlistRepository.getAllWishlistItems();

      if (wishlistModel.data.all.isNotEmpty) {
        emit(GetAllWishlistItemsLoaded(wishlistModel: wishlistModel));
      }
    // } catch (e) {
    //   emit(GetAllWishListItemsError(message: e.toString()));
    // }
  }

  FutureOr<void> _addItemsToWishlist(
      AddWishlist event, Emitter<WishlistStates> emit) async {
    emit(AddWishlistLoading());

    try {
      Map wishlistDetails = {
        "product_id": event.productId,
        "variant_id": event.variantId,
        "shop_id": 2,
        "user_id": 9898989898,
      };
      AddWishlistModel addWishlistModel =
          await _wishlistRepository.addWishlistItems(wishlistDetails);

      if (addWishlistModel.status == '200') {
        emit(AddWishlistLoaded(
          addWishlistModel: addWishlistModel,
          wishlistDetails: wishlistDetails,
        ));
      } else {
        emit(AddWishlistError(message: addWishlistModel.message));
      }
    } catch (e) {
      emit(AddWishlistError(message: e.toString()));
    }
  }

  FutureOr<void> _deleteWishlist(
      DeleteWishlist event, Emitter<WishlistStates> emit) async {
    emit(DeleteWishlistLoading());
    try {
      DeleteWishlistModel deleteWishlistModel =
          await _wishlistRepository.deleteWishlistItems(event.deleteId);
      emit(DeleteWishlistLoaded(deleteWishlistModel: deleteWishlistModel));
    } catch (e) {
      emit(DeleteWishlistError(message: e.toString()));
    }
  }

  FutureOr<void> _getWishlistCategory(
      GetWishlistCategory event, Emitter<WishlistStates> emit) async {
    emit(GetWishlistCategoryLoading());
    // try {
      WishlistCategoryModel wishlistCategoryModel =
      await _wishlistRepository.wishlistCategoryModel();
      emit(GetWishlistCategoryLoaded(wishlistCategoryModel: wishlistCategoryModel));
    // } catch (e) {
    //   emit(GetWishlistCategoryError(message: e.toString()));
    // }
  }
}
