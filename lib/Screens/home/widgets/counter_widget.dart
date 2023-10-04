import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/add_cart_item_bloc/add_cart_item_states.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:onecart_user_app/utils/snackbar_util.dart';
import 'package:onecart_user_app/widgets/progress_bar.dart';

import '../../../blocs/add_cart_item_bloc/add_cart_item_bloc.dart';
import '../../../blocs/add_cart_item_bloc/add_cart_item_event.dart';

import '../../../blocs/item_details_bloc/item_details_bloc.dart';
import '../../../blocs/item_details_bloc/item_details_events.dart';
import '../../../blocs/view_cart_bloc/view_cart_bloc.dart';
import '../../../blocs/view_cart_bloc/view_cart_events.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class CounterScreen extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final int? prodId;
  final int? variantId;
  final int counter;

  const CounterScreen({
    super.key,
    required this.counter,
    required this.height,
    required this.width,
    required this.title,
    required this.prodId,
    required this.variantId,
  });

  @override
  Widget build(BuildContext context) {
    log('counter========>$counter');
    int count = counter;
    bool isVisible = true;
    return BlocConsumer<AddToCartBloc, CartStates>(
        // buildWhen: (pre, curr) => (
        //     //curr is AddItemLoading ||
        //     //curr is AddItemInitial ||
        //     //curr is AddItemLoaded ||
        //     curr is IncrementCartItemLoaded ||
        //     curr is DecrementCartItemLoaded ||
        //     curr is IncrementCartItemLoading ||
        //     curr is DecrementCartItemLoading ||
        //     curr is DeleteCartItemLoading ||
        //     curr is DeleteCartItemLoaded),
        listener: (context, state) {
      if (state is AddItemLoading) {
        ProgressBar.show(context);
      } else if (state is AddItemLoaded) {
        ProgressBar.dismiss(context);
        context
            .read<ItemDetailsBloc>()
            .add(FetchItemDetails(prodId!, variantId!));
        if (state.addToTheCartModel.message == "Product already exists!") {
          showCustomSnackBar(context, state.addToTheCartModel.message);
        }
      }
    }, builder: (context, state) {
      if (count == 0) {
        isVisible = true;
      } else {
        isVisible = false;
      }
      return Visibility(
          replacement: SizedBox(
              height: kAddButtonHeight,
              width: kAddButtonWidth,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (count == 1) {
                          context.read<AddToCartBloc>().add(DeleteCartItem(
                              productId: prodId!, variantId: variantId!));
                          context
                              .read<GetAllCartItemsBloc>()
                              .add(GetAllCartItems());

                          count--;
                          isVisible = true;
                        } else {
                          count--;
                          context.read<AddToCartBloc>().add(
                              DecrementCartItemCount(
                                  variantId: variantId!, productId: prodId!));
                        }
                      },
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kAddRadius),
                          ),
                          side: const BorderSide(color: AppColor.primary)),
                      child: const Icon(
                        Icons.remove,
                        size: kCounterIcon,
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: Theme.of(context).textTheme.xxTinier.copyWith(
                          fontWeight: FontWeight.w500, color: AppColor.black),
                    ),
                    TextButton(
                        onPressed: () {
                          count++;
                          context.read<AddToCartBloc>().add(
                              IncrementCartItemCount(
                                  variantId: variantId!, productId: prodId!));
                        },
                        style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(kAddRadius),
                            ),
                            side: const BorderSide(color: AppColor.primary)),
                        child: const Icon(Icons.add, size: kCounterIcon))
                  ])),
          visible: isVisible,
          child: SizedBox(
              height: height,
              width: width,
              child: TextButton(
                  onPressed: () {
                    count++;
                    context.read<AddToCartBloc>().add(AddItemsToCart(
                          prodId: prodId!,
                          variantId: variantId!,
                        ));

                    isVisible = !isVisible;
                  },
                  style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          horizontal: tinierSpacing, vertical: tiniestSpacing),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kAddRadius)),
                      backgroundColor: AppColor.primary),
                  child: Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .xxxTinier
                          .copyWith(color: AppColor.white)))));
    });
  }
}
