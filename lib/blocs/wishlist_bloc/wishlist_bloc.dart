import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/wishlist_bloc/wishlist_events.dart';
import 'package:onecart_user_app/blocs/wishlist_bloc/wishlist_states.dart';

import '../../app_module/app_module.dart';

import '../../data/models/wishlist/add_wishlist_model.dart';
import '../../data/models/wishlist/delete_wishlist_model.dart';
import '../../data/models/wishlist/view_wishlist_model.dart';
import '../../repositories/wishlist/wishlist_repository.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistStates> {
  final ViewWishlistRepository _wishlistRepository =
      getIt<ViewWishlistRepository>();

  WishlistStates get initialState => GetAllWishlistItemsInitial();

  WishlistBloc() : super(GetAllWishlistItemsInitial()) {
    on<GetAllWishlistItems>(_getAllWishlistItems);
    on<AddWishlist>(_addItemsToWishlist);
    on<DeleteWishlist>(_deleteWishlist);
  }

  FutureOr<void> _getAllWishlistItems(
      GetAllWishlistItems event, Emitter<WishlistStates> emit) async {
    emit(GetAllWishListItemsLoading());
    // try {
      WishlistModel wishlistModel =
          await _wishlistRepository.getAllWishlistItems();

      if (wishlistModel.data.isNotEmpty) {
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
      log('addMap==============>$wishlistDetails');
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
}
