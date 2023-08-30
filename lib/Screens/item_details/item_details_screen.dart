import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/image_carousel_slider.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/item_details_section.dart';

import 'package:onecart_user_app/common_widgets/custom_elevated_button.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../blocs/item_details_bloc/item_details_bloc.dart';
import '../../blocs/item_details_bloc/item_details_events.dart';
import '../../blocs/item_details_bloc/item_details_states.dart';

import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';
import '../cart/cart_screen.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const routeName = 'ItemDetailsScreen';
  final dynamic itemDetails;

  const ItemDetailsScreen({Key? key, required this.itemDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<ItemDetailsBloc>()
        .add(FetchItemDetails(itemDetails.productId!));
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: 12),
        child: CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName,
                  arguments: false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('₹8900 ',
                        style: Theme.of(context).textTheme.textButtonLarger),
                    Text('| 23 ITEMS',
                        style: Theme.of(context).textTheme.textButtonLarge)
                  ],
                ),
                const Row(
                  children: [
                    Text('SEE CART'),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                )
              ],
            )),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                color: AppColor.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColor.black,
              )),
        ],
        titleSpacing: xxxTiniestSpacing,
      ),
      body: BlocBuilder<ItemDetailsBloc, ItemDetailsStates>(
        builder: (context, state) {
          if (state is ItemDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemDetailsLoaded) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ImageCarouselSlider(
                    imageList: state.itemDetailsModel.data!.image!,
                  ),
                  ItemDetailsSection(itemData: state.itemDetailsModel.data!),
                ],
              ),
            );
          }
          if (state is ItemDetailsError) {
            return Container();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
