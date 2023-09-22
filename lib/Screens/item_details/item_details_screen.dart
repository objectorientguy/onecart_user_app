import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/cart/cart_screen.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/image_carousel_slider.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/item_details_section.dart';

import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:share_plus/share_plus.dart';

import '../../blocs/item_details_bloc/item_details_bloc.dart';
import '../../blocs/item_details_bloc/item_details_events.dart';
import '../../blocs/item_details_bloc/item_details_states.dart';
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
          FavoriteButton(
            valueChanged: () {
              // context.read<WishlistBloc>().add(AddWishlist(
              //       productId: itemDetails.productId,
              //       variantId: itemDetails.variants[0].variantId,
              //       shopId: 2,
              //       userId: 9898989898,
              //     ));
            },
            iconSize: kFavouriteButton,
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
              padding: const EdgeInsets.only(right: leftRightMargin),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CartScreen()));
                },
                icon: const Icon(
                  Icons.shopping_cart_sharp,
                  color: AppColor.primary,
                ),
              )),
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
