import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../../../blocs/wishlist_bloc/wishlist_events.dart';
import '../../../configs/app_color.dart';

class FavouriteIconWidget extends StatefulWidget {
  final int productId;
  final int variantId;

  const FavouriteIconWidget(
      {super.key, required this.productId, required this.variantId});

  @override
  State<FavouriteIconWidget> createState() => _FavouriteIconWidgetState();
}

class _FavouriteIconWidgetState extends State<FavouriteIconWidget> {
  bool isFavouriteTapped = false;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (isFavouriteTapped == false) {
            context.read<WishlistBloc>().add(AddWishlist(
                  productId: widget.productId,
                  variantId: widget.variantId,
                ));
          }

          isFavouriteTapped = !isFavouriteTapped;
        },
        icon: (isFavouriteTapped == true)
            ? const Icon(
                Icons.favorite,
                color: AppColor.primary,
          // fill: AppColor.primaryLight,
              )
            : const Icon(
                Icons.favorite_border_outlined,
                color: AppColor.primary,
              ));
  }
}
