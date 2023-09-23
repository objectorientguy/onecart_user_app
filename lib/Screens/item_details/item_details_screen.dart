import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/cart/cart_screen.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/image_carousel_slider.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/item_details_section.dart';

import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:share_plus/share_plus.dart';

import '../../blocs/item_details_bloc/item_details_bloc.dart';
import '../../blocs/item_details_bloc/item_details_events.dart';
import '../../blocs/item_details_bloc/item_details_states.dart';
import '../../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../../blocs/wishlist_bloc/wishlist_events.dart';
import '../../configs/app_color.dart';

import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../data/models/general_data_model/general_category_data.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const routeName = 'ItemDetailsScreen';
  final Product itemDetails;

  const ItemDetailsScreen({Key? key, required this.itemDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<ItemDetailsBloc>()
        .add(FetchItemDetails(itemDetails.productId));
    return Scaffold(
      appBar: GenericAppBar(
        actions: [
          InkWell(
            onTap: () {
              context.read<WishlistBloc>().add(AddWishlist(
                    productId: itemDetails.productId,
                    variantId: itemDetails.variants[0].variantId,
                  ));
            },
            child: FavoriteButton(
              valueChanged: () {},
              iconSize: kFavouriteButton,
            ),
          ),
          const SizedBox(
            width: xxxTinierSpacing,
          ),
          IconButton(
            onPressed: () {
              Share.share('https://onecart-8ac19.web.app');
            },
            icon: const Icon(
              Icons.share,
              color: AppColor.primary,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: kZero, right: xxxTinierSpacing),
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart_sharp,
                      color: AppColor.primary,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                    },
                  ),
                  BlocBuilder<ItemDetailsBloc, ItemDetailsStates>(
                      builder: (context, state) {
                    if (state is ItemDetailsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ItemDetailsLoaded) {
                      return Positioned(
                        left: smallestSpacing,
                        child: Container(
                          height: kContainerHeight,
                          width: kSmallWidth,
                          decoration: const BoxDecoration(
                            color: AppColor.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(xxxTiniestSpacing),
                              child: Text(
                                  state.productDetailsModel.data.items
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxxTinier
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.white)),
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is ItemDetailsError) {
                      return Container();
                    } else {
                      return const SizedBox();
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ItemDetailsBloc, ItemDetailsStates>(
          builder: (context, state) {
        if (state is ItemDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ItemDetailsLoaded) {
          return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                ImageCarouselSlider(
                  imageList: state.productDetailsModel.data.productData
                      .variants[state.variantIndex].image,
                ),
                ItemDetailsSection(
                  productDetailsModel: state.productDetailsModel,
                  variantIndex: state.variantIndex,
                )
              ]));
        }
        if (state is ItemDetailsError) {
          return Container();
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
