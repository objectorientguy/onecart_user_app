import '../../data/models/wishlist/add_wishlist_model.dart';
import '../../data/models/wishlist/delete_wishlist_model.dart';
import '../../data/models/wishlist/view_wishlist_model.dart';
import '../../data/models/wishlist/wishlist_category_model.dart';

abstract class WishlistStates {}

class GetAllWishlistItemsInitial extends WishlistStates {}

class GetAllWishListItemsLoading extends WishlistStates {}

class GetAllWishlistItemsLoaded extends WishlistStates {
  final WishlistAllModel wishlistModel;

  GetAllWishlistItemsLoaded({required this.wishlistModel});
}

class GetAllWishListItemsError extends WishlistStates {
  final String message;

  GetAllWishListItemsError({required this.message});
}

class AddWishlistLoading extends WishlistStates {}

class AddWishlistLoaded extends WishlistStates {
  final AddWishlistModel addWishlistModel;
  final Map wishlistDetails;

  AddWishlistLoaded(
      {required this.wishlistDetails, required this.addWishlistModel});
}

class AddWishlistError extends WishlistStates {
  final String message;

  AddWishlistError({required this.message});
}

class DeleteWishlistLoading extends WishlistStates {}

class DeleteWishlistLoaded extends WishlistStates {
  final DeleteWishlistModel deleteWishlistModel;

  DeleteWishlistLoaded({required this.deleteWishlistModel});
}

class DeleteWishlistError extends WishlistStates {
  final String message;

  DeleteWishlistError({required this.message});
}

class GetWishlistCategoryLoading extends WishlistStates {}

class GetWishlistCategoryLoaded extends WishlistStates {
  final WishlistCategoryModel wishlistCategoryModel;

  GetWishlistCategoryLoaded({required this.wishlistCategoryModel});
}

class GetWishlistCategoryError extends WishlistStates {
  final String message;

  GetWishlistCategoryError({required this.message});
}
