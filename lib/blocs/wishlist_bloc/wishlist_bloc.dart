import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/wishlist_bloc/wishlist_events.dart';
import 'package:onecart_user_app/blocs/wishlist_bloc/wishlist_states.dart';

import '../../app_module/app_module.dart';
import '../../data/models/wishlist/view_wishlist_model.dart';
import '../../repositories/wishlist/wishlist_repository.dart';

class GetAllWishlistItemsBloc
    extends Bloc<GetAllWishlistItems, ViewWishlistStates> {
  final ViewWishlistRepository _viewWishlistRepository =
      getIt<ViewWishlistRepository>();

  ViewWishlistStates get initialState => GetAllWishlistItemsInitial();

  GetAllWishlistItemsBloc() : super(GetAllWishlistItemsInitial()) {
    on<GetAllWishlistItems>(_getAllWishlistItems);
  }

  FutureOr<void> _getAllWishlistItems(
      GetAllWishlistItems event, Emitter<ViewWishlistStates> emit) async {
    emit(GetAllWishListItemsLoading());
    //try {
    WishlistModel wishlistModel =
        await _viewWishlistRepository.getAllWishlistItems();

    emit(GetAllWishlistItemsLoaded(wishlistModel: wishlistModel));
    // } catch (e) {
    //   emit(GetAllWishListItemsError(message: e.toString()));
    // }
  }
}
