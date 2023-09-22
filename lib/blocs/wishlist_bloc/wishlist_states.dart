import '../../data/models/wishlist/view_wishlist_model.dart';

abstract class ViewWishlistStates {}

class GetAllWishlistItemsInitial extends ViewWishlistStates {}

class GetAllWishListItemsLoading extends ViewWishlistStates {}

class GetAllWishlistItemsLoaded extends ViewWishlistStates {
  final WishlistModel wishlistModel;

  GetAllWishlistItemsLoaded({required this.wishlistModel});
}

class GetAllWishListItemsError extends ViewWishlistStates {
  final String message;

  GetAllWishListItemsError({required this.message});
}
