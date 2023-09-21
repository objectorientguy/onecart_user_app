import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../blocs/add_cart_item_bloc/add_cart_item_bloc.dart';
import '../../../blocs/add_cart_item_bloc/add_cart_item_states.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/item_details/item_details_model.dart';
import '../../../utils/snackbar_util.dart';
import '../../../widgets/progress_bar.dart';
import '../../home/widgets/counter_widget.dart';

class ItemDetailsPrice extends StatelessWidget {
  final ProductDetailsModel productDetailsModel;
  final int variantIndex;

  const ItemDetailsPrice(
      {super.key,
      required this.productDetailsModel,
      required this.variantIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '₹${productDetailsModel.data.productData.variants[variantIndex].discountedCost.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .xxxTiny
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: xxxTinierSpacing),
            Text(
              '₹${productDetailsModel.data.productData.variants[variantIndex].variantCost.toString()}',
              style: Theme.of(context).textTheme.tinier.copyWith(
                  decoration: TextDecoration.lineThrough, color: AppColor.grey),
            ),
            const SizedBox(width: xxxTinierSpacing),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.primaryLight,
                  borderRadius: BorderRadius.circular(kBorderDiscount)),
              padding: const EdgeInsets.symmetric(
                  vertical: xxTiniestSpacing, horizontal: xxTinierSpacing),
              child: Center(
                child: Text(
                    '${productDetailsModel.data.productData.variants[variantIndex].discount.toString()}%OFF',
                    style: Theme.of(context).textTheme.xTiniest.copyWith(
                        color: AppColor.primary, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
        BlocListener<AddToCartBloc, AddItemsToCartStates>(
          listener: (BuildContext context, state) {
            if (state is AddItemLoading) {
              ProgressBar.show(context);
            } else if (state is AddItemLoaded) {
              ProgressBar.dismiss(context);
            }
            if (state is AddItemsError) {
              ProgressBar.dismiss(context);

              showCustomSnackBar(context, state.message);

              const SizedBox();
            }
          },
          child: CounterScreen(
            prodId: productDetailsModel.data.productData.productId,
            variantId: productDetailsModel
                .data.productData.variants[variantIndex].variantId,
            height: kCartButtonHeight,
            width: kCartButtonWidth,
            title: 'ADD TO CART',
          ),
        ),
      ],
    );
  }
}
