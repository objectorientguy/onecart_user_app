import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/image_carousel_slider.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/item_details_section.dart';

import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:share_plus/share_plus.dart';


import '../../blocs/item_details_bloc/item_details_bloc.dart';
import '../../blocs/item_details_bloc/item_details_events.dart';
import '../../blocs/item_details_bloc/item_details_states.dart';

import '../../configs/app_color.dart';

import '../../configs/app_spacing.dart';

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
      appBar: GenericAppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: leftRightMargin),
              child: IconButton(
                onPressed: () {
                  Share.share('https://onecart-8ac19.web.app');
                },
                icon: const Icon(
                  Icons.share,
                  color: AppColor.lightestGrey,
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
